From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Sep 2009 23:23:37 +0200
Subject: [Buildroot] [PATCH] samba: fix dependencies
In-Reply-To: <1253562037.29667.13.camel@bender> (Sven Neumann's message of
	"Mon\, 21 Sep 2009 21\:40\:37 +0200")
References: <1253550113-31475-1-git-send-email-s.neumann@raumfeld.com>
	<87bpl4umnl.fsf@macbook.be.48ers.dk>
	<1253562037.29667.13.camel@bender>
Message-ID: <87vdjct2jq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> On Mon, 2009-09-21 at 21:23 +0200, Peter Korsgaard wrote:
 >> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
 >> 
 Sven> The samba configure scripts detects the presence of fam and avahi
 Sven> headers in order to decide whether support for fam and/or avahi should
 Sven> be built into samba. This patch adds the missing dependencies so that
 Sven> fam and/or avahi are built before samba if they are selected in buildroot.
 >> 
 >> Thanks, but it doesn't apply (which is slightly odd as your patches are
 >> the only thing changing samba.mk in 2009). Could you recreate against
 >> git please?

 Sven> Well, there is still the patch attached to bug #301 and I have that
 Sven> applied in our branch. I will merge the patch to the master branch and
 Sven> resend it...

Ahh yes. I just took a look at #301, and I just now noticed that the 2nd
make installlibs had DESTDIR set to staging rather than target, so now
it all makes sense to me ;)

I'll commit #301 and this one shortly - Sorry for the slow response.

-- 
Bye, Peter Korsgaard
