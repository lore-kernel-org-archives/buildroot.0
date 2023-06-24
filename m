Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC93EB64DC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 22:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47BED40B62;
	Sat, 24 Jun 2023 22:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47BED40B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-BULGs1h7eK; Sat, 24 Jun 2023 22:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BD0D40B8D;
	Sat, 24 Jun 2023 22:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BD0D40B8D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBD501BF3EE
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 22:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B35D5417EC
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 22:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B35D5417EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QymqGuk4cy2T for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 22:27:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1FAA417E6
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1FAA417E6
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 22:27:12 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-77acb04309dso104445039f.2
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 15:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687645631; x=1690237631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MF7C71t7m/evC785PEN4OomDT7PMmpZcreyJAMW+W8Q=;
 b=QhdUFVSNb1/frtVHVGLg5jf9aioKaewVmCFl6T5xQVKHQD+M+2t5hy3FDkRbTRDRua
 gM/i7+ergP3jwC7/zGUDNRJPvFDlIRwEFw9rYKFr1TT2cW852nKuFzc2xm+0zJ92Ktx4
 Or7kFqizBbbJXZtgTMcDtu3joGNpM/AhEWLHCbIHXVsJ45sqhdaOQxL8f0nFAI6D1FPq
 d1zlnrvLBuRvhjXsfGjBotgYXQizroiES2xCjwQ771kxymP3fQnQEN6Kpfi85RvI6oEo
 bI1dt+DOcokeZUzfQtJT341+yCvyqVV56jxbW3usRSDVLJOu4LFY+fmV6H29hRZ3yzav
 tcZw==
X-Gm-Message-State: AC+VfDzxg8yuRh165UH0rs0DOSEeql5xMqkfZMIQun9vS25uuRaytnMA
 vncry2HK4HIua4p6+UxDztl2ynl2k8Y=
X-Google-Smtp-Source: ACHHUZ7+1J2u3owfn1mGcu/n5t38LIrN8P0I9EqwaVKAPPrCw3akhNO75pM5uevMmabO7vhcSd6X8A==
X-Received: by 2002:a92:c10e:0:b0:345:861d:a61a with SMTP id
 p14-20020a92c10e000000b00345861da61amr1866993ile.5.1687645631598; 
 Sat, 24 Jun 2023 15:27:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 b1-20020a92c841000000b003423bfdd0ccsm830023ilq.37.2023.06.24.15.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jun 2023 15:27:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 16:27:05 -0600
Message-Id: <20230624222705.606301-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230624222705.606301-1-james.hilliard1@gmail.com>
References: <20230624222705.606301-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687645631; x=1690237631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MF7C71t7m/evC785PEN4OomDT7PMmpZcreyJAMW+W8Q=;
 b=qnKmSFtHmEBxBuzb2plyrpqnzSFAWDd4NrCiEgUh71YmLUV1LcuEowhOPJQgGzd3br
 2wXAVfFXn1zNQthim/dgUyHIkOPnNltyigU7BMfGvg7jzvMen7GxehFleeNv99l2eiGH
 lW0iP3EMqBP0KU2iin+JL9pdv8JOfSdrSNWWqt1QdjQ0SNXdbsPdSQ8+xmEkngKKdNXg
 ZphwppvfHMbbNqzwR1KD5Zn5YcWOQRe7zqq3HOBN1eNec39iNIqx6MJvbwj9+ed1f+iy
 3yWEwK6Gmu/zM6zw60OQWgl1ttKwzqU9gHpiV3PCYSs8rp2bOfUc6iyjB/lE6Jjt3ePe
 fCcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qnKmSFtH
Subject: [Buildroot] [PATCH v2 2/2] package/python-setuptools: migrate to
 pep517 build backend
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that all dependencies of host-python-setuptools no longer
use setuptools as a build backend we can now migrate setuptools
itself to the pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk                          | 2 +-
 package/python-setuptools/python-setuptools.mk | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index c15a168f60..78e4410022 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -237,7 +237,7 @@ endif # ($(4),target)
 # interpreter (both host and target).
 #
 ifeq ($$($(2)_SETUP_TYPE),setuptools)
-$(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
+$(2)_DEPENDENCIES += host-python-setuptools
 else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
 $(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
 ifeq ($$($(2)_SETUP_TYPE),flit)
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 2674947162..d957930455 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -11,7 +11,8 @@ PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
 PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
-PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
+PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
+HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
