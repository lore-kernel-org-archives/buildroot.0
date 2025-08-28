Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB43CA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3FF060E12;
	Thu, 28 Aug 2025 13:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPA26tf8X0uc; Thu, 28 Aug 2025 13:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C201060E1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C201060E1D;
	Thu, 28 Aug 2025 13:44:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BFB8B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 512E660E1C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIqEtfqzhdts for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:44:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66B5360E12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66B5360E12
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66B5360E12
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:44:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 999BE1A0E44;
 Thu, 28 Aug 2025 13:44:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73A8460303;
 Thu, 28 Aug 2025 13:44:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9AF7B1C22DBC2; 
 Thu, 28 Aug 2025 15:44:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Perale <thomas.perale@mind.be>
Date: Thu, 28 Aug 2025 15:44:26 +0200
Message-ID: <20250828134427.177601-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756388686; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=7xkOHHcAWCW9XtqNtHmkqLDxQHbHH2kRElwdXXOdpIM=;
 b=Yn9D2EMb0yaTcXWag40u2l6ouErcwFblJKduA2PNaebbFB1X+7imCgqdD7B77hWnudBv2f
 dMY9GC2uvfeDwOQxw6ZzSGLhfV8QDLWx5QA0kYFHXB0UchiZ7I0IrD/ytvTDMZ9tEHSlgV
 adMcGVPtKCzVsW/tFb2Fh1vTVcivGd8AUgy9NZK0my6RkBKdZrsA4RCVCkJfIarjmDodPB
 JaZr3iacZ5TKUWTVGZvJfd0Nl0T1zYDPPyODcYMnuph1NYbyxQimVUPE9aQS5Y80WJg+JG
 qTM2lU0jOkbdXnZt0zUJlA2T1eV9zSVtnPzjo28Tt8+s+YN/VWBZfESDoMDOwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Yn9D2EMb
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: use more sensible
 default value for <pkg>_CPE_ID_UPDATE
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

Setting the "update" field in the CPE ID to * doesn't actually make
much sense, as * is a wildcard. Instead, this field should really
reflect the "subrelease" / "update" of the package, which unless
specified explicitly by the package .mk file, is empty.

Using a wildcard causes a few CVEs to be incorrectly identified as
affecting some of our packages.

For example https://nvd.nist.gov/vuln/detail/CVE-2013-1428 has a
CPE configuration that goes like this:

cpe:2.3:a:tinc-vpn:tinc:*:pre6:*:*:*:*:*:* up to including 1.1

and this CPE configuration is currently identified as affecting our
package. This isn't correct as our package is using 1.0.36, not a
"pre6" version. But because the CPE ID generated by Buildroot uses *
as the "update" field, and * is the wildcard, it does match with this
CPE configuration.

After this change, two CVEs are no longer identified as affecting
Buildroot packages:

  https://nvd.nist.gov/vuln/detail/CVE-2013-1428
  https://nvd.nist.gov/vuln/detail/CVE-2017-9454

and in both cases they are indeed CVEs not affecting our package.

Reported-by: Titouan Christophe <titouan.christophe@mind.be>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 95ff9135bd..cf55101265 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -727,8 +727,6 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  ifndef $(2)_CPE_ID_UPDATE
   ifdef $(3)_CPE_ID_UPDATE
    $(2)_CPE_ID_UPDATE = $$($(3)_CPE_ID_UPDATE)
-  else
-   $(2)_CPE_ID_UPDATE = *
   endif
  endif
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
