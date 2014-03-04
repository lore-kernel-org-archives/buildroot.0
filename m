From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 4 Mar 2014 07:59:04 +0100
Subject: [Buildroot] [PATCH] libubox: new package
In-Reply-To: <20140303232457.GC14940@free.fr>
References: <1391080311-30640-1-git-send-email-yegorslists@googlemail.com>
 <20140303232457.GC14940@free.fr>
Message-ID: <CAGm1_ksZJ0xQnTTUSmGVQZVfDwCaeZGf=nopB8_usH8pii43Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 4, 2014 at 12:24 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Yegor, All,
>
> Thanks for your contribution! Some comments below...
>
> On 2014-01-30 12:11 +0100, yegorslists at googlemail.com spake thusly:
> [--SNIP--]
>> diff --git a/package/libubox/Config.in b/package/libubox/Config.in
>> new file mode 100644
>> index 0000000..c6efb33
>> --- /dev/null
>> +++ b/package/libubox/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_LIBUBOX
>> +     bool "libubox"
>> +     help
>> +       Small utility library for OpenWrt.
>
> In what way would this be of interest to Buildroot?
>
> Since this is "for OpenWRT", I fail to see the relevance to Buildroot.

My goal is to port libuci to Buildroot as I have some software, that
I've written for OpenWRT and now would like to use in BR too. The
software uses /etc/config/* infrastructure to access its configuration
files via libuci.
libubox it a dependency of libuci.

I've also found libuci installation tutorials for Ubuntu :-)
http://www.wakoond.hu/2013/06/using-uci-on-ubuntu.html

>> +       http://nbd.name/gitweb.cgi?p=luci2/libubox.git;a=summary
>> diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
>> new file mode 100644
>> index 0000000..ec8fbdb
>> --- /dev/null
>> +++ b/package/libubox/libubox.mk
>> @@ -0,0 +1,13 @@
>> +################################################################################
>> +#
>> +# libubox
>> +#
>> +################################################################################
>> +
>> +LIBUBOX_VERSION = bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b
>> +LIBUBOX_SITE = git://nbd.name/luci2/libubox.git
>> +LIBUBOX_LICENSE = LGPLv2.1
>
> This is not correct:
>   - most of the files have a license header that do not reference the
>     LGPLv2.1, but which I did not recognise  [0]
>   - some have a BSD-3c license: avl.c
>   - at least one file is GPLv2: md5.c

Hm. That's really odd. Should I omit license information for now?

> [0]
>  * Copyright (C) 2012 Felix Fietkau <nbd@openwrt.org>
>  *
>  * Permission to use, copy, modify, and/or distribute this software for any
>  * purpose with or without fee is hereby granted, provided that the above
>  * copyright notice and this permission notice appear in all copies.
>  *
>  * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
>  * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
>  * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
>  * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
>  * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
>  * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
>  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
>
>> +LIBUBOX_INSTALL_STAGING = YES
>> +LIBUBOX_CONF_OPT = -DBUILD_LUA:BOOL=OFF
>
> Maybe that could be made conditional on whether lua is enabled or not?

I wanted to start with a simple configuration, as I don't need Lua
right now, but I'll incorporate this feature in the v2.

Yegor
