Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FE0C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1681560E3C;
	Fri, 16 May 2025 11:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9hXigThH-Af; Fri, 16 May 2025 11:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B8861047
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B8861047;
	Fri, 16 May 2025 11:46:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F947185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84E464077F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IW7oIzVO7EPa for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:46:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7554140645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7554140645
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7554140645
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:46:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0628643850;
 Fri, 16 May 2025 11:46:33 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 16 May 2025 13:46:25 +0200
Message-ID: <20250516114626.110630-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedvfeffleduhefhveejtdfhieekgeetvddvjedvteefhffhffekkeelkeeghfdunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghuihhlughrohhothdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvght
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747395994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FSw09brA92vrRcwIzoM7D1YYHdRlHaMJDuuO+vi32gc=;
 b=e/SAT8LGReBIzsbavMmKc3bznxRWubfWhTQ4UILv/QhLSHHbbIS+Zl5+F54ncukIF5Y6ww
 14WEyPQGkVoB7mvi/Ru2kpIfI1/IvIRD92CmJ+kB+kXWAfHcffnH4qy4MyQkBJmoT13QKl
 WW5/HPK22B31zjlwCeQxrL1g7ejLarQ2jZzflwOxXTSQQd9XnV3LBtpw+Ncx75SyGN1XDs
 nGLNkd6MijdWAhnCe5HEzHCRmUZU3N7quxrzNryG4iCSeY9RiQjghduL242UHW/3GJH1ov
 qg9ViT6syDG8Tsc0X9Wf24DLNYh3Z4YWb8GHP91pBCdNT8h2Lo8W3BZ6OiiwxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e/SAT8LG
Subject: [Buildroot] [PATCH] package/libcap: backport upstream patch to fix
 build on Xtensa
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the bump of libcap to version 2.76 in commit
e2eb2ee58b9f70ebb83231537cca19bd28fa48de, the build started failing on
Xtensa. The bug was reported upstream at
https://bugzilla.kernel.org/show_bug.cgi?id=219915 and was
subsequently fixed by upstream commit:

  https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=6cdd8cd72ebcedd6b1b6c989a7e5722d5d87f35c

Which we backport in this commit.

Fixes:

  https://autobuild.buildroot.org/results/b9ff9258f407898eeee80dd8cc4dd1d777f44c06

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Support-for-__xtensa__-architecture.patch | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/libcap/0002-Support-for-__xtensa__-architecture.patch

diff --git a/package/libcap/0002-Support-for-__xtensa__-architecture.patch b/package/libcap/0002-Support-for-__xtensa__-architecture.patch
new file mode 100644
index 0000000000..a81a1952aa
--- /dev/null
+++ b/package/libcap/0002-Support-for-__xtensa__-architecture.patch
@@ -0,0 +1,65 @@
+From 9421f4ff93c341482d3aa4a0cd57aba1978bdd62 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Sat, 19 Apr 2025 08:00:23 -0700
+Subject: [PATCH] Support for __xtensa__ architecture.
+
+It looks like __xtensa__ defines SA_RESTORER, but my read of the
+kernel code suggests that signal handling does not require it be
+set. Specifically, if the SA_RESTORER flag is not set, the kernel
+inserts a sys_rt_sigreturn call into the stack frame.
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+Upstream: 6cdd8cd72ebcedd6b1b6c989a7e5722d5d87f35c
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ psx/psx_calls.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/psx/psx_calls.c b/psx/psx_calls.c
+index 8195964..aff105f 100644
+--- a/psx/psx_calls.c
++++ b/psx/psx_calls.c
+@@ -49,7 +49,8 @@
+     || defined(__powerpc__) || defined(__s390__) || defined(__riscv) \
+     || defined(__alpha__) || defined(__hppa__) || defined(__sh__) \
+     || defined(__m68k__) || defined(__sparc__) || defined(__arc__) \
+-    || defined(__microblaze__) || defined(__or1k__)
++    || defined(__microblaze__) || defined(__or1k__) \
++    || defined(__xtensa__)
+ 
+ #undef _NSIG
+ #undef _NSIG_BPW
+@@ -69,8 +70,7 @@
+ #define _NSIG_WORDS  (_NSIG / _NSIG_BPW)
+ 
+ #if defined(__x86_64__) || defined(__i386__) \
+-    || defined(__arm__) \
+-    || defined(__powerpc__) \
++    || defined(__arm__) || defined(__powerpc__) \
+     || defined(__arc__)
+ /* field used */
+ #define SA_RESTORER  0x04000000
+@@ -78,8 +78,9 @@
+ 
+ #if defined(SA_RESTORER) \
+     || defined(__aarch64__) \
+-    || defined(__m68k__) || defined(__sh__) || defined(__sparc__) \
+-    || defined(__s390__) || defined(__sparc__)
++    || defined(__m68k__) || defined(__sh__) \
++    || defined(__s390__) || defined(__sparc__) \
++    || defined(__xtensa__)
+ /* field defined */
+ #define _HAS_SA_RESTORER   void *sa_restorer;
+ #else
+@@ -93,7 +94,7 @@ typedef struct {
+ #define sigset_t psx_sigset_t
+ 
+ struct psx_sigaction {
+-#if defined(__m68k__) || defined(__alpha__)
++#if defined(__m68k__) || defined(__alpha__) || defined(__xtensa__)
+     void *sa_handler;
+     sigset_t sa_mask;
+     unsigned long sa_flags;
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
