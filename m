From: Michael Nosthoff <buildroot@heine.tech>
Date: Tue, 27 Oct 2020 15:13:08 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5Bautobuild=2Ebuildroot=2Enet=5D_Your_dai?=
 =?utf-8?q?ly_results_for_2020-10-26=2C_libabseil-cpp?=
Message-ID: <54-5f982b00-5-30c39040@76485822>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tuesday, October 27, 2020 09:12 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote: 
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>   aarch64    | host-libabseil-cpp-20200923.2  | http://autobuild.buildroot.net/results/5780d5e21e5e9c0ba86cc422ef995f45dc83cc4c
>  aarch64_be  | host-libabseil-cpp-20200923.2  | http://autobuild.buildroot.net/results/8138c63fc13940e1b97f07f24752b199f88ccfa8
>     arm      |    libabseil-cpp-20200923.2    | http://autobuild.buildroot.net/results/f8eda966c6400c242680db378c8944444d89d5c5
>   mips64el   |    libabseil-cpp-20200923.2    | http://autobuild.buildroot.net/results/38e9427d995e16bc4876f9fdc890c42e4fd04c06
>     mips     |    libabseil-cpp-20200923.2    | http://autobuild.buildroot.net/results/4e99415728a6f3c6b396a9872924262652f77996
>     arm      |    libabseil-cpp-20200923.2    | http://autobuild.buildroot.net/results/1830577843772bdfd6e310b4d361aa1edf5969d6
> 

The build fails because abseil stopped setting the C++11 build Flag itself. But that leads to another problem:

I just realized that, abseil also dropped support for gcc 4.8.x with the latest release. See [0]
We could add a dependency on gcc 4.9 (host and target). But this would also influence the grpc package which just depends on c++11.
The other option would be to revert the last version bump and keep this as long ad grpc keeps working with it
(grpc itself has still the old version as submodule).

What would be the preferred way to go?

Regards,
Michael

[0] https://abseil.io/docs/cpp/platforms/platforms#linux
> 
> -- 
> http://autobuild.buildroot.net
