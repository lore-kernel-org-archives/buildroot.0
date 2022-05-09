Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097B4C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 01:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B4E28193E;
	Mon,  9 May 2022 01:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WeIyDZZqKDK6; Mon,  9 May 2022 01:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB1F818CD;
	Mon,  9 May 2022 01:38:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB21E1BF387
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 01:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8C38818C0
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 01:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smZLh3I_IcqZ for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 01:38:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8D76818B5
 for <buildroot@buildroot.org>; Mon,  9 May 2022 01:38:38 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id z26so13830429iot.8
 for <buildroot@buildroot.org>; Sun, 08 May 2022 18:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dpvfo6Bq14I8AytCBo28HI3RnKRQNJmE0xFpGv1K2KU=;
 b=VLFtDNmdPzb2B/VH4mfVB6FxMU+NmVsW4/PNoZzXoT5vCm27W/lFIolH1jhtKNwBeF
 VJmutKOb81U3VCWl7D5WzJB8zmpH8B6OC6j/aM+jy6ud7mWdRnbLbLn9J3BuaGYYYMBw
 /1lVj98Hc0XuIFzZVPsM3/10+TkkYv73xlso4v/AshbHSGVk5hRf/+enWWm36DPUU8pK
 PBZK2CFAqSUWcLDChdegCJDGjx1bZDROZS4VVI8nDI43cAvkWhfy6L5ogQaSQHXwOkW1
 I1Na2Q+yoFn+og39dA0jBZlzdrf8MzViDduJfJg1hGW7QU+H8xnphJFVmb32XdBfvRlk
 9Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dpvfo6Bq14I8AytCBo28HI3RnKRQNJmE0xFpGv1K2KU=;
 b=aTs4gvrUSutrNwUFEEmQaTdr2KjKriCbFzvscQtdDiUJh6INtBkrCXnnVWx5QCvpDl
 d/Z6Vw9ENOTAJhQ0SrdGOoJOYNpPsvhb0F7Lb8mvgHcHbGsi3xzbB2PEeblH0GBwxrqQ
 LMZeIi5I4a4PpqPToUF4bDqZsBdO/loFpf4Yw2nWMHnPVeeU5VuhcPrEZHVWdy5hQM+Q
 TYZRGvc1vIjYQFZy6HRh//UKXzZjdRVS1hGqzfRyhm9SRP4k69/hgL3bbIsj28t/W7P7
 eMuGRl5c3ml/0LvB4V7b0/uMcGjyZGKAU1TLrK6HJB9AWUQ/sn3MAtGNOVX/cQG3ex02
 xeBw==
X-Gm-Message-State: AOAM5300vhi9sXxamu1ZXUimMxa01OODlIVpIXetgMCn0hdwsSTfaUbu
 z6csXLmL3GYbrXoZ0GY1IqJv05E5Wuk=
X-Google-Smtp-Source: ABdhPJwdisbl87dpQFgsT8zPRL3zwZudsZbRLzZHXdb2smkyXIUCyGwJ97OoVi5eifrE567ZuOqh9Q==
X-Received: by 2002:a05:6602:2082:b0:657:ad1c:795e with SMTP id
 a2-20020a056602208200b00657ad1c795emr5573452ioa.187.1652060317824; 
 Sun, 08 May 2022 18:38:37 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 o10-20020a5eda4a000000b0065a47e16f50sm3204067iop.34.2022.05.08.18.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 18:38:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 19:38:30 -0600
Message-Id: <20220509013830.1862343-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version 3.1.2
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
 package/python-jinja2/python-jinja2.hash | 4 ++--
 package/python-jinja2/python-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index ea7fe71a35..2ab343cce6 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  b76ae2f0647abebc81e7c03f5fb7b00f  Jinja2-3.0.3.tar.gz
-sha256  611bb273cd68f3b993fabdc4064fc858c5b47a973cb5aa7999ec1ba405c87cd7  Jinja2-3.0.3.tar.gz
+md5  d31148abd89c1df1cdb077a55db27d02  Jinja2-3.1.2.tar.gz
+sha256  31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852  Jinja2-3.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 0503984bef..209ca2e25a 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 3.0.3
+PYTHON_JINJA2_VERSION = 3.1.2
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/91/a5/429efc6246119e1e3fbf562c00187d04e83e54619249eb732bb423efa6c6
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/7a/ff/75c28576a1d900e87eb6335b063fab47a8ef3c8b4d88524c4bf78f670cce
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
