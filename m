Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1227BC001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9291B41554;
	Sat, 12 Aug 2023 19:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9291B41554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SgxmLEkSv-Q; Sat, 12 Aug 2023 19:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CF2D41558;
	Sat, 12 Aug 2023 19:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CF2D41558
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A28661BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88C6F60E2E
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88C6F60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EC1wBCKbzXVS for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:29:11 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9923060DF6
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9923060DF6
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M4axq-1qTFrk3TqI-001g3T; Sat, 12 Aug 2023 21:29:02 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:28:29 +0200
Message-ID: <20230812192842.135682-1-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:R6i1VrsSLXGVqpf5ywusVV993gCcpqjG1L6ypl66fe1OoihfTNj
 59szO8+kEYOvoAj29wBCK7qynI/ipPYb5iw2RQrH3RdTMul58UwOJ0ftH9tpqJmwxr4H6fM
 aV5cehakY0yOclOWrjzRP7xlHvclfDCw2Asq5TWiBX5+mSw9Pp5x31Of42aK8L0eZUGZ6oR
 gWvW6HPr/25wf8Col1j+w==
UI-OutboundReport: notjunk:1;M01:P0:8B2C2iujNVQ=;P/k1bv9nzw5kkKR3sRXR3FyN+iN
 CxTniLuUJV/rzPugtPh2EN6eZRTCBKRBbgRs/G3QsBoL46mrAaG4m0KOps4V6IATmNJaXw7WA
 8mznVvYBwDQ5AwKFGpR+J8+Wo14Lst4nYZipZaSo3gWB2Z0ijTqm41EhqeMSjNMXccFdUrhqR
 0CVmQhSTkNZyCnatLo613p0/m+4CAUneHlJ0XCaukSH5l7Su0IRtLYGFa5eRKi9rmZ+QsgZcQ
 py6HZRS+EHMljo/oqsDG4WiD/ysbbP3dHVcXU7y+aKojmikRSvtk7OKL9yjtKilMIyCZcC+ux
 ulQoEcHIfXQYiKVNOaCx6ww8KFRI0eAUe/w705UFDIoAyLDpucQ8my6N6gcY7Xegch/dnf/fK
 cKKLWxxtzK04QEGJwAVo6vXVONEmtCIFzPpcLIuRnzhNDHPyCrol2E5QxQkTHRl1VlbBEgjYa
 3piektrsoIGKfl376TrO/FHgbI6hfe2v2aD5hTsVSXMci36PLX+m4ZCZO7r30xurs/KL4/6/t
 OTLbEmDEL5t6aF3djhLPIDCFRajw3C9hrtENyJBTBjQxgJVmaW/scQ6jDsz2mmmDW+U/yFz3H
 pNfAtlRj1V6OEZ6jJU564BuqzZUnjVwHti2W3e8b+JTE9E3omPJNKFm/Qj2MdsOTaRG/heNV2
 d94aTnVE1/Kf/sn29jCtcBEAr63xUs8htgImoOGwCBGrmQOL3/dZfnGMx6LF+LT7FH1Zu70gX
 wy5e4SZdrn+HKWXE/TBs9zLFnwmQjDpErRDnuQUyJxp1jLRh43tIQru2s6j1i8NxFlqZGIQXO
 pFJVyS5yjpBz/2DOnAgsNAl35a7m4/B6um8YwV3/AkAlw9lUmPbK9qXqxCWDbldOLSvXwEWao
 GJYnHkJZFV9i24l9xJEG2YZAR2rOJ18cFCPSzGkCYfX9/HzJBuVqhMbBYYEKGUTEBhWzucH8+
 PW50H9rI+kk5KMWbXg40bWFQg7Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691868543; x=1692473343; i=dalang@gmx.at;
 bh=5Kqt+gn/CRd2mEAz5vSquxKNvsuXbPlGTR77Vp3wvg0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Ln3hMcPXJ6wDmVVaSrAQsr7bmilJFiKYvXYMTP2cq/Rev4F9v4sHtXt7fw2kqR0kGgTQfvI
 Ma6F48tM89+nnosbSOW3VUa2wPSDygLhT8K56i6WK+IrMHZBcy8/8LSXRXJoFeIzXFI3OVBfs
 unPGhgyt5SOrpKDpPEM2c/y65C6ksBnYUm8JXWsSrP+Uf35SeAEsFEBfNYm3yBTiuInZBt49Y
 zpFtGygJV8nkVyxvmY2J1+ebCdfs/X4h7FsJALlob62vqsa8pelnX0UveUQiKPhj/PUursXJ/
 HuoDh9jbLKONzmajszqd0fNrxsKdZ2u+lpoBJH063M46HAT28zvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=Ln3hMcPX
Subject: [Buildroot] [PATCH v3 1/8] support/scripts/pkg-stats: fix typos
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/pkg-stats | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3248e3678d..eea900124c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -84,7 +84,7 @@ class Package:
     all_ignored_cves = dict()
     all_cpeids = dict()
     # This is the list of all possible checks. Add new checks to this list so
-    # a tool that post-processeds the json output knows the checks before
+    # a tool that post-processes the json output knows the checks before
     # iterating over the packages.
     status_checks = ['cve', 'developers', 'hash', 'license',
                      'license-files', 'patches', 'pkg-check', 'url', 'version']
@@ -259,7 +259,7 @@ class Package:
         if var in self.all_cpeids:
             self.cpeid = self.all_cpeids[var]
             # Set a preliminary status, it might be overridden by check_package_cpes()
-            self.status['cpe'] = ("warning", "not checked against CPE dictionnary")
+            self.status['cpe'] = ("warning", "not checked against CPE dictionary")
         else:
             self.status['cpe'] = ("error", "no verified CPE identifier")
 
@@ -499,7 +499,7 @@ def check_package_latest_version_set_status(pkg, status, version, identifier):
 
 
 async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
-    url = "https://release-monitoring.org//api/project/Buildroot/%s" % pkg.name
+    url = "https://release-monitoring.org/api/project/Buildroot/%s" % pkg.name
     try:
         async with session.get(url) as resp:
             if resp.status != 200:
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
