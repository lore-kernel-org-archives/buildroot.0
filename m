Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB50C77B70
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 19:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED6EA841FD;
	Sat, 15 Apr 2023 19:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED6EA841FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wt--n_dtkvQV; Sat, 15 Apr 2023 19:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C60D841CA;
	Sat, 15 Apr 2023 19:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C60D841CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07A431C40D3
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 19:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E093141D8D
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 19:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E093141D8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezHRTY-7EYaw for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 19:43:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E369941D7A
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E369941D7A
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 19:43:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2efbab2dfbeso517370f8f.1
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 12:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681587825; x=1684179825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ij0Uh6SEp/l5a8VNXmBbju6+ZwwJw96QQuJ39s4s5k=;
 b=X2L6zjIdZz8jlEQ5gkbY2RHQvegPldHAb1yxIDrdnhN3fqENRcIImwt0Y8x3BlaqOg
 9LYyvwGqMEhWFyZA6QOiNuCABnq6k8OSokobPdbrBY9APWjAUrgLUnP9HDxMjPm6r5jz
 HoVx6C6T1CTkdnAMs1IgwgoLj4qnLskaeYlIHSIhxNZxqt8IDJbb9LuecxKqXfdiuGue
 LoPIgUm11Y5C+Nqf424f41R/ZFLQ098ppDL6UVh8Bru54+8DlH0jtsxDKU0jYNCE2x6S
 TJWuILtcWu/kuESe5qlXM114uDYLrpfKZWSh4KuYhsERELY1CVIS9AgJlZKXnIeA43mm
 UIPQ==
X-Gm-Message-State: AAQBX9fnz2EiSsKQ6PdNQxBj+Le2nzwPJwnE4zvnUIFce9SoD2QQQcc2
 rVCzD7EwoO/XQc7LkTy1N0dTYOunr4o=
X-Google-Smtp-Source: AKy350YZqrLUCJSIzb4Mx9O7gJpnnuJQt94ud28vLfZpDOKThGfX9sT6D5XFvbk2G8/xnoiQi6RnDg==
X-Received: by 2002:a5d:534d:0:b0:2f5:5538:2589 with SMTP id
 t13-20020a5d534d000000b002f555382589mr2314109wrv.31.1681587824682; 
 Sat, 15 Apr 2023 12:43:44 -0700 (PDT)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f0ad8d1c69sm6277858wmk.25.2023.04.15.12.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 12:43:43 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 21:43:41 +0200
Message-Id: <20230415194341.2346986-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681587825; x=1684179825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=4ij0Uh6SEp/l5a8VNXmBbju6+ZwwJw96QQuJ39s4s5k=;
 b=s0SdsniUldd7PSkq8+9pZTJnOWT+PEFp3esrvxVgg1BvPEbc0tmwzAEfB8DX/yPB/h
 /BJ2NlHWWaseuOA5eISQRHlfqvIHWB9LTjgpUDDdHHD6P0fCFPxQrHKBXoemqh/G4wAt
 KOYWwBm6yUg5Acwh8ii63914PlU/VkJ9Lguu6jvT+WkD1zDtpOoTgtcXirO54MKcMKFg
 Hd19l8xHQEFV727nj2kap8vjFwP4GV08FRZogj60qU0UrINtD+mMv9XPk12iLm7LuJ0c
 iOwb/V03vD5o3oYxrguPfAANO1bKpE/APILI+/RHX/C4/ZXeBUGn5KcGEcCuGwh/85e4
 Bf5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=s0SdsniU
Subject: [Buildroot] [PATCH] utils/docker-run: allow running without a tty
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, utils/docker-run spawns a container with a tty, so that he
user can interact properly in the container.

However, that requires a tty when calling docker-run, which is not
always guaranteed, e.g. if called from a git hook.

Since the script is a bash script already, we can use an array to store
options passed to docker, and only add the -t option when there is
actually a tty available.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/docker-run | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index 164e11c0e6..135a1451b6 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -6,8 +6,15 @@ MAIN_DIR=$(readlink -f "${DIR}/..")
 IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
-exec docker run -it --rm \
-    --user "$(id -u):$(id -g)" \
-    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
-    --workdir "${MAIN_DIR}" \
-    "${IMAGE}" "${@}"
+declare -a docker_opts=(
+    -i
+    --rm
+    --user "$(id -u):$(id -g)"
+    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}"
+    --workdir "${MAIN_DIR}"
+)
+if tty -s; then
+    docker_opts+=( -t )
+fi
+
+exec docker run "${docker_opts[@]}" "${IMAGE}" "${@}"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
