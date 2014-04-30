From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 30 Apr 2014 07:19:59 +0000
Subject: [Buildroot] [PATCH v3] uboot-tools: bump to version 2014.04
In-Reply-To: <877g67thh9.fsf@dell.be.48ers.dk>
References: <1398840891-19524-1-git-send-email-abrodkin@synopsys.com>
 <877g67thh9.fsf@dell.be.48ers.dk>
Message-ID: <1398842399.21385.2.camel@abrodkin-8560l>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, 2014-04-30 at 09:16 +0200, Peter Korsgaard wrote:
> >>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> 
>  > U-Boot v2014.04 introduced significant changes in its build infrastrcture.
>  > Among things related to buildroot are:
>  > 1. Special new target ("tools-only") was added for building host tools alone
> 
>  > 2. Tools cross-building for target is no longer possible with substitution of
>  > HOSTxx with TARGETxx because host binaries won't be built. Instead we just set
>  > CROSS_COMPILE and CROSS_BUILD_TOOLS variables.
> 
>  > 3. Most of make targets now require U-Boot to be configured before building.
>  > So for building generic "fw_printenv" we now need to make "env" target config-
>  > independent.
> 
>  > 4. HOSTCPPFLAGS are only applicable to .cpp files so dropping
>  > "uboot-tools-02-hostcflags-override-fix.patch"
> 
> That's not true. They are flags for the preprocessor. You must be
> confusing them with CXXFLAGS.
> 
> With that said, I think we're passing everything from HOST_CPPFLAGS
> through HOST_CFLAGS as well, so it shouldn't matter.

Ok I think I did confused wit CXXFLAGS.

But I haven't found any mention of HOSTCPPFLAGS in current U-Boot so I'm
wondering if we still need to add any handling of HOSTCPPFLAGS in U-Boot
or there's nothing to be done?

Regards,
Alexey
