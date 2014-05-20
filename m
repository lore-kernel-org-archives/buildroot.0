From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 23:12:31 +0200
Subject: [Buildroot] [PATCH 1/1] matchbox-keyboard: Fix dependencies
In-Reply-To: <2sqs4bxc14.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Tue, 20 May 2014 22:34:42 +0200")
References: <1400601515-29764-1-git-send-email-bernd.kuhls@t-online.de>
 <87sio4gpso.fsf@dell.be.48ers.dk>
 <2sqs4bxc14.ln2@ID-313208.user.individual.net>
Message-ID: <877g5ggnnk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > Peter Korsgaard <jacmet@uclibc.org> wrote in
 > news:87sio4gpso.fsf at dell.be.48ers.dk: 

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

 > Hi,

 > I fail to see the connection between pango and cairo regarding the matchbox-
 > keyboard package.

Yes, sorry about that - I got confused about cairo vs pango, and the
original package author apparently did as well (as the above should have
been cairo, not pango).

I also see that there's a typo in the _CONF_OPT variable.

I'll fix it up here. I'm just doing a test build with/without cairo to
ensure everything is correct.

-- 
Bye, Peter Korsgaard
