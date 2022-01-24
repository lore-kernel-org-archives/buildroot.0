Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC22C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 615FF60D79;
	Mon, 24 Jan 2022 10:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_oeEtnQXT6m; Mon, 24 Jan 2022 10:42:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94CA360E31;
	Mon, 24 Jan 2022 10:42:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 912891BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FEC64017E
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAJQgh_QKJfU for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:42:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D7AC40167
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:42:42 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id q204so4325495iod.8
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 02:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7oa2GvZCKAi/uGbLud2xMIati9w/BKRF8oQIRg3mVWU=;
 b=Kz+WzoLNuyl96JFz+/4mLaJUeNML1kaPFiVhRz84DLjjdvbGBqgII4akSUQo8fU6jP
 kXHBk4Nriewb4t3FyRdfvS9agX19P1GOdHMMakGrtcxBx4i1XfvdUWOB3vGAnrmWx39d
 tHuvoujbfblXaF9oVgLJLdDK2qv7R/2aNp8qV9kdNqvSTrTvxzblUDM3JpLrQn1JZ8HG
 65Ry5rvcIbt5wy/LEAllsJy4JrF8iL9hCkMoSV8PYmczOeXBjnaP2PkJZ8PgPExqtyV7
 ASip0l/hl5wrNyWWrnBv9g+Zk5HQvnynbnC3sVGgBQ6GUNa+6NIXvWpnhePUPtl21oBB
 fSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7oa2GvZCKAi/uGbLud2xMIati9w/BKRF8oQIRg3mVWU=;
 b=o4PZYIyWDimMqxD/C5s6rSVvZyPF0zLUm08Ow4iL9i2iIpQchrJhIV5Gi81bk+7LOe
 yD6nJFcVcrvH7xGXFEvQeqoviOs4Izz635ZSOUF660eEuHN78cwwpdv0OFJrzGiFN2Tf
 wpVLRmmU+Ri+a/FZnItcdr3lv7FGx7NnQeC3tiKXUCGVZS98hjq/4cXEGuk5yAR0lhn2
 7L+6JMrN2ZwryQ+UbZYOB57Ti70D8cFK0nsNlo66W5ZeI8lP923oSyYBieJwwTXQfT2E
 669Hd3qA0T/HKMSJQXgVBxoswYxiQXSSCbKeFGUpRql95ZMYViohs+ne9dhdhuzv9N10
 sy8A==
X-Gm-Message-State: AOAM530bb8yWwBk6iNM/cH5wo62vd6dYz/2kVtN+mef2WRO630iQEj5T
 WbWDsnBWGsLA3N6pkiLSCpN0wsGj678=
X-Google-Smtp-Source: ABdhPJyGqT69V7yf8+0NBn9jlO+s0LUSTNbu3gfm6YQxZcaeKM/K2NB2pqYnE/5zLYbTFFfodYhYsQ==
X-Received: by 2002:a02:2ac8:: with SMTP id w191mr5030790jaw.89.1643020961616; 
 Mon, 24 Jan 2022 02:42:41 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id n9sm7762201ilk.27.2022.01.24.02.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:42:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 03:42:40 -0700
Message-Id: <20220124104240.531060-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version 3.0.3
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
index afd07e89f1..ea7fe71a35 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  059f89375d7ea60eb7013f341f0b89e7  Jinja2-3.0.2.tar.gz
-sha256  827a0e32839ab1600d4eb1c4c33ec5a8edfbc5cb42dafa13b81f182f97784b45  Jinja2-3.0.2.tar.gz
+md5  b76ae2f0647abebc81e7c03f5fb7b00f  Jinja2-3.0.3.tar.gz
+sha256  611bb273cd68f3b993fabdc4064fc858c5b47a973cb5aa7999ec1ba405c87cd7  Jinja2-3.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index bb53f95699..752daf653c 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 3.0.2
+PYTHON_JINJA2_VERSION = 3.0.3
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/f8/86/7c0eb6e8b05385d1ce682abc0f994abd1668e148fb52603fa86e15d4c110
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/91/a5/429efc6246119e1e3fbf562c00187d04e83e54619249eb732bb423efa6c6
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
