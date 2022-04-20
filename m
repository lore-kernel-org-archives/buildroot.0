Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E798C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 19:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB7F841A0B;
	Wed, 20 Apr 2022 19:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQ6m69bjtDqU; Wed, 20 Apr 2022 19:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AC7841A05;
	Wed, 20 Apr 2022 19:44:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD55C1BF418
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 19:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91AC041A05
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 19:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOv-9mnN8XXW for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 19:44:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FC9441A00
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 19:44:05 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id e194so2989909iof.11
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 12:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rie2Iwf6tDz9pe2TokavT2HUPA6p7uJZPDT6PK8aCo=;
 b=H1khWr4sW6IbD8w3XyDidh9cF27eW+NHJeVGlwKcDTRb1pqN/Mmf5smEIcn614qigE
 yJ7ZZoJCqxFTfB/5ZRokMd87dhK2SbeJOUoT5752s3z9CcWBnubz0vanEqoxDHTEfGw8
 LDxw8k7rvoD+rPrj/dw4P7KdY6YPhyOGxlf9CwosjQN9LagySMPev/p7wrp74dL5PI7q
 YeqCEC1CXDQrldWO/YDnr0InpnilKo2O1BfkSNYn9T4vVfBoPYxcP9EZXvAe6k3gbG/o
 f0oGAOMezTlz0rh26+iLPlVbbnacpG6X9rQhZgTGR83ixPjCdfmPDkQpfxDMRPeJxhox
 VX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rie2Iwf6tDz9pe2TokavT2HUPA6p7uJZPDT6PK8aCo=;
 b=TxtWYx0ShceUuWcD6cY4tDK68DbOWvAJO50NBFh9DZURJlb2rNWUOWSlRjTe4vHeI3
 2zwQaG+tsi7NfweeNwRN+wEBRgBp6S8ab3Nkre/I2ItPu4x2LG2OpjrsXiL6//lmvYl7
 UOgV9nHAYQC7pvijTEsaJzkXqtIKsJBFPdJBFocKpzAKN5UbhDnvdcwg63/nPHoT8EXb
 dyV6u3VCuvw54D5m6aBlrXSk3f2UTOfACF486Knnp1FFmSBS8Ij7I5c/W6q5PZR/uW1l
 GRZ1EVi6JBRrAYygavQeNlV0uBZjzoGlXqWb8Sq4u9Q3a/qmTeGJf2HcbdFyacfTxvDR
 527w==
X-Gm-Message-State: AOAM532TpjmsCkOMiigQBjPm+5RsvO97T/iZIsqaesNt1bQHh+8HFWAV
 9jAsxoWU4VKjIsD9q7Xbk6c0bb8GXSDADg==
X-Google-Smtp-Source: ABdhPJxouuPbf9++XPotZR+rdkbXCJKBEZTC5VtpoqqklE8g0nNkraoT9ni0yWEc2LFyuwXhrVHYKQ==
X-Received: by 2002:a02:85e3:0:b0:326:68cf:c94a with SMTP id
 d90-20020a0285e3000000b0032668cfc94amr10972489jai.287.1650483844466; 
 Wed, 20 Apr 2022 12:44:04 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 z5-20020a92cec5000000b002cbe5a870dfsm10817279ilq.36.2022.04.20.12.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:44:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 13:43:41 -0600
Message-Id: <20220420194341.882415-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-asn1crypto: bump to version
 1.5.1
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

License hash changed due to date update:
https://github.com/wbond/asn1crypto/commit/557a90012370d31eefccd92599dc1d9fa2fe99f2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-asn1crypto/python-asn1crypto.hash | 6 +++---
 package/python-asn1crypto/python-asn1crypto.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-asn1crypto/python-asn1crypto.hash b/package/python-asn1crypto/python-asn1crypto.hash
index fb2da94ed5..4c9fda4618 100644
--- a/package/python-asn1crypto/python-asn1crypto.hash
+++ b/package/python-asn1crypto/python-asn1crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asn1crypto/json
-md5  00bf5b72d37778e62cc73b1d8909ae27  asn1crypto-1.4.0.tar.gz
-sha256  f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c  asn1crypto-1.4.0.tar.gz
+md5  f7a5271af9b81246fbdf57d703afce2f  asn1crypto-1.5.1.tar.gz
+sha256  13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c805306ccb9c  asn1crypto-1.5.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a88480656ec98943fb04344f6a477ee74062896f3ddb1a6f99e5f05f0109a286  LICENSE
+sha256  29c3425e5da53ab842273e5f2f2f068ce2e35df4260f7fa156aa1ac6bed02433  LICENSE
diff --git a/package/python-asn1crypto/python-asn1crypto.mk b/package/python-asn1crypto/python-asn1crypto.mk
index af4e43b3d0..480b70d17a 100644
--- a/package/python-asn1crypto/python-asn1crypto.mk
+++ b/package/python-asn1crypto/python-asn1crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASN1CRYPTO_VERSION = 1.4.0
+PYTHON_ASN1CRYPTO_VERSION = 1.5.1
 PYTHON_ASN1CRYPTO_SOURCE = asn1crypto-$(PYTHON_ASN1CRYPTO_VERSION).tar.gz
-PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/6b/b4/42f0e52ac2184a8abb31f0a6f98111ceee1aac0b473cee063882436e0e09
+PYTHON_ASN1CRYPTO_SITE = https://files.pythonhosted.org/packages/de/cf/d547feed25b5244fcb9392e288ff9fdc3280b10260362fc45d37a798a6ee
 PYTHON_ASN1CRYPTO_SETUP_TYPE = setuptools
 PYTHON_ASN1CRYPTO_LICENSE = MIT
 PYTHON_ASN1CRYPTO_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
