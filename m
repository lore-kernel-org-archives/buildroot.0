Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8F6C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 12:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAAD983FF4;
	Sat, 30 Jul 2022 12:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAAD983FF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zp9RkCC6ABQ; Sat, 30 Jul 2022 12:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF28383F91;
	Sat, 30 Jul 2022 12:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF28383F91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB5781BF957
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93DA283FAA
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93DA283FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIt_nCpAtFUY for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 12:02:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1F3683F73
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 12:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F3683F73
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D904585ED0; Sat, 30 Jul 2022 11:49:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 13:45:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2689d901b077cf7f45d23d359619c87dd80a759
X-Git-Newrev: ae6e1444055e684ae15712eff79d7df06b74d2dc
X-Patchwork-Hint: ignore
Message-Id: <20220730114902.D904585ED0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/ccache-support.txt: document
 the new BR2_USE_CCACHE variable
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ae6e1444055e684ae15712eff79d7df06b74d2dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/ccache-support.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
index ea64628615..ab4f10be23 100644
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -55,3 +55,15 @@ first.
 See https://ccache.samba.org/manual.html#_compiling_in_different_directories[the
 ccache manual's section on "Compiling in different directories"] for
 more details about this rewriting of absolute paths.
+
+When +ccache+ is enabled in Buildroot using the +BR2_CCACHE=y+ option:
+
+* +ccache+ is used during the Buildroot build itself
+
+* +ccache+ is not used when building outside of Buildroot, for example
+  when directly calling the cross-compiler or using the SDK
+
+One can override this behavior using the +BR2_USE_CCACHE+ environment
+variable: when set to +1+, usage of ccache is enabled (default during
+the Buildroot build), when unset or set to a value different from +1+,
+usage of ccache is disabled.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
