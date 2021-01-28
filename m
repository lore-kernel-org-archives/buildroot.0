From: Ramesh GK <ramesh.gk@hotmail.com>
Date: Thu, 28 Jan 2021 02:33:07 +0000
Subject: [Buildroot] Issue with using PPL package for gcc 4.4.4
In-Reply-To: <20210127185657.66ee7728@gmx.net>
References: <MN2PR07MB69429BBBD323EA4CC815FBD7EDBB9@MN2PR07MB6942.namprd07.prod.outlook.com>,
 <20210127185657.66ee7728@gmx.net>
Message-ID: <MN2PR07MB6942108AB1EDC6F6739E6205EDBA9@MN2PR07MB6942.namprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I tried that approach as you have suggested but it did not work. The problem looks to be something with how the linking is happening i believe but not sure.

On the same host, I did try with crosstool-ng to verify and it worked successfully but is failing within buildroot.

I am happy to explore further if there are more ideas on how to resolve this issue.

Thanks
Ramesh GK


________________________________
From: Peter Seiderer <ps.report@gmx.net>
Sent: Wednesday, January 27, 2021 12:56 PM
To: Ramesh GK <ramesh.gk@hotmail.com>
Cc: buildroot at busybox.net <buildroot@busybox.net>
Subject: Re: [Buildroot] Issue with using PPL package for gcc 4.4.4

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
> see https://na01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.swox.com%2Fgmp%2F&amp;data=04%7C01%7C%7Ca775b8c8aec348ea527608d8c2ecf22a%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637473670213477536%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=YyGYvguNfZPj%2FgckM%2BX5wmDIr%2BnfxAgWoYAYkp5DneY%3D&amp;reserved=0 for more information.
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

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210128/318385b0/attachment.html>
