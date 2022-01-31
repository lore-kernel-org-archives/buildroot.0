Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A15C4332F
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 10:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10E684061F;
	Mon, 31 Jan 2022 10:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abTBENyhCbKN; Mon, 31 Jan 2022 10:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFE754057F;
	Mon, 31 Jan 2022 10:32:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3F051BF3D8
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 10:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF3C14060F
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 10:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvP_KqEElz16 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 10:32:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AC6B4057F
 for <buildroot@uclibc.org>; Mon, 31 Jan 2022 10:32:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 8E7DB827B3; Mon, 31 Jan 2022 10:25:44 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 31 Jan 2022 10:32:47 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: f.rogall@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-14366-163-4Vp9MmjWFK@https.bugs.busybox.net/>
In-Reply-To: <bug-14366-163@https.bugs.busybox.net/>
References: <bug-14366-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14366] 2021.11-rc2: Build of nodejs fails with
 "version `GLIBC_2.34' not found" on Ubuntu 20.04
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

https://bugs.busybox.net/show_bug.cgi?id=14366

Frank Rogall <f.rogall@gmx.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |f.rogall@gmx.de

--- Comment #1 from Frank Rogall <f.rogall@gmx.de> ---
Bug still exists in 2021.11.1 with nodejs-14.18.3 
Ubuntu 20.04.3 LTS

/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/bytecode_builtins_list_generator:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by
/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/bytecode_builtins_list_generator)
make[3]: *** [tools/v8_gypfiles/generate_bytecode_builtins_list.target.mk:13:
/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/obj/gen/generate-bytecode-output-root/builtins-generated/bytecodes-builtins-list.h]
Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
