Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF990C77B72
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 21:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63DA04294C;
	Fri, 14 Apr 2023 21:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63DA04294C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVL_0VIiazZw; Fri, 14 Apr 2023 21:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFED142989;
	Fri, 14 Apr 2023 21:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFED142989
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 404341C3D32
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 21:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26C4A60BC4
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 21:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26C4A60BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8WWCJ1Dofo_G for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 21:35:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50A2960BDB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50A2960BDB
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 21:35:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.232]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MDywo-1pflZk3i6O-009urr; Fri, 14 Apr 2023 23:35:04 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 14 Apr 2023 23:35:02 +0200
Message-Id: <20230414213504.14634-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:JDkd2gXXtFd1/08dvrbExsqvJB+oSm1i1wJYcnF0m1dtiRA4gqf
 Su2MnHGREeT8Ts8wE5dUzWTmpv4Nqj307/phdXC/lv9JTOhrj3I0VKNiykNt/Btl6Io/GUx
 aPGswnAp8P14krVbF0Cx/v1rzeThieGnxxuAdwDudV6800GmynKaBmW0JJYOWjPkJAyfObd
 SvlsWKBvqIy4hfnYV7+BQ==
UI-OutboundReport: notjunk:1;M01:P0:S7P1/n7rmLc=;ZXB7nTeM3S1kE1kUHIsZEKJLN8b
 8EEunOMTL/qN9eT3zsRB2Mipf8RiKyzRNK/qDjdCJm+dJtg8fP1By3kOxPTGcN3QYfsbYU8/H
 cOsIOjZ0eUfZS1bmnZ5SKAiszmKL7sJpfeZ4txexmXFi7mMywklnXjR5nOUQszig+nK71eyTe
 RtgFrWK5fI9C3TR46zvk1Ea5pjlOahDiMYQVB0CT6m3ZVoAJkA7H3EyrWjDXegnNB1dKVXxnc
 9s47r7pLC6SZtl2hrdSVh6LTMjERtlZhZizI/PZPOC0GCWXlpEo+YR5LxpxW2PyaiHsil3c9D
 MyyZCOQdGCQsq7Rl4mgWI1mscdRqiHzMi7K/6+Kpzd1bh3SdDP6RZzUaOHjq6MOD2psaf9M4L
 nBJ4rJ3M1YRGnf9NA5XGAu5oiNKAcvGIDEXgLUC+CpG3xgVOLCogWt5G4cI3lGCIa7rU85tJA
 OOJkqxeCE4RJvXuzzGa6D2hdzwlWC6h1VDEl3dmint9lAAd+tyu4rq5/CbWKtTZQpDtccEOB9
 +lzwZJgh6fw56UjtCnNxGrU/mY0AxliNFPYMYeOfRQtZcaRh/Lb3YQnyP+azhbA0EcN5uRbn8
 wbHp8VJ1RYSzM0qLD4kKMxFYricRyaxdW6a2z7VxGy19CVl4kZxuC0ILVheCFmRIzBgBUPN87
 SjBDWmV8xmo+DbCTceFRBg+i4dTSM9nVCifbFIHwT7BjZm2PaBeQq1JKu7viJhWr4s5OXYYT1
 bXDrlWjlVj+9S/9LTrdIuJm1z+uqVV77wzfzrrQG2uET0zTs7ShcS7jHiEB8D40DJkEpKIeky
 2X+oJJwo2DIIe56LGTz9XCLrrwZCVdL7iKpSwBuG9gc8z4WAyEG3ZNy0cIywSTTkS3akg8mu8
 ZSD0M2VWX4MG4ACjTwu3mM4/o8U0e8xkY55ZwwSGaO8WMQgl6zsuF1pD36Vj+kIzbqQKvFRCD
 5VDW9XmKe1yDxB1Bvl0MB/TojP4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1681508105; i=ps.report@gmx.net;
 bh=PZaYv77AErQK+iTJlLQJKNno4U0d1gZ3B5r/b7kvDE8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=sQWc3xrKDmNYAFPdpbbJD9H5R9b6akl2WorYR2ErscCAMBPhrTEEY3o8m2MD2SMg3
 ++wfi/pmI5edvUKJ2U5O1s1EYsVRoVNmBgGgQp72J/3cCcn0utxe63/WnCeDFmH9nt
 XfDMPNQM+8RN6BBAu7rkRmz2IILp4FC02M/ZbaPhrUzBAWpQpsCSGS/j7qqCF4tSL+
 TyH3bqAACaYq73vb2TV/hPk0H312q0y/FtS4f+8ik5o+xRyeuEDA8LWWQA8GeTeq7j
 FVJuhSkIpDKnLmegbp/NjKkSZ1KN+eGAU5nzDHtS1uMG7GsxN78jqSedymJf+51aCL
 eXETrF9PsO3hQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=sQWc3xrK
Subject: [Buildroot] [PATCH v1 1/3] package/nginx: change project and
 download URL to https
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/nginx/Config.in | 2 +-
 package/nginx/nginx.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 406a1c861a..8e888baa1c 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -6,7 +6,7 @@ menuconfig BR2_PACKAGE_NGINX
 	  nginx is an HTTP and reverse proxy server, as well as a mail
 	  proxy server.
 
-	  http://nginx.org/
+	  https://nginx.org/
 
 if BR2_PACKAGE_NGINX
 
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 10cc95d90e..185bcd576f 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NGINX_VERSION = 1.22.1
-NGINX_SITE = http://nginx.org/download
+NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
 NGINX_CPE_ID_VENDOR = f5
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
