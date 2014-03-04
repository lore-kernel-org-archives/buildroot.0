From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 4 Mar 2014 20:24:10 +0100
Subject: [Buildroot] [PATCH] libubox: new package
In-Reply-To: <20140304183243.GA11474@free.fr>
References: <1391080311-30640-1-git-send-email-yegorslists@googlemail.com>
 <20140303232457.GC14940@free.fr>
 <CAGm1_ksZJ0xQnTTUSmGVQZVfDwCaeZGf=nopB8_usH8pii43Ag@mail.gmail.com>
 <20140304183243.GA11474@free.fr>
Message-ID: <CAGm1_ksi7DYLuC5vUdSBekjMkbATKWU0RQCgWz+eE2__PJyVBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 4, 2014 at 7:32 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2014-03-04 07:59 +0100, Yegor Yefremov spake thusly:
>> On Tue, Mar 4, 2014 at 12:24 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > Yegor, All,
>> >
>> > Thanks for your contribution! Some comments below...
>> >
>> > On 2014-01-30 12:11 +0100, yegorslists at googlemail.com spake thusly:
>> > [--SNIP--]
>> >> diff --git a/package/libubox/Config.in b/package/libubox/Config.in
>> >> new file mode 100644
>> >> index 0000000..c6efb33
>> >> --- /dev/null
>> >> +++ b/package/libubox/Config.in
>> >> @@ -0,0 +1,6 @@
>> >> +config BR2_PACKAGE_LIBUBOX
>> >> +     bool "libubox"
>> >> +     help
>> >> +       Small utility library for OpenWrt.
>> >
>> > In what way would this be of interest to Buildroot?
>> >
>> > Since this is "for OpenWRT", I fail to see the relevance to Buildroot.
>>
>> My goal is to port libuci to Buildroot as I have some software, that
>> I've written for OpenWRT and now would like to use in BR too. The
>> software uses /etc/config/* infrastructure to access its configuration
>> files via libuci.
>> libubox it a dependency of libuci.
>
> Ah, I see. Then, please say so in the help text (the one you provided is
> not really interesting, as it does not say what libubox does).

You're right. I'll post both patches for libubox and libuci. And who
knows, perhaps we would be able to run LuCI especially LuCI2 on BR.

>> > This is not correct:
>> >   - most of the files have a license header that do not reference the
>> >     LGPLv2.1, but which I did not recognise  [0]
>
> It might be MIT:
>     http://spdx.org/licenses/MIT
>
>> >   - some have a BSD-3c license: avl.c
>> >   - at least one file is GPLv2: md5.c
>>
>> Hm. That's really odd. Should I omit license information for now?
>
> No, just state all of them:
>     _LICENSES = GPLv2, BSD-3c, MIT
>
>> >> +LIBUBOX_INSTALL_STAGING = YES
>> >> +LIBUBOX_CONF_OPT = -DBUILD_LUA:BOOL=OFF
>> >
>> > Maybe that could be made conditional on whether lua is enabled or not?
>>
>> I wanted to start with a simple configuration, as I don't need Lua
>> right now, but I'll incorporate this feature in the v2.
>
> OK, that's fine. If you don't use it, and so don't test it, there's no
> reason to add it. If someone (or you, later) is interested in it, he'll
> send a patch.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
