Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C18CE8D5D
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 08:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EFF742479;
	Thu, 19 Sep 2024 08:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1D7h3UuLQw7A; Thu, 19 Sep 2024 08:19:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9389424A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9389424A7;
	Thu, 19 Sep 2024 08:19:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D93601BF325
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 08:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7D1040286
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 08:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bG7Zdygn3W0c for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 08:18:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.81;
 helo=smtp40.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C900540193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C900540193
Received: from smtp40.i.mail.ru (smtp40.i.mail.ru [95.163.41.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C900540193
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 08:18:56 +0000 (UTC)
Received: by smtp40.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1srCNJ-0000000BupO-2aFl; Thu, 19 Sep 2024 11:18:54 +0300
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:18:19 +0300
Message-ID: <20240919081820.1363577-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD96E52E9D942F25A5FE0F4C8AADDA49724D81F899678C50E6500894C459B0CD1B9FAE9960B504DFB41FFB36B11FB8673C21D7141584C8EBF37AEF2485A27323B42224C9A2F61B97637
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE755A2289DCA463BDAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377EC9BDDC32C0C0498638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D821A578A0867B440D9AEEE9C53D4DD53744756FEA97392FCF20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C091DAD9F922AA71188941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E992CA9783196CA2389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC2EE5AD8F952D28FBE2021AF6380DFAD18AA50765F7900637B8FA30D9455089A722CA9DD8327EE4930A3850AC1BE2E7358CCB3ED2A1DE2304C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A540339533833DE1865002B1117B3ED6960D5CF8B6B9554B51D57BAD45EC4C5DE1823CB91A9FED034534781492E4B8EEADABF80F987DAEDACBC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFA3ADAB4F3EF33DD8AD55A6F2A411B511DAFF9486AB3702CFB9A568330CBCC601245B1B6CBED8166A037F1EA6941D4E95035182F6C1A4CC9E5FE0BEABE0D3A78C7857EB2E17A24F7E111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojdLGO8aq4B0M1m7/tFRz0Cg==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B46020A73EFDC6E1947980FAF2128931C784F0D012CADE4A190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=M3Pp2x5I8fN0kYRN5iQD3DJY5MZ1cpKzXmHh/St0OlQ=; t=1726733937; x=1726823937; 
 b=mbPcV2xoD/l1lABFtbsvJ2jd5dlO1iNJ/O3Cdhjz4XijJW3jvUPf+GkZSSP4S8+/fniAM0NFshx
 Ssg1ua+R52/zJs3VRG9IVeqb0JoZg79PkkfX7zmUlq+IG75fgMCfcpytaY7+kp4cX8MxFAEjImv9Y
 FSMAJonO5jFQg8tP37eRbSHXdmS1gAiVmGiKcDAhP/PACFaZxf59A/LUA9bmMAlSd88FeEKjNpk7+
 x1cctzkVKNTunKD3eMBzDOW38TLvKep0030c3i94sRDmxGtEljcZUVvN75ij+Z6KAnKUA+2pmIYuy
 opC8+NslhPGZkgVwsXu45/oOY7dDUsTkxAkA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=mbPcV2xo
X-Mailman-Original-Authentication-Results: smtp40.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgresql: fix build without
 BR2_TOOLCHAIN_HAS_THREADS_NPTL
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit: https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=52afe563206e753f4c45c014fee2459ad0855826
postgrsql fails to build with toolchains without threads support:

misc.c: In function 'ecpg_gettext':
misc.c:541:51: error: 'PTHREAD_MUTEX_INITIALIZER' undeclared (first use in this function)
  541 |         static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
misc.c:541:51: note: each undeclared identifier is reported only once for each function it appears in
misc.c:552:24: warning: implicit declaration of function 'pthread_mutex_lock' [-Wimplicit-function-declaration]
  552 |                 (void) pthread_mutex_lock(&binddomain_mutex);
      |                        ^~~~~~~~~~~~~~~~~~
misc.c:569:24: warning: implicit declaration of function 'pthread_mutex_unlock' [-Wimplicit-function-declaration]
  569 |                 (void) pthread_mutex_unlock(&binddomain_mutex);
      |                        ^~~~~~~~~~~~~~~~~~~~

Option "--disable-thread-safety" will be dropped in PG 17, so
this patch is needed only for 16.x branch.

Fixes: 73dd1d6b9666 ("package/postgresql: security bump version to 16.3")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 .../0001-Fix-compile-without-threads.patch    | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 package/postgresql/0001-Fix-compile-without-threads.patch

diff --git a/package/postgresql/0001-Fix-compile-without-threads.patch b/package/postgresql/0001-Fix-compile-without-threads.patch
new file mode 100644
index 0000000000..1c975fbdbd
--- /dev/null
+++ b/package/postgresql/0001-Fix-compile-without-threads.patch
@@ -0,0 +1,86 @@
+From 6c71182dde4d37fd70ee8015f61935254ae6f9a6 Mon Sep 17 00:00:00 2001
+From: Maxim Kochetkov <fido_max@inbox.ru>
+Date: Thu, 19 Sep 2024 10:04:05 +0300
+Subject: [PATCH 1/1] Fix compile without threads
+
+All mutexes should be wrapped by #ifdef ENABLE_THREAD_SAFETY.
+
+Fixes: https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=52afe563206e753f4c45c014fee2459ad0855826
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+Signed-off-by: Maxim Kochetkov <m.kochetkov@yadro.com>
+---
+ src/interfaces/ecpg/ecpglib/misc.c | 6 ++++++
+ src/interfaces/libpq/fe-misc.c     | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/src/interfaces/ecpg/ecpglib/misc.c b/src/interfaces/ecpg/ecpglib/misc.c
+index 4b54322926..5a4d2e847e 100644
+--- a/src/interfaces/ecpg/ecpglib/misc.c
++++ b/src/interfaces/ecpg/ecpglib/misc.c
+@@ -538,7 +538,9 @@ ecpg_gettext(const char *msgid)
+ 	 * might as well do it the same way everywhere.
+ 	 */
+ 	static volatile bool already_bound = false;
++#ifdef ENABLE_THREAD_SAFETY
+ 	static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
++#endif
+ 
+ 	if (!already_bound)
+ 	{
+@@ -549,7 +551,9 @@ ecpg_gettext(const char *msgid)
+ 		int			save_errno = errno;
+ #endif
+ 
++#ifdef ENABLE_THREAD_SAFETY
+ 		(void) pthread_mutex_lock(&binddomain_mutex);
++#endif
+ 
+ 		if (!already_bound)
+ 		{
+@@ -566,7 +570,9 @@ ecpg_gettext(const char *msgid)
+ 			already_bound = true;
+ 		}
+ 
++#ifdef ENABLE_THREAD_SAFETY
+ 		(void) pthread_mutex_unlock(&binddomain_mutex);
++#endif
+ 
+ #ifdef WIN32
+ 		SetLastError(save_errno);
+diff --git a/src/interfaces/libpq/fe-misc.c b/src/interfaces/libpq/fe-misc.c
+index 488f7d6e55..2185e0ba7a 100644
+--- a/src/interfaces/libpq/fe-misc.c
++++ b/src/interfaces/libpq/fe-misc.c
+@@ -1232,7 +1232,9 @@ libpq_binddomain(void)
+ 	 * might as well do it the same way everywhere.
+ 	 */
+ 	static volatile bool already_bound = false;
++#ifdef ENABLE_THREAD_SAFETY
+ 	static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
++#endif
+ 
+ 	if (!already_bound)
+ 	{
+@@ -1243,7 +1245,9 @@ libpq_binddomain(void)
+ 		int			save_errno = errno;
+ #endif
+ 
++#ifdef ENABLE_THREAD_SAFETY
+ 		(void) pthread_mutex_lock(&binddomain_mutex);
++#endif
+ 
+ 		if (!already_bound)
+ 		{
+@@ -1260,7 +1264,9 @@ libpq_binddomain(void)
+ 			already_bound = true;
+ 		}
+ 
++#ifdef ENABLE_THREAD_SAFETY
+ 		(void) pthread_mutex_unlock(&binddomain_mutex);
++#endif
+ 
+ #ifdef WIN32
+ 		SetLastError(save_errno);
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
