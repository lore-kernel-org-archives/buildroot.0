From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 15:55:14 +0100
Subject: [Buildroot] [PATCH] package/sdl_mixer: fix build after aclocal
 include revamp
In-Reply-To: <CAEyMn7Y83CUfmyRDU+d5JAg5n8PwEBge3vSsO+Txjf1M-cDkJw@mail.gmail.com>
References: <20200208182611.16087-1-yann.morin.1998@free.fr>
 <875zggvr40.fsf@dell.be.48ers.dk> <20200209140820.GN23769@scaer>
 <CAEyMn7Y83CUfmyRDU+d5JAg5n8PwEBge3vSsO+Txjf1M-cDkJw@mail.gmail.com>
Message-ID: <20200209145514.GO23769@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-02-09 15:41 +0100, Heiko Thiery spake thusly:
> Hi,?
> I also realized this packages but did not have the chance for a deeper look at it.

Can you avoid top-posting, please?

> --
> Heiko
> Yann E. MORIN < [1]yann.morin.1998@free.fr> schrieb am So., 9. Feb. 2020, 15:08:
> 
>   On 2020-02-08 20:03 +0100, Peter Korsgaard spake thusly:
>   > >>>>> "Yann" == Yann E MORIN < [2]yann.morin.1998@free.fr> writes:
>   >? > After d255b67972 (autotools: do not overwrite first include path), the
>   >? > ordering of include paths has changed: the system directories are
>   >? > specified with explicit options passed to autoreconf, which means that
>   >? > any directory specified in the package _AUTORECONF_OPTS are no longer
>   >? > first:
>   > Most likely we also need to fix a number of other packages:
>   > git grep '_AUTORECONF_OPTS ='
>   > package/asterisk/asterisk.mk:ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson
>   > package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk:GST_PLUGIN_X170_AUTORECONF_OPTS = -Im4/
>   > package/log4cpp/log4cpp.mk:LOG4CPP_AUTORECONF_OPTS = -I m4
>   > package/sdbusplus/sdbusplus.mk:SDBUSPLUS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
> 
>   gst-plugin-x170: we've removed it now.
> 
>   log4cpp builds OK.
> 
>   sdbusplus indeed fails, and it is not trivial to fix. I have a solution,
>   but it is ultimately ugly, which implies either we're in deep sh!t, or I
>   missed something obviously obvious (I'd bet on the latter).

I have a nice patch, shiny and all, but a little bit too involved in my
opinion. Patch incoming in a moment...

>   Which means that libsigrok may have the same issue as sdbusplus... I'll
>   try to come up with something saner for bot

libsigrok is a false-positive: it dnow longer needs host-autoconf-archive
anymore, I'll send an clean up patch any moment now...

>   I did not even dare look into asterisk for now...

(still afraid of even peekign in there...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
