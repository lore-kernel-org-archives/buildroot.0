From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Oct 2020 15:54:43 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-26, libabseil-cpp
In-Reply-To: <54-5f982b00-5-30c39040@76485822>
References: <54-5f982b00-5-30c39040@76485822>
Message-ID: <20201027155443.4cf65e7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Oct 2020 15:13:08 +0100
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> The build fails because abseil stopped setting the C++11 build Flag itself. But that leads to another problem:
> 
> I just realized that, abseil also dropped support for gcc 4.8.x with the latest release. See [0]
> We could add a dependency on gcc 4.9 (host and target). But this would also influence the grpc package which just depends on c++11.
> The other option would be to revert the last version bump and keep this as long ad grpc keeps working with it
> (grpc itself has still the old version as submodule).
> 
> What would be the preferred way to go?

Having a dependency of libabseil on gcc >= 4.9 is fine, even if that
implies that grpc also needs such a dependency.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
