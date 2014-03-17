From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Mar 2014 22:23:51 +0100
Subject: [Buildroot] [PATCH] newt: bump to 0.52.17
In-Reply-To: <1395049225-11877-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 17 Mar 2014 10:40:25
 +0100")
References: <1395049225-11877-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87ob145xjs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Changed download location, added popt dependency and
 > updated the Makefile.in patch.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

It looks like it needs some help with gettext:

checking for gettext in -lc... no
checking for gettext in -lintl... no
configure: error: in `/home/peko/source/buildroot/output/build/newt-0.52.17':
configure: error: --enable-nls was specified, but the configure check failed
See `config.log' for more details
make: *** [/home/peko/source/buildroot/output/build/newt-0.52.17/.stamp_configured] Error 1

You probably just need to do the 'select BR2_PACKAGE_GETTEXT if
BR2_NEEDS_GETTEXT_IF_LOCALE' like E.G. avahi.

Care to fix this and send an updated patch? Thanks.

-- 
Bye, Peter Korsgaard
