From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 22:14:58 +0200
Subject: [Buildroot] [PATCH 2/3] readline: install a .pc file
In-Reply-To: <20180422212005.13062-3-thomas.petazzoni@bootlin.com>
References: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
 <20180422212005.13062-3-thomas.petazzoni@bootlin.com>
Message-ID: <20180503221458.059ecd7f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Apr 2018 23:20:04 +0200, Thomas Petazzoni wrote:

> diff --git a/package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch b/package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch
> new file mode 100644
> index 0000000000..22b479cd91
> --- /dev/null
> +++ b/package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch
> @@ -0,0 +1,62 @@
> +From 7bbf2046fbcf4416ec226ecb3a2b4c6a5c263298 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 22 Apr 2018 23:06:28 +0200
> +Subject: [PATCH] configure.ac, readline.pc.in: fix Requires.private value
> +
> +The provided readline.pc.in hardcodes the fact that readline depends
> +on the tinfo library. However, different termcap implementation are
> +supported beyond tinfo. This commit improves the configure.ac script
> +to define a TERMCAP_PKG_CONFIG_LIB variable, which is then used in
> +readline.pc.in.
> +
> +This for example allows the generated readline.pc to properly contain
> +"Requires.private: ncurses" when ncurses is used as the termcap
> +implementation.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

For information, this patch has been applied upstream by the readline
maintainer. See
http://git.savannah.gnu.org/cgit/readline.git/commit/?h=devel&id=39cef351237a0d4467d3dc62a7710ea5e619b7e1.
(Yes it's one of those project that use Git in a very weird way).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
