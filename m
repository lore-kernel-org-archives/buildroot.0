From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 Aug 2013 08:59:41 -0300
Subject: [Buildroot] [PATCH] eglibc: defaults to SSP
In-Reply-To: <20130825111144.052f703c@skate>
References: <1374935524-5259-1-git-send-email-gustavo@zacarias.com.ar>
 <20130823210931.4f2323fc@skate> <5217BDD2.1020806@zacarias.com.ar>
 <20130825111144.052f703c@skate>
Message-ID: <5219F1AD.10004@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/25/2013 06:11 AM, Thomas Petazzoni wrote:

> Ok, so if we try to summarize this:
> 
>  * The option to enable SSP should be in "Build options" and not in the
>    "Toolchain" menu, because what it mainly does is adjust the
>    CFLAGS/CXXFLAGS for all packages.
> 
>  * In the case of the internal toolchain backend, it would make sure
>    that the SSP support in the C library in enabled. I.e, nothing for
>    eglibc/glibc, and enable SSP for uClibc.
> 
>  * In the case of the external toolchain backend, we would need to have
>    an option like "Toolchain supports SSP?" that the user must fill in.
>    But this would mean the "Use SSP" option in "Build options" would
>    have to depend on the "Toolchain supports SSP?" option.
> 
> Something like that?

Yes, i'd add for the last point "if custom external toolchain" because
we can determine if the predefined toolchain has ssp when it's
bumped/added with an internal knob.
It's possible libssp might need to be handled (copied) for some external
toolchains depending on age too and how they were configured.
Regards.
