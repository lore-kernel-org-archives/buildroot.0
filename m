From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jan 2018 16:45:17 +0100
Subject: [Buildroot] Migrated from 2017.08 to 2017.11, rfkill issues
In-Reply-To: <CAPzckP5y+dLADBwJ-pY52v_oNMyfJfwf73tJk-EdDN5VqLQ6fg@mail.gmail.com>
 (Sjoerd Venema's message of "Thu, 25 Jan 2018 15:47:09 +0100")
References: <CAPzckP5y+dLADBwJ-pY52v_oNMyfJfwf73tJk-EdDN5VqLQ6fg@mail.gmail.com>
Message-ID: <87tvvakkmq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sjoerd" == Sjoerd Venema <srg.venema@gmail.com> writes:

Adding Carlos Santos, who added the util-linux rfkill support.

 > Hi,
 > I just installed 2017.11 on a fresh machine and imported my config.
 > In 2017.11 I had used the rfkill package, so I got a notification that this
 > is now legacy, so I unchecked it in the "legacy" section. I noticed that it
 > was now selected at the util-linux section.

 > However, I get the following error, no matter if rfkill is selected or not:

You didn't paste the output of the configure step, but please check that
it passes --disable-rfkill is you disable the
BR2_PACKAGE_UTIL_LINUX_RFKILL option.

 >   CC       sys-utils/rfkill-rfkill.o
 >   CCLD     setsid
 > sys-utils/rfkill.c:67: error: ?RFKILL_TYPE_FM? undeclared here (not in a
 > function)

What is your toolchain configuration? RFKILL_TYPE_FM got added to the
kernel headers a long time ago (commit 875405a7793e9c35fa, during the
2.6.33 cycle), so it sounds quite odd that your toolchain doesn't know
it.

Do btw notice that I released 2017.11.2 last week with more (security)
fixes, so you might want to use that instead of 2017.11.1. It shouldn't
make a difference for rfkill though.

-- 
Bye, Peter Korsgaard
