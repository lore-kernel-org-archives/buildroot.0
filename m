Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2502C9832F
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 19:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B27F940A56;
	Sat, 26 Sep 2026 19:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMRcnI3GkEwb; Sat, 26 Sep 2026 19:58:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D3BA540A36
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790452734;
	b=L2uK3CXmI3juyU0ny3ieNFZAurbp4BxiM/y8s46bGMvaQ4MY1l1kxqCdfktSlz/Vczpd
	 lh50aZeBb7OwpQoiWwkS3sNB6Fubo+VHsDByw9sbz46F0lwH22adDkJQQZkrQFzNCYNf7
	 edf6APf7jo4vO2D1Jlk8UDYUZ+BAQ6glcQ8XRZPkndfXhyOTIJt5qPDMhTm3tSJ+BZnJU
	 PXTyOhJs2aIPTYrjekxGL7teqxVrVGJSZWCyknlUd5tnFrxVWe4A8kZ+dVHfY/RwYVHxQ
	 GuprENxIiMBQ41jnO6YRbyPc08q+VrKmLZUpmjhWmRdiUqjRi9tNS6nagB7JD2mRuBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790452734;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eWMXYhSB85YH62sS90KXf24ge+eAL1PXvJupLZNmEMo=;
	b=pC2lz5tnrjCS/Nt/nunlQHY9L8fNk7QirjqdC9GohTUJynJEtknqLL7kaEijCRFfn+yB
	 1nlBqh37Yz87G+5HpPbug3t0oDCWsz7YGpFDVjsFvERWtsym5MgBOA6Fxk2xbTfuwvzve
	 gYVlx5oJacRnc9/M75CeS7DVuvrPsa613p+NbGTj0ChfTldAPQvD9QdRWRBvPYa4/anRg
	 XLnjNRGks83y4/5QqxfakONzOa0KQo0tk+pZ8YCy5bTPAUjcyZq4iG5Ru0bOy8TVGMtt7
	 7DZsY/HkvfWvdaarUNI9bY7bsLKXW+T1IlWDinNndaOCCAtjSBihHuHZwH1IPqSEh0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790452733;
	bh=eWMXYhSB85YH62sS90KXf24ge+eAL1PXvJupLZNmEMo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=BuQA3RcNLBAqm9+2fSq7ml77WEUoSfp/COTN6S7YHrImJqayl0nda+Mb6owIpvxOi
	 H9/pcHuUI6WXIbBBTeUIHR8fPfxWUk7ymQZnVv1nvNuacKytME2qbxvMk7V+sCMB5x
	 ybd166CoNPNPOhIJxlj1Gs1eHU6en0Rsq1Xrb3gXe358dXuaF7/phZ8nolpGnRPVM7
	 0nRKvfP5JzJDdBrsfy/NnpDd/rzFbHrrnYKqnZNeo9IAiKlmwt5YnCyO1TMGyP3Mvr
	 yZOAYSXT7gT+CyevV1/ni6sV1yDCev/qmgg2oENHT5iFUeYSIWmHnyHCLMN5fDcTwv
	 ojrKj8gZDpLIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3BA540A36;
	Sat, 26 Sep 2026 19:58:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26A3732F
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 19:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BF5A40083
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 19:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISi416-bOBMm for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 19:58:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A3FD140022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790452731;
 b=rN6qSIsIGVE83c2e6mYcQzw44mNsJX39jBhrLRwmEU8KMklLu4A0tORpUceE2VAhYK8W
 kCm9U2ZQyhGTRswWYhpYpc9MHcO7oSapqt8y7HxPxiQZyji5+hdCjTDRkKpBk4i0m3k+O
 C+6a8gB19Cv+VvRzBoD1debXz03NLeN6U7vh+B6GYZ490wIf4G+pTIINZqz4+g6XciGo6
 sx1xtOGQ5GFRtGzhhIgYDWiUjWTKe0jKSmdIS5h0Sf1iO+0FvQOm/Hf3hqfxEt2XcI4Si
 EqYj+pN+TG2DxJRMzQZAY04JydA6K2SIhIF0auhmJesQp0i5nBg3VYt2IjzTZBbptWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790452731;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Ti6lJn3B0zZ8xm+waoW3mnl/TmS56F4FV5Fw487rATU=;
 b=dIpT+2ctIURtMPgjzbm0v2y5Yt1K++xTqwDSdHK7Eweo1YjRGzMktPJSNCmCzEcceygS
 nxKEB+7BzcDbOSgZEjwygUCkpvDZFXmxylmPT8Oa+3tvwsw2gb1VrIf69NAzXmbD4PUeS
 q12p7B4JdUz7tRdKkVFChkm/q3tsKPiXPMuhQpLGAqJ9ivhcsT4vurCkmW5S0clg4wfVW
 i9XD4Ue46mveLKe+TlQjN+5PX2LOanJiFZbYFmezQ2Ygpepqh5vi6KqpHSOjZDSbNrxum
 SNMYtA3Fwm7un2dl0y3JBoTGMF/obVPLbr8E92qp5azUtv+4jOLjEhcOmY+fSLYYQeg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=rboe3kWQ; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3FD140022
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 19:58:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiHf-1xNZkX27Hr-00Hqxq; Sat, 26
 Sep 2026 21:58:46 +0200
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 26 Sep 2026 21:58:44 +0200
Message-ID: <20260926195844.2092685-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:0OYcPvhR43u1xNN9aHH0w2oBT8AvonMzqTyXfRCiZwZHTMkN21j
 fo/cnymLpQbROBLIPKvsan0NxFHA4aSkupZkNTrVtffwjcNDarJLb6ruZzPkvSp6U/7JCCb
 yyaNFGbtxqc2jFHNWerDCPJpBgftjck3+Z7cGr1LoNFZUJdWb/X73ojO9jqZX109wIDGEYg
 YQ6vO/ZQ/TeU2idE+NokA==
UI-OutboundReport: notjunk:1;M01:P0:QRP+V2H3Ugk=;dPLabe5wsDpI9Ok53ljTAvrQaIQ
 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
Subject: [Buildroot] [PATCH v1] package/coreutils: bump version to 6.12
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 6.12 (for details see [1] and [2])
- remove 'utils_cv_localtime_cache' configure option as removed with
  upstream commit [3]

[1] https://lists.gnu.org/archive/html/coreutils-announce/2026-04/msg00000.html
[2] https://lists.gnu.org/archive/html/coreutils-announce/2026-09/msg00000.html
[3] https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=b64f9bfe4fd4ce5d276626fd149af2a625b6d434

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index ce507a3015..3b14acef3d 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  16535a9adf0b10037364e2d612aad3d9f4eca3a344949ced74d12faf4bd51d25  coreutils-9.10.tar.xz
+sha256  a480198559733e9b3da999e90543ac6f888a2caa544d8d664c5a1f17e528e210  coreutils-9.12.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 01c0cc72f1..b5fa968dad 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.10
+COREUTILS_VERSION = 9.12
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
@@ -51,7 +51,6 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	gl_cv_func_working_utimes=yes \
 	gl_cv_macro_MB_CUR_MAX_good=yes \
 	gl_cv_have_proc_uptime=yes \
-	utils_cv_localtime_cache=no \
 	PERL=missing \
 	MAKEINFO=true \
 	INSTALL_PROGRAM=$(INSTALL)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
