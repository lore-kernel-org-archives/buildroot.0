From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Sep 2018 08:46:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/gdb: use stat() privided by the
 system
In-Reply-To: <20180910224128.GT1878@brightrain.aerifal.cx>
References: <20180909163750.14196-1-romain.naour@gmail.com>
 <20180909163750.14196-2-romain.naour@gmail.com>
 <20180910174900.0b9f4133@windsurf>
 <d588888e-dccc-50c8-5a6e-9c5c46a512cb@smile.fr>
 <20180910224128.GT1878@brightrain.aerifal.cx>
Message-ID: <20180911084659.786da210@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Sep 2018 18:41:28 -0400, Rich Felker wrote:

> I'm not aware of all the context, but it looks like different source
> files disagree on whether gnulib has replaced stat or not -- the
> gnulib source file thinks it hasn't, so the rpl_stat function isn't
> defined, but gdb's common-utils-ipa.c file (or rather the gnulib
> stat.h included into it?) thinks it has been replaced and is trying to
> use the replacement. This is likely the result of an incorrect hack
> somewhere. Do you know if it happens with upstream gdb and musl or
> just in buildroot's package?

Well, Buildroot is using upstream musl and gdb. For both packages, we
have only very few patches:

  https://git.buildroot.org/buildroot/tree/package/musl/
  https://git.buildroot.org/buildroot/tree/package/gdb/8.1.1/

Note that we already have a number of gnulib related hacks in gdb.mk:

  https://git.buildroot.org/buildroot/tree/package/gdb/gdb.mk#n77

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
