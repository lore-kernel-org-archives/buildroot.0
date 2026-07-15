Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF15C44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF5C60707;
	Wed, 15 Jul 2026 19:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huDZJh-dyWa3; Wed, 15 Jul 2026 19:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 417CC60621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784142330;
	bh=ujcBR/qGcXk/lm3Mp+/BLE8EO/3CtwKfp7YDUWY2TU4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TFaoKdK5YwwMdHYt71zL+FtKn9zcW1/S16F/5Tgpj2FI9rUyFAjAJLX6AtJdPPZAm
	 xo575Y/aQHjD+/2ayE9lRzKdhSKcQeKyHpAbFs1OhEtGtrCfEvfVh7CyMMpXRuLW+u
	 qF/RiBSPAMuTy9tarzLlfMA5MbthyKFHIp/k57bdcfmM9GOPyXbWx3THnB1jl+sdM7
	 Y/AfFfPN2t29xCof6OQgWGhdJsARJarsN4hGPQOZUXiHgoRY8p3yl5NZQzz3L03e41
	 YN5/H+zXnnWMfvBRhM4wJKoVoBnP5b6nrp4kL73lINlDNS6wUEVpUCRSY4zsKBOFtQ
	 wl5BjOBhdYO+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 417CC60621;
	Wed, 15 Jul 2026 19:05:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2C79320
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B012180D07
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1CYgoEO_-cx for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1970980C94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1970980C94
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:05:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8453F88980; Wed, 15 Jul 2026 19:04:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 20:53:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2d4e6f159b4cd3dc6750cf4e5bd595864de45a3
X-Git-Newrev: 1b9fd8fd9b2984aebd0a51c39d2071c247d79d07
X-Patchwork-Hint: ignore
Message-Id: <20260715190451.8453F88980@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Yann E. MORIN (Orange) for
 docker credential helpers
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b9fd8fd9b2984aebd0a51c39d2071c247d79d07
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1601e6b408..42418d01a2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3489,6 +3489,9 @@ F:	package/tpm2-pkcs11/
 
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
+F:	package/amazon-ecr-credential-helper/
+F:	package/docker-credential-acr-env/
+F:	package/docker-credential-gcr/
 F:	package/gpsd/
 F:	package/mosquitto/
 F:	package/python-humanfriendly/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
