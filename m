From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Aug 2011 10:28:35 +0200
Subject: [Buildroot] util-linux compile problems
In-Reply-To: <1313049366.16546.4.camel@sven> (Sven Neumann's message of "Thu, 
 11 Aug 2011 09:56:05 +0200")
References: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
 <87fwlblqxr.fsf@macbook.be.48ers.dk>
 <87y5z3k92i.fsf@macbook.be.48ers.dk> <1312883451.1593.3.camel@sven>
 <87hb5qk6rn.fsf@macbook.be.48ers.dk> <1313049366.16546.4.camel@sven>
Message-ID: <877h6jhw3w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> That fix seems to do the trick. But now the build fails when it tries to
 Sven> install the translations:

 Sven> Making install in po
 Sven> make[2]: Entering directory
 Sven> `/home/sven/git/buildroot/output/build/util-linux-2.19.1/po'
 Sven> /bin/sh
 Sven> @MKINSTALLDIRS@ /home/sven/git/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share
 Sven> /bin/sh: Can't open @MKINSTALLDIRS@
 Sven> make[2]: *** [install-data-yes] Error 127

Ahh, see it now. I've fixed it in git. The problem is that util-linux
use mkinstalldirs to install .po files, and it gets the definition of it
from a custom nls.m4 (based on the one from gettext). If you have
gettext enabled, then we end up using that one instead when we
autoreconf util-linux.

-- 
Bye, Peter Korsgaard
