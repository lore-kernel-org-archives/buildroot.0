From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 23:20:31 +0100
Subject: [Buildroot] [PATCH] package/luasyslog: bump to version 2.2.0
 (fork)
In-Reply-To: <20200422092253.25466-1-francois.perrad@gadz.org>
References: <20200422092253.25466-1-francois.perrad@gadz.org>
Message-ID: <20210107232031.2ac9e312@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Wed, 22 Apr 2020 11:22:53 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> this fork has a good support for Lua 5.3the initial 1.0.0 is available as rock (which contains a tarball)
> https://luarocks.org/modules/luarocks/luasyslog
> but there is no public repository.
> 
> the fork has a public repository
> https://github.com/ntd/luasyslog/
> it is available as rock
> https://luarocks.org/modules/ntd/luasyslog
> unfortunately the rockspec uses a build method unavaible in our BR luarocks infrastructure
> so, the autotools infrastructure must replace the luarocks one.
> 
> this fork has a good support for Lua 5.3
> so, the patch "compat Lua 5.3" becomes useless.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

I've applied after reworking the commit log quite a bit. Also, some
other changes, see below.

> -LUASYSLOG_VERSION = 1.0.0-2
> +LUASYSLOG_VERSION = 2.2.0
> +LUASYSLOG_SITE = $(call github,ntd,luasyslog,$(LUASYSLOG_VERSION))
> +LUASUSLOG_DEPENDENCIES = luainterpreter

Typo: LUASUSLOG_DEPENDENCIES should have been LUASYSLOG_DEPENDENCIES.
This was caught by "make check-package", so you could have seen it.

>  LUASYSLOG_LICENSE = MIT
> -LUASYSLOG_LICENSE_FILES = $(LUASYSLOG_SUBDIR)/COPYING
> +LUASYSLOG_LICENSE_FILES = COPYING
> +LUASYSLOG_AUTORECONF = YES

I've added a comment that says why autoreconf is needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
