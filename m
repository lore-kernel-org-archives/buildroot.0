Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86AEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:22:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A250B61206
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A250B61206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A1AC60805;
	Sat, 11 Sep 2021 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFNaD2FJMxJ8; Sat, 11 Sep 2021 14:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB69C607F6;
	Sat, 11 Sep 2021 14:22:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54C9D1BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43A2340597
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5eCkC45Icwk for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 549A540227
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 34B5D89018; Sat, 11 Sep 2021 14:20:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:16:40 +0200
Subject: [git commit] package/libiio: fix C# build
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9080d628aa8a350514bfe24a6ffbd0b37a74ba7e
X-Git-Newrev: 36be5e230559bd9e9b78dc6f38419b950572f38c
X-Patchwork-Hint: ignore
Message-Id: <20210911142032.34B5D89018@busybox.osuosl.org>
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=36be5e230559bd9e9b78dc6f38419b950572f38c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C# build is broken since bump to version 0.23 in commit
50b6d7d69f880e940d7c281c493a6a6694d6ebe3:

/tmp/instance-0/output-1/build/libiio-0.23/bindings/csharp/Device.cs(211,32): error CS0106: The modifier `readonly' is not valid for this item

Fixes:
 - http://autobuild.buildroot.org/results/a26cce9760c75c44ebdcf21dfb4a69aad5702de4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...getters-setters-cannot-be-marked-readonly.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch b/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch
new file mode 100644
index 0000000000..a665d48363
--- /dev/null
+++ b/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch
@@ -0,0 +1,32 @@
+From 85bf9cd32138539252ed01c355cf766612cf47c9 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul@crapouillou.net>
+Date: Thu, 2 Sep 2021 11:04:21 +0100
+Subject: [PATCH] C#: public fields with getters/setters cannot be marked
+ readonly
+
+MSVC would fail with the following error:
+error CS0106: The modifier 'readonly' is not valid for this item
+
+Reported-by: Raluca Chis <raluca.chis@analog.com>
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+
+[Retrieved from:
+https://github.com/analogdevicesinc/libiio/commit/85bf9cd32138539252ed01c355cf766612cf47c9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ bindings/csharp/Device.cs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bindings/csharp/Device.cs b/bindings/csharp/Device.cs
+index 96214243f..6c8c8f4f3 100644
+--- a/bindings/csharp/Device.cs
++++ b/bindings/csharp/Device.cs
+@@ -208,7 +208,7 @@ public override void write(string str)
+         public readonly string name;
+ 
+         /// <summary>The label of this device.</summary>
+-        public readonly string label { get; private set; }
++        public string label { get; private set; }
+ 
+         /// <summary>A <c>list</c> of all the attributes that this device has.</summary>
+         public readonly List<Attr> attrs;
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
