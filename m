From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 22:24:57 +0100
Subject: [Buildroot] [PATCH v3 4/9] package/asterisk: enable for uclibc
 toolchains
In-Reply-To: <20181014090202.31122-4-bernd.kuhls@t-online.de>
References: <20181014090202.31122-1-bernd.kuhls@t-online.de>
 <20181014090202.31122-4-bernd.kuhls@t-online.de>
Message-ID: <20181209222457.25c3f49c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Oct 2018 11:01:56 +0200, Bernd Kuhls wrote:
> This patch extends the configure checks for re-entrant resolver
> functions to fix uclibc builds.
> 
> Quoting Yann:
> http://lists.busybox.net/pipermail/buildroot/2017-September/203004.html
> 
> "As a final stroke of genius, asterisk checks for the re-entrant variant
> of res_ninit(), and concludes that all such functions are available,
> including res_nsearch(). Uclibc-ng has the former but not the latter, so
> the build fails. Since there is no cache variable for that check, we
> can't pre-feed that result to configure, and fixing it is a bigger
> endeavour. So we make asterisk depend on glibc for now, until someone
> is brave enough to fix it."
> 
> Musl builds are still broken:
> 
> output/build/asterisk-16.0.0/include/asterisk/astmm.h:165:35:
>  error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?->? token
>   Do_not_use_calloc__use_ast_calloc->fail(a, b)
> 
> output/build/asterisk-16.0.0/include/asterisk/astmm.h:169:77:
>  error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?->? token
>   Do_not_use_free__use_ast_free_or_ast_std_free_for_remotely_allocated_memory->fail(a)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: restricted to uclibc, musl is still broken
> v2: Replaced sed hack with configure.ac patch (Yann, Arnout, Thomas)
>     patch upstream status: pending, waiting for CLA approval:
>     https://wiki.asterisk.org/wiki/display/AST/Patch+Contribution+Process

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
