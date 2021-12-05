Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB8FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 054984055A;
	Sun,  5 Dec 2021 10:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDronyABhq1v; Sun,  5 Dec 2021 10:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36ED540572;
	Sun,  5 Dec 2021 10:55:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EB621BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92DBE4038A
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yo_tBUw7B_A1 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:54:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5524540155
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:54:38 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id a14so14243206uak.0
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 02:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JuK8fjAb+5uaovLNmjRJfxtZ4g33cMW9h6hbMHkUqBo=;
 b=Bz601M6nJMocRQ0o8cGFIQ1VW9Lv8OJth6KD88VVtqC3S5HZbpD/9GH8qh9mREarv5
 68W2rGC8qBFNPUfukj02r8genDCdxI12HZ82gMuzoDrBS/b8Ujftl7zf999KMNfpGl5O
 ZvW/xcFaIrbvHeOEnCdJJ1NtaRIZb1/DyFIyfgajle87N2WDp0hgrki52mDU1Dkkl88f
 Oeb9wbfjPUyaguyK2TBoRgpOkfSl2S/8t8V0L3fFnUDWD4h5kzT1GEM9Yp3vxFwNkEz4
 r4B5BMt6n8Op9NajCHPZjAMNZtoIxgD9eF8R2chn1pwRhacSgszvfWWP4MGhkJCo691y
 cuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JuK8fjAb+5uaovLNmjRJfxtZ4g33cMW9h6hbMHkUqBo=;
 b=syVfPOlt0gpfNJOGEdz6PnJk97iFk7hfVzIzD6nu9eUVfCQsb6Hkenl7Fdu5GgHVni
 8hvXj4oDqck1h7nav9BKzKl5O2hp3R87uqaDu4uDTuPb4/uxcA7DWaZEbTsNqaBui5G/
 aPlfrSfvgIYBZV5w8s1SCj3vfM7T8B18NlMrphUXyofQpamJ8HU5rUcWNeWPSoG6VC9L
 fFUqGtt/TVaLrVbLFg85khXii29ozBB6VudSIttGYqzPpgmMvUV+06Q+Fh+hkPa3Fjo6
 xc2qcnqznZiyYW0AxzVE1T1xuFyUNIevnWqG7dipViqW0z21hOwDvJ48WrjmJI3KCe43
 ft4A==
X-Gm-Message-State: AOAM532hpQeb7pe8LKEr8yrxN1rpvD+9eh0D2/r58cIgNv6WbFXhNPv+
 8x1TpBNE9HykvWMIz6v1YKh8pztBizI=
X-Google-Smtp-Source: ABdhPJyHpWWjJPnTW+mP4ASIBZoylBAvXb/jEDh3UcidCpwyQPAYN1OZ+dAW6qeDv208233/PzQG6Q==
X-Received: by 2002:ab0:4911:: with SMTP id z17mr32347448uac.91.1638701677260; 
 Sun, 05 Dec 2021 02:54:37 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id n27sm2417081uab.5.2021.12.05.02.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 02:54:36 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 07:53:18 -0300
Message-Id: <20211205105318.2755542-4-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205105318.2755542-1-ricardo.martincoski@gmail.com>
References: <20211205105318.2755542-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next 4/4] utils/docker-run: new script
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
