From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 23:01:03 +0200
Subject: [Buildroot] [PATCH 1/1] matchbox-keyboard: Fix dependencies
In-Reply-To: <20140520224331.74d22bcd@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 20 May 2014 22:43:31 +0200")
References: <1400601515-29764-1-git-send-email-bernd.kuhls@t-online.de>
 <87sio4gpso.fsf@dell.be.48ers.dk>
 <20140520224331.74d22bcd@free-electrons.com>
Message-ID: <87fvk4go6o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Tue, 20 May 2014 22:26:15 +0200, Peter Korsgaard wrote:

 >> > -################################################################################
 >> > -
 >> > -ifeq ($(BR2_PACKAGE_PANGO),y)
 >> > -  MATCHBOX_PKEYBOARD_CONF_OPT += --enable-pango
 >> > -else
 >> > -  MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 >> > -endif
 >> 
 >> No?
 >> 
 >> ./configure --help|grep cairo
 >> --enable-cairo    enable experimental Cairo support default=no

 > Hum cairo != pango ?

Ehh, true. I guess I need to go to bed.

With that said, I think the fix is simply to s/pango/cairo/.

-- 
Bye, Peter Korsgaard
