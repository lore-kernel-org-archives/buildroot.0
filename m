Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66347D735EE
	for <buildroot@archiver.kernel.org>; Sat, 30 Nov 2024 04:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 113AD600CC;
	Sat, 30 Nov 2024 04:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWxR61OY84ZB; Sat, 30 Nov 2024 04:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 310CF6080A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 310CF6080A;
	Sat, 30 Nov 2024 04:53:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF35A712
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 04:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D21CD6080A
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 04:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cj7uPT1iQZu for <buildroot@buildroot.org>;
 Sat, 30 Nov 2024 04:53:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.154;
 helo=send59.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85CA3600CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85CA3600CC
Received: from send59.i.mail.ru (send59.i.mail.ru [89.221.237.154])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85CA3600CC
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 04:53:52 +0000 (UTC)
Received: by exim-smtp-66468c9cd6-5zkpd with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tHFUK-00000000L92-482j; Sat, 30 Nov 2024 07:53:49 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Sat, 30 Nov 2024 07:53:45 +0300
Message-ID: <20241130045345.7256-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD934EED3D1897221AD6429DB1727E78CC6ABCE175D961F8777182A05F5380850403E348335E271B0253DE06ABAFEAF67055635DEEB02B144FCA1177B2239460D1E479AC59D1825621F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE706EA9E10470DC775EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374C1E21D5B12C874B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82E73C00953B210F2A7B3F69D88EF37E55F82B85EBB0E233220879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C21E93C0F2A571C7BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E5FAC37A846F0F679FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637AD0424077D726551EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A5F656447B433603D15002B1117B3ED69653BAAB1967C92925108A05421C070DB8823CB91A9FED034534781492E4B8EEADA757276DBF662F3EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF395EBC5C508B20DC10272753ECFB7EB8BF35CD86845B06388409BCA8E892D50D6BD4E2D2DF3D4047092E025A8769729BB9A35E3D1F154E9CB42C8F51A61BBDE4755CD634558224685F4332CA8FE04980913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojP7kL1K/mb8AgAdYEVl0vSw==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219C7F4E498D77DFD709A5BE418551CBF62802DD48C9BDC0CB490DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=ojCecZKvhHRjVU5XATyThkC7T60YIQiL0cGskvge7P0=; t=1732942434; x=1733032434; 
 b=EYPbUNtF2Mx7ZGmecdQzK4uvl8Ld/va9BIJcEY5HqrwwO4mRHV2uBtiZiwPl8NwcUW/Ssudvc+i
 vZToXvkQiXcWDebSv3xnogpOJNlw0e5aeYBzvM9/ZcXDDVf+zNZs/cpq0zO3Picf/2c+41IVCFNzP
 kyFoe4wTwIUOwkQfJJL2baxZkaV+ZLlzc9Xkce72DKbBQmGWlmtErBnyTROW7XVBAiI6gGvns5A6/
 +z61kRVJaSiDY/jnWnlkrytF1tV3okCjszDl1++p5vBv0bkJjoIyo7hTj281Hr4Bat+Yrz1Iid7ka
 OMvU/oy9mvO+93H3fqEnKIRiX78Db3P8Dw8g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=EYPbUNtF
X-Mailman-Original-Authentication-Results: exim-smtp-66468c9cd6-5zkpd;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH v2 1/1] package/alsa-lib: add BR2_USE_MMU
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build fails with:
ucm_exec.c: In function 'uc_mgr_exec':
ucm_exec.c:229:13: error: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
  229 |         p = fork();
      |             ^~~~

ucm uses fork() so add BR2_USE_MMU dependency for it.

Fixes: https://autobuild.buildroot.org/results/a287d3eef7ea5ea9a85b5b35d14e3698df4ecd01/build-end.log
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/alsa-lib/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 447916a29f..6df03afe0e 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -69,6 +69,7 @@ config BR2_PACKAGE_ALSA_LIB_SEQ
 config BR2_PACKAGE_ALSA_LIB_UCM
 	bool "ucm"
 	default y
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 
 config BR2_PACKAGE_ALSA_LIB_ALISP
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
