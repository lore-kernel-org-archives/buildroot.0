Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A77FCD342E
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 07:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB78980544;
	Tue,  3 Sep 2024 07:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x985aRsM_rXG; Tue,  3 Sep 2024 07:29:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D071B8051F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D071B8051F;
	Tue,  3 Sep 2024 07:29:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3A471BF420
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 07:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1697605CF
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 07:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYdw_xCpHQK7 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 07:29:35 +0000 (UTC)
X-Greylist: delayed 6175 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Sep 2024 07:29:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9935605C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9935605C6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.137.243.76;
 helo=fallback20.i.mail.ru; envelope-from=fido_max@inbox.ru;
 receiver=<UNKNOWN> 
Received: from fallback20.i.mail.ru (fallback20.i.mail.ru [79.137.243.76])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9935605C6
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 07:29:33 +0000 (UTC)
Received: from [10.12.4.19] (port=43266 helo=smtp43.i.mail.ru)
 by fallback20.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1slMNB-00CWrh-90
 for buildroot@buildroot.org; Tue, 03 Sep 2024 08:46:37 +0300
Received: by smtp43.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1slMMy-00000001F2r-06iI; Tue, 03 Sep 2024 08:46:24 +0300
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 08:46:22 +0300
Message-ID: <20240903054622.14033-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9C93E46B305ECE2F0058463232AB3AB009566D14BDDCA9F8B182A05F538085040A6BF35696ABB7DF19487ABAC94A94B549E9023765DEA743D1A13BC4EDE08F904DC39866218C5191E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76D34FAA3D8B31588C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7A72B1EA4C8D5AD81EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F361D372799528D23CAE1EE7F8BF277D4FCD7B1C589597A876C1DF9E95F17B0083B26EA987F6312C9EC33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583C09775C1D3CA48CFE97D2AE7161E217F117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7D9442B0B5983000E8941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5278DA827A17800CE754F43A495B1ACFC12EB15956EA79C166176DF2183F8FC7C0E4A630A5B664A4FF725E5C173C3A84C3BE90F13D913F449135872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5BE01F51E803A64345002B1117B3ED696248400665E8E2818A13BD6A4B0E00B96823CB91A9FED034534781492E4B8EEAD6A17C1D737525568C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF1217DBE2D33895F8C1D84ECF9128DD85473114F24D0233DFE1382BA5331E0F6601EE030787A60D783EE79E6E40FF6950B315F769AFA04B62EE9D5FBF07B5A2C1DA08F850B6425110111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojpn6nlaCBY3RL5aL7oHJRMg==
X-Mailru-Sender: 689FA8AB762F7393C6D0B12EA33CAA9B7048449A17552A50796778262F5D6DA52D4D6A3F235CC79990DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B42E4E0EA5DD42FB3BCDC8844B5BCECC5F9740BDF260C4CBB768F3CF0E9FE49B69771BB7557E63CE72022E3B269615F8D864A97FF1D92BCA72226971CAA312CD00
X-7FA49CB5: 0D63561A33F958A593453B2EA9956873DB3ECBC8F0C7E859E283FFA683F15057CACD7DF95DA8FC8BD5E8D9A59859A8B60417BEADF48D1460CC7F00164DA146DAFE8445B8C89999728AA50765F790063713EF0ED8E3DED567389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8ECD24B97DE0E565DF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE7D9D2E6C9A5E65EE7731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojpn6nlaCBY3TbTzrjb+8yFQ==
X-Mailru-MI: 8000000000400800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=KeY762fnVoOq3ej/AVQntxpx4/fQ3+52iKaW7n4Xnhw=; 
 t=1725348574;x=1725438574; 
 b=D+RjaQSWkUVJ4sniVePKoyuRgAoJMaAwUljBQFOUBcnm4FuETpnQq6yfnHAkhnwQSomYO4vFHzxu3BYh9lajJaBDQzXevuge6vEp2j/Er5ZI2BfjnmxXsNzA1I1R6L/FOHHLUPbfEVrwWutRDaFB5yDsBK5TRJzjDWw1sPXbjAotEBYBopCZQdNrAXYyVreuQbHsdMMvL7FAWzgNsOKvHQ++/lQcfnGOhhm1JFoRuyXGdy7JI2RYfHWh66NavyX26MhSkN0W0/I8XAnDuC/aF+Ziaufbp23umEkKMm6YXLgYmPK6hW37NXxcCjecr7np6FzgcgW03vYs9Km9L3TwTw==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=KeY762fnVoOq3ej/AVQntxpx4/fQ3+52iKaW7n4Xnhw=; t=1725342397; x=1725432397; 
 b=wF6Z6wkM7ERGfXEMrVzpaRwH/pKEeGPcFEH8Rj2/1VVCT4Snr9+zwWNyLpE8HeOaSNTd6xdbKhx
 SolRfdp6AP5/FSjpUHaR7HXvfM3+RKy9NfiDDuZAaAzJkUmdWNT+b0COhn4b39Zn2e8xBotQ9+eoN
 tXY1p2ELou4vLerRFVFEL+R/eqATlSEq/OPwvNfA4b11TRnlUb3F478jOKRvYQaKwkDsV5/tgGiBC
 d0ZJNSwRY/kEkzkSNm8qPgoSX7lrDGhIK2tk4gOSwP+lNOt2ync2qiv7TRfB6+ZZwrO8Jve2oRbCZ
 WE+YsTqG4Mw2qSR9AH3Zf03TBA1rkyBqS0zw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=D+RjaQSW; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=wF6Z6wkM
Subject: [Buildroot] [PATCH 1/1] package/postgresql: needs threads
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

Threads are mandantory since bump to version 16.3 in commit
https://github.com/postgres/postgres/commit/52afe563206e753f4c45c014fee2459ad0855826

fe-misc.c: In function 'libpq_binddomain':
fe-misc.c:1235:16: error: unknown type name 'pthread_mutex_t'
 1235 |         static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
      |                ^~~~~~~~~~~~~~~
fe-misc.c:1235:51: error: 'PTHREAD_MUTEX_INITIALIZER' undeclared (first use in this function)
 1235 |         static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
fe-misc.c:1235:51: note: each undeclared identifier is reported only once for each function it appears in
fe-misc.c:1246:24: warning: implicit declaration of function 'pthread_mutex_lock' [-Wimplicit-function-declaration]
 1246 |                 (void) pthread_mutex_lock(&binddomain_mutex);
      |                        ^~~~~~~~~~~~~~~~~~
fe-misc.c:1263:24: warning: implicit declaration of function 'pthread_mutex_unlock' [-Wimplicit-function-declaration]
 1263 |                 (void) pthread_mutex_unlock(&binddomain_mutex);
      |                        ^~~~~~~~~~~~~~~~~~~~

Fixes: 73dd1d6b96665574607c8b05189426ad3eb05a6f
 - http://autobuild.buildroot.org/results/43dea0d3b618e826e866477124284bf89204113e

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgresql/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 899907d6a5..9faed419bc 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -32,9 +32,9 @@ config BR2_PACKAGE_POSTGRESQL_FULL
 
 endif
 
-comment "postgresql needs a toolchain w/ dynamic library, wchar"
+comment "postgresql needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "postgresql can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
