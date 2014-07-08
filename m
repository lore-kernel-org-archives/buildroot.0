From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2014 23:33:01 +0200
Subject: [Buildroot] [PATCH] dvb-apps: fix static only build
In-Reply-To: <1404848465-25296-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Jul 2014 21:41:05 +0200")
References: <1404848465-25296-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87simbwn76.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit makes dvb-apps behave properly in a static-only build. It
 > passes the static=1 variable to the Makefile, and adds a patch that
 > fixes the Makefile to not build .so libraries when static=1.

 > Fixes:

 >   http://autobuild.buildroot.org/results/3db/3dbfa7b692d4b123b3ba6b55c84df12818273554/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > +++ b/package/dvb-apps/dvb-apps.mk
 > @@ -15,19 +15,26 @@ DVB_APPS_DEPENDENCIES = libiconv
 >  DVB_APPS_LDLIBS += -liconv
 >  endif
 
 > +DVB_APPS_MAKE_OPTS = V=1
 > +

Committed with this removed as pointed out by Yann, thanks.

-- 
Bye, Peter Korsgaard
