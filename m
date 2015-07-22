From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 23:21:05 +0200
Subject: [Buildroot] [PATCH v5] gcc: explicitly use
 C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace
In-Reply-To: <1427205315-13864-1-git-send-email-abrodkin@synopsys.com>
References: <1427205315-13864-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150722232105.3daf086e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 24 Mar 2015 16:55:15 +0300, Alexey Brodkin wrote:
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
>  package/gcc/gcc.mk | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
