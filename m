Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D332C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 16:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08CEA4059E;
	Sun, 23 Jan 2022 16:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUYcLHKeVdIx; Sun, 23 Jan 2022 16:10:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01810405B0;
	Sun, 23 Jan 2022 16:10:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 982F41BF3F0
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 16:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86BF960C0C
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 16:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LALKUkh1FscO for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 16:09:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD93B60BFE
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 16:09:24 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id p203so5204911oih.10
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 08:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmwRou/bQAyLMDfIv1/PtA7VCDfuszOony3toq64mjQ=;
 b=DDWEUNCGHNQr9VDZpH53TpHVhPMYdXn0gsggHSxoDrcVDJ72sz6ajpPJ6jux/d59k0
 2IpFxi5G3jpDndhrGx22InNtItj0ehH5nNIVZ4seHX4jR7cNquO6uYGvNYxWUHqgpJF8
 njHGNAxJMbUVTEWx/Yfumyse2sJbYGGgVlVbJiEPPtb+rXYF85vqLbAmH0zwWj7kFqS9
 9GmM94E5qRjcPz4j0l1DmDKWdrEiRoMAjZVN9x5PuLBF/wmNsbrwNQ/qbd3dBCHrfv5K
 PFUqeEDGcxxm1/e2zrsmkJS4dQA+xwMry9cGWJQn9W9N/ZOGJkZ/CvvTORTqfiJHzl5h
 RpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmwRou/bQAyLMDfIv1/PtA7VCDfuszOony3toq64mjQ=;
 b=rrTI8uqM1/ZCnx4WIY2ft20ZPcsSViGinzLk5dVwiNnWxb8Ge9UenYSXF0sAJzwIHp
 0CoQUSIXCVef4Ftp9LWtS91+x+RDsuYJBwr9gi3ZY6jjFVa7bvKVfmKuVydj3Wj1Z0G2
 BbKqe0omQ/nMJuaflXnx9GeH7IyMDDmyLPdEjHvELCoBxh47oIIpUSeC46UZ6CSXAuz/
 LA5do04pPI0vRvGbo/3QiIy5R3qejA3iXRCsyVFQUafetMmKyl9cotHTC9C9JPU+yUpg
 0q7aM8Lx7tkx0tCKjLVprMzvpEyjHVrEjs4anJPvhS2rMBY/HVulhjJjFksolAxLUtD6
 c0Lg==
X-Gm-Message-State: AOAM5328OxoG7GbTZQQK5fUIcn8vtvvlGezbKuXqYFAM5pwLvLF2B9fQ
 Aq0OhScKtFFNQghjzL1Pq8OK7dVmk8A=
X-Google-Smtp-Source: ABdhPJzANIKQ6sQqHzgMQumSLHqAadrJfmxcVA0lDgU6aAIK2RAyCxn/ruUKwlr+jyDHAhv6DBRSjQ==
X-Received: by 2002:aca:ef02:: with SMTP id n2mr2053286oih.132.1642954163930; 
 Sun, 23 Jan 2022 08:09:23 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id f2sm4282763oiw.50.2022.01.23.08.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 08:09:23 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 13:08:46 -0300
Message-Id: <20220123160847.2653086-4-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220123160847.2653086-1-ricardo.martincoski@gmail.com>
References: <20220123160847.2653086-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4] utils/docker-run: new script
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a small script to run commands in the same docker image used in the
GitLab CI.

For instance, one can run check-package unit tests without installing
pytest directly in the host:
$ ./utils/docker-run python3 -m pytest -v utils/checkpackagelib/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - none

NOTE: see also this other series for another use of this script: to call
shellcheck from check-package with stable results, not depending on:
- the developer having the tool shellcheck installed;
- the version of the tool that is installed;
http://patchwork.ozlabs.org/project/buildroot/patch/20211226184919.2753591-6-ricardo.martincoski@gmail.com/
---
 utils/docker-run | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100755 utils/docker-run

diff --git a/utils/docker-run b/utils/docker-run
new file mode 100755
index 0000000000..499c194d13
--- /dev/null
+++ b/utils/docker-run
@@ -0,0 +1,7 @@
+#!/usr/bin/bash
+set -o errexit -o pipefail
+DIR=$(dirname "${0}")
+MAIN_DIR=$(readlink -f "${DIR}/..")
+IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
+set -x
+docker run -v ${MAIN_DIR}:/home/br-user -t "${IMAGE}" $*
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
