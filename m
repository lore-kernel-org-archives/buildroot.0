From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 8 Sep 2014 05:53:22 +0000
Subject: [Buildroot] [PATCH v4] gcc: explicitly use
 C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace
In-Reply-To: <1409558133-17642-1-git-send-email-abrodkin@synopsys.com>
References: <1409558133-17642-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1410155602.4784.1.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-09-01 at 11:55 +0400, Alexey Brodkin wrote:
> From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> 
> The gcc.mk file is passing --enable-target-optspace to gcc configure
> script, to ask for space-optimized (-Os) target libraries. However,
> passing this option has the effect of overriding any custom
> CFLAGS_FOR_TARGET or CXXFLAGS_FOR_TARGET values that may be passed.
> 
> These are some situations when it is required to pass custom flags on buildong
> of libgcc:
>  * Default flags "-g -Os" lead to build isses as with PowerPC on gcc 4.5
> (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810)
>  * Particular CPU requires specific instructions for HW support
>  * Deep optimizations
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> 
> Compared to v3 use "=" instead of ":=" which is not actually required here.

I'm wondering if this version is fine and we may go ahead an apply it?

Regards,
Alexey
