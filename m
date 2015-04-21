From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 21 Apr 2015 13:49:54 +0000
Subject: [Buildroot] [PATCH v5] gcc: explicitly use
 C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace
In-Reply-To: <1427205315-13864-1-git-send-email-abrodkin@synopsys.com>
References: <1427205315-13864-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1429624194.2624.21.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2015-03-24 at 16:55 +0300, Alexey Brodkin wrote:
> The gcc.mk file is passing --enable-target-optspace to gcc configure
> script, to ask for space-optimized (-Os) target libraries. However,
> passing this option has the effect of overriding any custom
> CFLAGS_FOR_TARGET or CXXFLAGS_FOR_TARGET values that may be passed.
> 
> These are some situations when it is required to pass custom flags on
> buildong
> of libgcc:
>  * Default flags "-g -Os" lead to build isses as with PowerPC on gcc 4.5
> (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810)
>  * Particular CPU requires specific instructions for HW support
>  * Deep optimizations
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> Compared to v3 use "=" instead of ":=" which is not actually required here.
> Compared to v4 simply rebased on top of today's master
> ---

I just got a reminder about my pending Buildroot patches.

I'm still interested in that patch. We had a long discussion of that
change in the past and keeping in mind importance of the item (libgcc)
it indeed requires careful testing etc.

But maybe if we're OK with the change patch introduces we may try to
apply it and see how many problems autobuilder will produce with it.

-Alexey
