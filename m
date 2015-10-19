From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 17:01:28 +0200
Subject: [Buildroot] [PATCH] iptables: add upstream patch fixing the
	message 'connlabel.conf not found'
In-Reply-To: <1445257360-31923-1-git-send-email-patrickdepinguin@gmail.com>
 (Thomas De Schampheleire's message of "Mon, 19 Oct 2015 14:22:40
 +0200")
References: <1445257360-31923-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <87vba27vhz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > In iptables versions 1.4.20 and 1.4.21, any call to iptables
 > would generate a message

 >     cannot open connlabel.conf, not registering 'connlabel' match: No
 >         such file or directory

Committed, thanks.

Do you see this with mainline buildroot? We do pass --disable-static for
!BR2_STATIC_LIBS builds, so I'm not sure how it could trigger for your?

But the fix does make sense for completely static builds.

-- 
Bye, Peter Korsgaard
