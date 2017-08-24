From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 19:26:44 +0200
Subject: [Buildroot] pulseaudio isn't work on buildroot-2017.02.5
In-Reply-To: <1503571325385-173857.post@n4.nabble.com>
References: <1503571325385-173857.post@n4.nabble.com>
Message-ID: <20170824192644.56481029@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your report!

On Thu, 24 Aug 2017 03:42:05 -0700 (MST), Jonas wrote:
> E: [pulseaudio] main.c: Failed to find user 'pulse'.

So it complains that there is no user called "pulse". This is weird,
because in package/pulseaudio/pulseaudio.mk, we have:

ifeq ($(BR2_PACKAGE_PULSEAUDIO_DAEMON),y)
define PULSEAUDIO_USERS
        pulse -1 pulse -1 * /var/run/pulse - audio,pulse-access
endef

So, the pulse user should exist. Could you:

 - Check output/target/etc/passwd and see if a "pulse" user exists.

 - Make sure that this issue can be reproduced after doing a complete
   rebuild, i.e "make clean all".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
