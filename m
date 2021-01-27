From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 Jan 2021 18:56:57 +0100
Subject: [Buildroot] Issue with using PPL package for gcc 4.4.4
In-Reply-To: <MN2PR07MB69429BBBD323EA4CC815FBD7EDBB9@MN2PR07MB6942.namprd07.prod.outlook.com>
References: <MN2PR07MB69429BBBD323EA4CC815FBD7EDBB9@MN2PR07MB6942.namprd07.prod.outlook.com>
Message-ID: <20210127185657.66ee7728@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ramesh,

On Wed, 27 Jan 2021 03:46:46 +0000, Ramesh GK <ramesh.gk@hotmail.com> wrote:

> Hi,
>
> I have a need to use gcc 4.4.4 version for buildroot and trying to get the ppl package embedded within buildroot itself rather than using an external toolchain. I am facing this weird issue despite trying different options and looking for if anyone could help or have got success with setting up the ppl package within buildroot.
>
> I am also attaching the full log from buildroot specific to the package.
>
> Host Machine: gcc 4.9.2, gmp 6, mpfr 3.1.2, mpc 1.0.2, cloog 0.18.2, isl 0.12.2
>
> Buildroot Specification for build: gcc 4.4.4, gmp 4.3.2, mpfr 2.4.2, mpc 0.8.2, cloog-ppl 0.15.11, ppl 0.10.2
>
> Error:
> checking for the GMP library version 4.1.3 or above... no
> configure: error: Cannot find GMP version 4.1.3 or higher.
> GMP is the GNU Multi-Precision library:
> see http://www.swox.com/gmp/ for more information.
> When compiling the GMP library, do not forget to enable the C++ interface:
> add --enable-cxx to the configuration options.
> package/pkg-generic.mk:221: recipe for target '/home/mht/disk/mht/obuilds/template-4.4.4-2.6/build/host-ppl-0.10.2/.stamp_configured' failed
> make[1]: *** [/home/mht/disk/mht/obuilds/template-4.4.4-2.6/build/host-ppl-0.10.2/.stamp_configured] Error 1
> Makefile:23: recipe for target '_all' failed
> make: *** [_all] Error 2

Maybe missing:

	HOST_PPL_DEPENDENCIES += host-gmp

Regards,
Peter

>
> Thanks
> Ramesh GK
>
