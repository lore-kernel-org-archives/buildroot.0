From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 10:05:06 +0100
Subject: [Buildroot] [PATCH 4/7] package/civetweb: fix build error on a
	host with make v4.0
In-Reply-To: <1425028764-1146-5-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Fri, 27 Feb 2015 10:19:21 +0100")
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
 <1425028764-1146-5-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87egpaz9rx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Add a patch to fix a typo that on a system with make v4.0 and
 > BR2_CIVETWEB_WITH_LUA=y fails to build:
 >   Makefile:203: *** mixed implicit and normal rules.  Stop.

 > The patch was not sent upstream because this problem is already fixed on
 > master.

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Committed, thanks.

Strangely enough, make on my system (Debian 4.0-8.1) only warns about
the syntax:

Makefile:203: *** mixed implicit and normal rules: deprecated syntax

With the patch applied I get another warning, but that can probably be
ignored:

Makefile:203: target 'out/src/third_party' given more than once in the same rule

-- 
Bye, Peter Korsgaard
