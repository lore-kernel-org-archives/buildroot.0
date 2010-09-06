From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 Sep 2010 10:03:01 +0200
Subject: [Buildroot] [PATCH] bump kernel headers to latest stable,
	including scsi patch for latests kernel headers
In-Reply-To: <4C849D49.2040002@googlemail.com> (Marcus Osdoba's message of
	"Mon, 06 Sep 2010 09:50:33 +0200")
References: <1283626182-28176-1-git-send-email-marcus.osdoba@googlemail.com>
	<87fwxntj90.fsf@macbook.be.48ers.dk> <4C849D49.2040002@googlemail.com>
Message-ID: <87bp8bti2y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcus" == Marcus Osdoba <marcus.osdoba@googlemail.com> writes:

Hi,

 Marcus> I'm using git of the current debian squeeze (which ist 1.7.1 or so). I
 Marcus> used the built in git feature:
 Marcus> git format-patch
 Marcus> and
 Marcus> git send-email with the formerly generated patch

And this was from an uptodate clone of the buildroot tree with no other
local changes?

 Marcus> I have other patches in branch which introduce util-linux-ng. Can you
 Marcus> give the output of the git am error?

git am -3 -s /tmp/linux.patch                      ~/source/buildroot
Applying: bump kernel headers to latest stable, including scsi patch for latests kernel headers
Using index info to reconstruct a base tree...
<stdin>:146: trailing whitespace.
 
<stdin>:157: space before tab in indent.
 	__be16 service_action;
<stdin>:158: space before tab in indent.
 	/* service specific data follows */
<stdin>:173: trailing whitespace.
 
<stdin>:174: trailing whitespace.
 
error: patch failed: toolchain/kernel-headers/linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch:1
error: toolchain/kernel-headers/linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch: patch does not apply
error: patch failed: toolchain/kernel-headers/linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch:1
error: toolchain/kernel-headers/linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch: patch does not apply
Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Cannot fall back to three-way merge.
Patch failed at 0001 bump kernel headers to latest stable, including scsi patch for latests kernel headers
When you have resolved this problem run "git am -3 --resolved".
If you would prefer to skip this patch, instead run "git am -3 --skip".
To restore the original branch and stop patching run "git am -3 --abort".

I didn't see any obvious mangling of your patch (E.G. by your mailer),
but it doesn't like it.

 Marcus> Does this patch
 Marcus> (http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/24766) cause
 Marcus> the same error?

No, that one applies without problem.

-- 
Bye, Peter Korsgaard
