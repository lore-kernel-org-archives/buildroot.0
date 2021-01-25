From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:48:40 +0100
Subject: [Buildroot] [PATCH 2/3] package/perl-gd: needs
 perl-extutils-pkgconfig
In-Reply-To: <20210124112214.480254-2-fontaine.fabrice@gmail.com>
References: <20210124112214.480254-1-fontaine.fabrice@gmail.com>
 <20210124112214.480254-2-fontaine.fabrice@gmail.com>
Message-ID: <20210125214840.78cd755e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Fran?ois in Cc.

On Sun, 24 Jan 2021 12:22:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +- at INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
> ++#@INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;

I'm certainly not very good with Perl, but doesn't the "unless @INC"
means "if INC is not already specified" ?

> + @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;

And isn't that a problem, too ? These library paths are pretty horrible
for cross-compilation.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
