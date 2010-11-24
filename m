From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Nov 2010 22:36:25 +0100
Subject: [Buildroot] [PATCH v2] linux: strip installed modules
In-Reply-To: <201011241620.45723.vapier@gentoo.org> (Mike Frysinger's message
	of "Wed, 24 Nov 2010 16:20:44 -0500")
References: <87oc9nad27.fsf@macbook.be.48ers.dk>
	<1290038143-17595-1-git-send-email-vapier@gentoo.org>
	<87r5ea4emv.fsf@macbook.be.48ers.dk>
	<201011241620.45723.vapier@gentoo.org>
Message-ID: <87aaky4d5y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 >> Committed with a small change to not use binutils strip specific
 >> options (we support sstrip as well).

 Mike> so STRIP_STRIP_UNNEEDED should have those flags added to it for
 Mike> the binutils case ... i'll send a patch to fix that.  otherwise
 Mike> we're leaving a crap in the target fs that only takes up space.
 Mike> -mike

STRIPCMD already has --remove-section=.comment --remove-section=.note,
what else are you missing?

-- 
Bye, Peter Korsgaard
