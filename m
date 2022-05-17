Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE716C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90F5C40133;
	Tue, 17 May 2022 20:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tvjr7yU5gquZ; Tue, 17 May 2022 20:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FF60400D6;
	Tue, 17 May 2022 20:12:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACDB71BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A911041620
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8KMv-OPjalc for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:12:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58FC640A06
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:12:54 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id y12so6796ior.7
 for <buildroot@buildroot.org>; Tue, 17 May 2022 13:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HpNqyDoZiklORiMDs6066eaFX7hl343LS6C5J6oBB9I=;
 b=WFvjC/oB6NCJabL5E2m9A5ILUtVDLbBzisEHSHuc58rZ/BL2vGn+FvXPu0IIrZIicx
 WhBAwpdGyiXB+R1ohnDueMi7HISO9M0ej+PD+x9+TpGdt5SlnFYW/z9mF+MUqpPTbN0p
 Wfe7EvOwAtR7KdYuvtMEu1vDloj5cmzg/97m5ykGD+R2X8GLGCTOxqjEB/N8+RkkQAss
 gVw2WVT240XaDG4mZWM9OJ4xbRMw1WZrqAZTksLR3PUQh3JDidgE1ufWzpHDEB4aYUPX
 vyjrh0yqKsJuWwng8v1kqnASU+9bsfk6yH9p2Ull+HrAMLAmduunmhyLnBkcB+koGI6C
 sbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HpNqyDoZiklORiMDs6066eaFX7hl343LS6C5J6oBB9I=;
 b=u5ezK1IWUfNkFXoxeqT5OaHdRI2PdVGSQrVKIzPS0c7HlyiIYOmU1gbe2OmTBZ2rbB
 w/S7MLoHK/JZxeN3bhIJtdf70LCoG8KCaqb+TE2rFeTLBjDGUDyAfL2vz1JyVVhw5umd
 wqd8fbr5aMXzfL6VpK+sw2dLufYb0EnqJzAMPEdZWqIFHpy1+9egxSS72BbHLYqf4pAX
 JmuhQTAszxVpGY+RG2oVHCbkb6eYG/ZoC6008eY8r+ZUEKPw6z6iOmREaD109N5ThVmk
 t8BoKLCLdzmc3lSYIrxD451/XMCcobM5T2XMa0MQWfNnHzzgwS9lZMNM6XBH2Y0na1IU
 YtoA==
X-Gm-Message-State: AOAM5309O2Al4cus+btNs4tWVxO7Q+MIs89K1bd2oMK2pG9k0BtW5n29
 hFRcJG4+ed/NlmELB2YoSw0fNJZ2Vv8=
X-Google-Smtp-Source: ABdhPJyDYLknyWJiZtDCpboip1JAAejiGzO3lRrWGvefhcqI3eLyd8dF7/l3T0xTG/hHvV9ggVYapg==
X-Received: by 2002:a05:6638:2054:b0:32b:bda1:3044 with SMTP id
 t20-20020a056638205400b0032bbda13044mr13191061jaj.32.1652818373280; 
 Tue, 17 May 2022 13:12:53 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 v9-20020a92d249000000b002d0f8381080sm62999ilg.48.2022.05.17.13.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 13:12:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 14:12:49 -0600
Message-Id: <20220517201249.1518358-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to version
 2.1.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 1d6de8a0c7..73fa6b5630 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  5d499cfdd30de5d9c946994783772efd  Werkzeug-1.0.1.tar.gz
-sha256  6c80b1e5ad3665290ea39320b91e1be1e0d5f60652b964a3070216de83d2e47c  Werkzeug-1.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/Werkzeug/json
+md5  5835c8738b8081c53367cbcc5db8784c  Werkzeug-2.1.2.tar.gz
+sha256  1ce08e8093ed67d638d63879fd1ba3735817f7a80de3674d293f5984f25fb6e6  Werkzeug-2.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index fe9b87af1d..9b32fdf097 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 1.0.1
+PYTHON_WERKZEUG_VERSION = 2.1.2
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/27/a33329150147594eff0ea4c33c2036c0eadd933141055be0ff911f7f8d04
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/cf/97eb1a3847c01ae53e8376bc21145555ac95279523a935963dc8ff96c50b
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
