Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0692DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 05:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 766E36118E;
	Wed, 30 Mar 2022 05:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FmkeoaCvlUCh; Wed, 30 Mar 2022 05:33:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D2A16118A;
	Wed, 30 Mar 2022 05:33:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F6021BF951
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 05:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0961940A97
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 05:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZM8J2S1dmsXs for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 05:33:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59293400FD
 for <buildroot@uclibc.org>; Wed, 30 Mar 2022 05:33:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 32C1885F4E; Wed, 30 Mar 2022 05:23:52 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 30 Mar 2022 05:33:06 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: w.meganck@televic.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14711-163-iJpDOcWke5@https.bugs.busybox.net/>
In-Reply-To: <bug-14711-163@https.bugs.busybox.net/>
References: <bug-14711-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14711] nodjs build problem missing bzip
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14711

--- Comment #5 from Wim Meganck <w.meganck@televic.com> ---
I made following changes in the .config:
BR2_PACKAGE_HOST_PYTHON3=y
BR2_PACKAGE_HOST_PYTHON3_BZIP2=y
BR2_PACKAGE_BZIP2=y
BR2_PACKAGE_PYTHON3_BZIP2=y

Rebuild bzip and python3.
Run make
_bz2 is still in the list of DISABLED_EXTENSIONS
_bz2.*.so is still missing in output/host/lib/python3.10/lib-dynload

But still same error

Node.js configure: Found Python 3.10.2...
Traceback (most recent call last):
  File
"/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/./configure",
line 30, in <module>
    import configure
  File
"/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/configure.py",
line 14, in <module>
    import bz2
  File
"/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/lib/python3.10/bz2.py",
line 17, in <module>
    from _bz2 import BZ2Compressor, BZ2Decompressor
ModuleNotFoundError: No module named '_bz2'
package/pkg-generic.mk:272: recipe for target
'/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/.stamp_configured'
failed
make[1]: ***
[/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/.stamp_configured]
Error 1
Makefile:23: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
