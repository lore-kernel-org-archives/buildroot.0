From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Sep 2016 22:38:42 +0200
Subject: [Buildroot] [PATCH] package/ustr: reallt fix ldconfig
In-Reply-To: <1474910414-13176-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 26 Sep 2016 19:20:14 +0200")
References: <1474910414-13176-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87inti2y7h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In 99067c1 (package/ustr: don't run ldconfig), we tried to fix parallel
 > build issues, caused by running ldconfig, by not running ldconfig.

 > We borked that fix, as build issues still crop up from time to time:
 > ldconfig is still run because our override is not accounted for by
 > ustr's buildsystem. Instead of overriding ldocnifg at build time, we
 > need to override it at configure time.

 > Just do that.

 > Fixes:
 >     http://autobuild.buildroot.org/results/7b1/7b12f00612da4ad8dffe0c8010b95db881630b17/
 >     http://autobuild.buildroot.org/results/242/24209ba13f56889357024b0e460d508b7a03d1d2/
 >     http://autobuild.buildroot.org/results/963/963141370a9b127f473a7fae161656a6b0a4f33b/

 > (Those are the only three build issues in the more-than-a-month since we
 > initially tried to fix that.)

 > To be noted: upstream has accepted my patch, plus they completely
 > removed calls to ldconfig altogether. Add a comment so we don;t forget
 > to remove our workaround when we bump.

Committed after fixing a few typos, thanks.

-- 
Bye, Peter Korsgaard
