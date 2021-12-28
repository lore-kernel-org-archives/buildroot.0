Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB67C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 20:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64F4240884;
	Tue, 28 Dec 2021 20:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8PfYVI77POPN; Tue, 28 Dec 2021 20:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAB034087D;
	Tue, 28 Dec 2021 20:21:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5379F1BF9AC
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F679400C7
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDK2-Bw4UCFU for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 20:21:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CED2400AB
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 20:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 63F8582BDB; Tue, 28 Dec 2021 20:15:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 21:20:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 396c2513253b38789f0ef46873870530a5fa4968
X-Git-Newrev: d0b4b8418b25e08845a6630aabe7ca11bb802128
X-Patchwork-Hint: ignore
Message-Id: <20211228201531.63F8582BDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bento4: add ism segfault patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0b4b8418b25e08845a6630aabe7ca11bb802128
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-segfault-in-AP4_LinearReader-ProcessMoof.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/bento4/0016-Fix-segfault-in-AP4_LinearReader-ProcessMoof.patch b/package/bento4/0016-Fix-segfault-in-AP4_LinearReader-ProcessMoof.patch
new file mode 100644
index 0000000000..cbcc62f982
--- /dev/null
+++ b/package/bento4/0016-Fix-segfault-in-AP4_LinearReader-ProcessMoof.patch
@@ -0,0 +1,27 @@
+From e5b37c1e0a7a84fdc7b403c5e30a5e93706104b8 Mon Sep 17 00:00:00 2001
+From: Dobroslaw Kijowski <dobo90@gmail.com>
+Date: Tue, 19 Oct 2021 14:17:11 +0200
+Subject: [PATCH] Fix segfault in Ap4LinearReader ProcessMoof
+
+Downloaded from https://github.com/xbmc/inputstream.adaptive/pull/856
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4LinearReader.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/C++/Core/Ap4LinearReader.cpp b/Source/C++/Core/Ap4LinearReader.cpp
+index 61c3a9d..2464865 100644
+--- a/Source/C++/Core/Ap4LinearReader.cpp
++++ b/Source/C++/Core/Ap4LinearReader.cpp
+@@ -329,7 +329,7 @@ AP4_LinearReader::ProcessMoof(AP4_ContainerAtom* moof,
+         tracker->m_SampleTable = NULL;
+         tracker->m_NextSampleIndex = 0;
+         for (unsigned int j=0; j<ids.ItemCount(); j++) {
+-            if (ids[j] == tracker->m_Track->GetId()) {
++            if (ids.ItemCount()==1 || ids[j] == tracker->m_Track->GetId()) {
+                 AP4_FragmentSampleTable* sample_table = NULL;
+                 result = m_Fragment->CreateSampleTable(&m_Movie, 
+                                                        ids[j], 
+-- 
+2.33.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
