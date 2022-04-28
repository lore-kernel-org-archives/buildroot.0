Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0A1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 20:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FAC441BC3;
	Thu, 28 Apr 2022 20:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIiivI2Fg8BX; Thu, 28 Apr 2022 20:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1127D408D2;
	Thu, 28 Apr 2022 20:03:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C87B1BF275
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5249783DFF
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Gn-tRkDmIX7 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 20:03:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 589E283DF9
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 20:03:29 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e5ca5c580fso6238081fac.3
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J/13qYOUHrNXNhe7C1t3BbMKl4HVj9dnsAVNotZsVXc=;
 b=VcgEvKd8cxu2qRxnKth0YU4PCbHL2ir9pW+WNgLZ3fn79KuuvVKbbsE75/+iJ1Mct1
 6LDzlE17GnhcxhjqO+lf4vGJPQW/HSJI6zqDQN2L6eMuV2Y65zgq2ODkYtulDHKa2522
 HBNn7o0PYr5rdERwzpnAT/QlbaObH4w6lsqniXh94M7rgv4P1DZ1+dbSD8hHmBAWktMm
 HmxlDOGz5kVbLQR7yYLrHeuDY2Vs6WzyH3hpV33hL/tqBbmdukrhvLKbGmJOpJN2hEdi
 Pc2XjCZ6mgbI/FiqkgfW6gVSdDA6MpTL7KSGAOj1ZznARWBgP/NlyHRBoAASVyynDCce
 wO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J/13qYOUHrNXNhe7C1t3BbMKl4HVj9dnsAVNotZsVXc=;
 b=5+Kim+jNOmGjnm9L6hTcCnr47eDodofr4rPwzStGPQpoeH+YrZeEBCtPR/2qXXEOWd
 DOSvMoWE05Jp1WN/hvmp1fIHENLmFTi2pJd8oIVFVPIt20+YDAjnIk0/5mPl0pAt7Bg0
 KQZy4SxlY39dAh9Rm7DF3NCQjCYeMvh2/qwS8aQhWrmKS6o/MX7qYN3nCSP9X0wcvwkI
 XNSX2SyDUeqVuGYz6/WELBYTiIF7i4HvbqrMO7cwLcPiG5xeYmAFlrhLicU0jloNqVXp
 fBTTkIYb2Fq6oDN9j7JfXxgdUqO3Bnj8MSyKLWQ2N+OanEZY710tZvUXvINYuGNRXBjV
 JtMQ==
X-Gm-Message-State: AOAM532qFTUYCq+XOWj965CTAlebdmZkSVXPm8IklJOjCXYfJ815gHc+
 0AE1QON4EhzECmx79PyVXMmjW8cS5es=
X-Google-Smtp-Source: ABdhPJy8KuVZw9n7Lr4borjYrM8GbOqrkjTpww0QXcaVeX3El36REqku1TYqHGNQe2gNb4UgAB1CBQ==
X-Received: by 2002:a05:6870:d288:b0:e9:257d:db3f with SMTP id
 d8-20020a056870d28800b000e9257ddb3fmr11526299oae.96.1651176207992; 
 Thu, 28 Apr 2022 13:03:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056870a40300b000e686d13889sm2192124oal.35.2022.04.28.13.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 13:03:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 14:03:25 -0600
Message-Id: <20220428200325.789340-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 1.26.9
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
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 2415f24199..bab97249b0 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  50831ca7b19bbe2781abb0a4c2d51760  urllib3-1.26.8.tar.gz
-sha256  0e7c33d9a63e7ddfcb86780aac87befc2fbddf46c58dbb487e0855f7ceec283c  urllib3-1.26.8.tar.gz
+md5  d4b58522821a33c5e421191b83e0dbac  urllib3-1.26.9.tar.gz
+sha256  aabaf16477806a5e1dd19aa41f8c2b7950dd3c746362d7e3223dbe6de6ac448e  urllib3-1.26.9.tar.gz
 # Locally computed sha256 checksums
 sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index d94c97b4ed..cb2f7ffe5d 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.26.8
+PYTHON_URLLIB3_VERSION = 1.26.9
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/b0/b1/7bbf5181f8e3258efae31702f5eab87d8a74a72a0aa78bc8c08c1466e243
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/1b/a5/4eab74853625505725cefdf168f48661b2cd04e7843ab836f3f63abf81da
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
