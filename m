Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54FDC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81CC760774;
	Sun,  4 Jan 2026 14:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8NUvu0VJ5S6; Sun,  4 Jan 2026 14:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A470260756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767537182;
	bh=C8LbLk7UCZPzsPJHWrTAN87HNFh43JriF3I/I4id1/Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=mS9U1bzvrXrUMYRApvFWiY6bwfUIxUBnHiznQyzyfN/+j9AjUM3UXgRddmpg0bmCJ
	 XFIGEUawBtB8SZWMLq9OqlibrZIR7SK25viH3UGGedPCQlXxyd30DO+CnHxUOHSvgf
	 pwlbVFpsftRhbVyczxfrY7Y7jA+mdR/oWFBW0unZvOc3AlzAkkJax2GfqcXpOFTKhi
	 OQ9eBa87LJd4QdyCkuKaDwIJ1CKMv1rORhqc3gvVZvdNnUm2yWlmNBxiTfsD8Er+73
	 bH9ApIPxOSk/LXnreLyK1xiB+2rSYiofMnJCBSSE/BduJf7DRFgPWy/Or25bxrmcGG
	 U3S0lrDa8p9RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A470260756;
	Sun,  4 Jan 2026 14:33:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 201272DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06A164019A
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXXtDk8bsvcW for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:33:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FA364013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FA364013F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FA364013F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:32:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.121.67]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDNl-1wEhza0GQp-00kCDe; Sun, 04
 Jan 2026 15:32:57 +0100
To: buildroot@buildroot.org
Date: Sun,  4 Jan 2026 15:32:39 +0100
Message-ID: <20260104143240.4126891-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:iKx40cqumibQqFhvK2mDDym9YV4qRx3TxaiKhb6rF5adOOuvYIe
 39IvJNUXxnFKCxcO8FJ71T8x4oBDE45LNiG/i1Nbd40NGGAKYl/RczmTNhGGhxs/jyvst0V
 Ba8nefO1aZlJopfJG5uKEDYXN3Wm9e8cJTRINfhAzCAWCpsdxz9ToRoolBccOJglJ+xLjoa
 ClU2wov5PuKB5znYw5p1w==
UI-OutboundReport: notjunk:1;M01:P0:ZJfsSbpmOb4=;Lowkbi3FILMB2g3fm50FEcy5oSY
 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
 JrFyX0jTcbAkPqTazJwlAujUyFf3a
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767537177; x=1768141977; i=fiona.klute@gmx.de;
 bh=VLLoOXn2v6xR8F2MGVPv4hdD7XpIqxRqmlyx56Z54rk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nfTdletRudmdDc/nCFmDEJBj/zr4g4lvVXAj7v2UmVqaGvX45p+N8sNKoyGZNkpX
 yyNPPxaB62AyWDoDHVHSElSHKayiNo1WKI+JGp4XEzQPbwyIB0lxtDl3UGpSUSCIq
 9BCAtb21ldHZ84kyEAGpkVVHoJ+a7PHaeNYEBoxOKAEwlDa/8Lm6vkS130D3wksLf
 KGhxLEqs11nRbqPiwRWBPwnuQFs/cNjIpv2ho7LR5KUX0E4WCiYVIK3YbxK9rGijm
 BcL28QCd3ffqADGFe+4LXPIM5yrWeadlrHk7uvyfh/dc1/pkF2xYOzGLu1iO2loIM
 CAE6tQnYkNTXpypGNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=nfTdletR
Subject: [Buildroot] [PATCH 1/2] package/python-rich: add missing dependency
 on zlib support in Python
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This did not show in the runtime test for package/python-memray
because that package already has the dependency, so the Python zlib
module is present in the test.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-rich/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rich/Config.in b/package/python-rich/Config.in
index d7f3cdf54a..9fb34f097b 100644
--- a/package/python-rich/Config.in
+++ b/package/python-rich/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_RICH
 	bool "python-rich"
+	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON_MARKDOWN_IT_PY # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
 	help
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
