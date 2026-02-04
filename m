Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE4FE9D3E3
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A967F82735;
	Wed,  4 Feb 2026 14:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGZq_vhnThGR; Wed,  4 Feb 2026 14:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E25F83ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770215048;
	bh=rtFqSoUfQrgyV9rcOj9DdT+fRMWZA9M7rpHd7uOrn8M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=J6oFfxJS+frtCwOa/YXwLaBBX0BEY1ZEVzOWLAOZWer65j+ALRrJqTQWnvJnJZf5O
	 Tk7pYGqHC1CtUuXrnhE7+QENiX9Cfncdwzr2/RBnQm7M2nG9jRpfaeTa3uqhK9q3wC
	 1EUEJ1Sjp0C2MfoPtHYjgl1DJHXmWuV+RiTPbbf4A6gzKTuFx0PINn2gLBNJ1HxtAI
	 lwLwMrfM6OQHF3JPK2wiLb2+0w79EaSCaAp1uayO9AR1O+dS7o8DE4TpBQSlGNJlVQ
	 lNSlTB641OLUkNFke7MUBGG2L5VS7iMWqegc5lUjgLRAz74ouT9aeSM0qQWiggyARg
	 iiuo76W8b6c1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E25F83ED1;
	Wed,  4 Feb 2026 14:24:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02518F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF7C982735
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpSxtetzGN8q for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.92;
 helo=sender4-pp-o92.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41BD3824BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41BD3824BD
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
 [136.143.188.92])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41BD3824BD
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770215026; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bXXjXCgHmcUgFnliRv2tDvyiYSbifezrTzSMjbW+4tRXNHYPZ+kKU7woqRXi8q3VnxQXb4cVTUDgMIZxi+F+WfPOID6ypjqar6IRpb29h75Z9nsowUI4O44CnDEOoIkuV7crIcwW1wf3eQkjnsRtF1RvO49JPbItqjoo+L1IHtg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770215026;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/xRqZZl3gLgEptiVlMoB5OsKShJ1W5v2LRRjkhzybWM=; 
 b=Nei/NKpM/PhzKEGgd3DteYxqvh4b7X/1eJOxvgSiNLthdS/xh80jz9Cc7RR1ebL4UTcUhHgJ3MSn6pVO5/3I6ta7c4JtoAmxPH1QvQARtBFPDkHih+pKcRrEMecibaVRk3C3mciW4a70+sOEUtfCC4h1cNaxkttL4SGoPLV5gAQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770215024621578.9143926123727;
 Wed, 4 Feb 2026 06:23:44 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 22:23:06 +0800
Message-Id: <20260204142309.506287-4-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204142309.506287-1-kingxukai@zohomail.com>
References: <20260204142309.506287-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr08011227ae852617edf1f2ed810c63de000083e35be8a9f836907de0ca72a6791dea25da9269b123f36873:zu08011227ca1cfc64f253cf44902513a700008276adf3ca882765cfa5a4fa28d3a67d0cb68fdf0c58722b0b:rf0801122c43db40de7e9292c3b797d1960000eeef5f12a86d28d3006aedbb7813536f4e8b1f5a60d0a55a3cb3fdcc4e3a:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770215026; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=/xRqZZl3gLgEptiVlMoB5OsKShJ1W5v2LRRjkhzybWM=;
 b=P0nRf/ZiR0Io4gvfAFcM0USfA2LWxXlqnhBhWuA5WBtIK9YxA8pDCLENkHVvifNZ
 S2M0T03ShF5VPCO8Uf4VgLsZknNidXt8NLuVEIEGFUsiY+ShKCal7REs8kQZBomp5Vt
 YcckLDqJNrgtkjpxFYbG4JF73dsDiYmhk06IW8Go=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=P0nRf/Zi
Subject: [Buildroot] [v1 3/6] package/python-gymnasium: new package
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
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the python-gymnasium package, which provides a
standard API for reinforcement learning and a broad suite of
reference environments. Gymnasium is the maintained successor
to OpenAI Gym, developed by the Farama Foundation.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-gymnasium/Config.in             | 11 +++++++++++
 package/python-gymnasium/python-gymnasium.hash |  5 +++++
 package/python-gymnasium/python-gymnasium.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/python-gymnasium/Config.in
 create mode 100644 package/python-gymnasium/python-gymnasium.hash
 create mode 100644 package/python-gymnasium/python-gymnasium.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fb0a084665..892738362f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3477,6 +3477,7 @@ F:	configs/ti_am64x_sk_defconfig
 N:	Xukai Wang <kingxukai@zohomail.com>
 F:	package/python-cloudpickle/
 F:	package/python-farama-notifications/
+F:	package/python-gymnasium/
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/package/Config.in b/package/Config.in
index a1b06227e5..956f87d305 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1145,6 +1145,7 @@ menu "External python modules"
 	source "package/python-grpcio-reflection/Config.in"
 	source "package/python-grpclib/Config.in"
 	source "package/python-gunicorn/Config.in"
+	source "package/python-gymnasium/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
 	source "package/python-hid/Config.in"
diff --git a/package/python-gymnasium/Config.in b/package/python-gymnasium/Config.in
new file mode 100644
index 0000000000..19185f267c
--- /dev/null
+++ b/package/python-gymnasium/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_GYMNASIUM
+	bool "python-gymnasium"
+	select BR2_PACKAGE_PYTHON_CLOUDPICKLE # runtime
+	select BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS # runtime
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  A standard API for reinforcement learning and a diverse set
+	  of reference environments (formerly Gym).
+
+	  https://farama.org
diff --git a/package/python-gymnasium/python-gymnasium.hash b/package/python-gymnasium/python-gymnasium.hash
new file mode 100644
index 0000000000..b76e0a5710
--- /dev/null
+++ b/package/python-gymnasium/python-gymnasium.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gymnasium/json
+md5  b67cd4243af164eb11888fe731c91e11  gymnasium-1.2.3.tar.gz
+sha256  2b2cb5b5fbbbdf3afb9f38ca952cc48aa6aa3e26561400d940747fda3ad42509  gymnasium-1.2.3.tar.gz
+# Locally computed sha256 checksums
+sha256  7dacaa9772e856aee6943b32ef663d3634d91d72ec7bbc74d136943673f91e18  LICENSE
diff --git a/package/python-gymnasium/python-gymnasium.mk b/package/python-gymnasium/python-gymnasium.mk
new file mode 100644
index 0000000000..1cf79a0baf
--- /dev/null
+++ b/package/python-gymnasium/python-gymnasium.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gymnasium
+#
+################################################################################
+
+PYTHON_GYMNASIUM_VERSION = 1.2.3
+PYTHON_GYMNASIUM_SOURCE = gymnasium-$(PYTHON_GYMNASIUM_VERSION).tar.gz
+PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/76/59/653a9417d98ed3e29ef9734ba52c3495f6c6823b8d5c0c75369f25111708
+PYTHON_GYMNASIUM_SETUP_TYPE = setuptools
+PYTHON_GYMNASIUM_LICENSE = MIT
+PYTHON_GYMNASIUM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
