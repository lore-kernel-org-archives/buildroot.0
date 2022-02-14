Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54607C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F3A41504;
	Mon, 14 Feb 2022 20:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mfeUHNlrqGRP; Mon, 14 Feb 2022 20:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C30414E6;
	Mon, 14 Feb 2022 20:39:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C400D1BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1DFF414E6
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3nsBpFftpuJ for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:39:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B73574032C
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:39:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id i19so8862031wmq.5
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuV2YsnThLSnb7TJtQMP5WgBwt119ZmrnCdNUYbdOIs=;
 b=aWfY/7rLhu8eytXilzsihut3/taU30QC0863hdRnwLi7J0LafVndG8yS19Cyp/jvpa
 GG3qkHXpUfdneUc2DGiIgmwiaEnsWAEwkwilSP0zF3pwRISxJ2u6hOxikLk50WKFirAT
 hh6BXLb8xPE5jYVIYXpee52kkRQgLzXzm0EgLAB75qjj4rMfr5EbtHnnjjAmucykVWc+
 dtbwYsNX7rpBeDDnEASeSIiaWICttJ+MdHBq7R0u/7S2QXlT27FIGTI3i5WFqW3aB6Gb
 g0ju0K/fINVdf7uLrk2RVRKNHwrfBoMj8B9FotnzIluceNvN5IVcNlAQXuLhUE0fM3Y8
 /qZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CuV2YsnThLSnb7TJtQMP5WgBwt119ZmrnCdNUYbdOIs=;
 b=sLLt5+EYex6F9cRpr2n23oKPmzpV5VHRDm5V/ZR1xIbw0IBXJbiqHoZQf0rD/9M1a3
 7Gas16W8Jtb2kdoeVhhQ9li8LlOV98dSAKJ9JaDaQzok+/c0cWYB0w/Xci2wV6DC3gUU
 Ea2DtIh0oiLpJNi+NT4zDmuB4fbvnWkaki0BONCX8gEs5jiZmsUHGYJhCT7QO0FpiXnN
 4rU9mSAKxAlfXPUK2gY/WxbCWfDnaftR1egEPCFuaw78fhuamT8bboPYVd3aLHEvzl67
 ByxZLt/xZ8mpct0QhBdU+sg7323uRnn3XF/PKKqqUmAf9FAo9wZ/CLAz/la7vYp5QoAH
 eloQ==
X-Gm-Message-State: AOAM533dBgJLA8cx1Kas3LyVoxJhKzD25UNNq1xBNEtXGMlp70Je1QSz
 ondfoT6HREfoHIF9C8OfrUD530LSpRU=
X-Google-Smtp-Source: ABdhPJwTRC+SI0Aw2K9mVmUFfssPX2gpvtTXoB5h4aGjxPQmu5JrVUecam0eLpH1UmMFfQjzEct7gA==
X-Received: by 2002:a05:600c:1d22:: with SMTP id
 l34mr422189wms.174.1644871155827; 
 Mon, 14 Feb 2022 12:39:15 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:892f:28b2:cec5:360f])
 by smtp.gmail.com with ESMTPSA id u3sm15997677wmm.0.2022.02.14.12.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 12:39:15 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:39:09 +0100
Message-Id: <20220214203909.251924-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] utils/docker-run: improve user experience
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the docker-run script starts a container based on the
reference image, in which the user has UID:GID set to 1000:1000,
which may or may not be the same as local user uses, which may
prevent the commands in the container from creating files, which
foils the plan of using the container to run a build...

Additionally, the paths in the container differ from the paths
the user expects, as the current Buildroot tree is mounted over
the in-container user home directory. This is a bit confusing...

Finally, the container is left hanging around after the command
finishes, and thus there are as many lingering containers as the
user runs docker-run. This is not very nice...

We fix all of that (yeah, should be different patches, but meh):

  - we use --mount instead of -v, which allows us to bind-mount
    the Buildroot tree at the same place in the container, as
    Docker will create the destination if it does not exist, while
    -v seems to expect it to exist [0].

  - as a consequence, we can also set the working directory as the
    Buildroot top-directory;

  - use --user to force the same UID:GID in the container as the
    local user, so that files created in the container belong to
    the local user, and so that files from the local user are
    accessible from the container;

  - use --rm do remove the container once it terminates; starting
    a new container is very quick anyway, so it is as good as
    re-using a previous container.

[0] the documentation is not clear about that. It clearly states
that the host directory (i.e. the origin, the source) is created
if missing, but it says nothing of the destination:
    https://docs.docker.com/engine/reference/commandline/run/#mount-volume--v---read-only

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/docker-run | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 2bca8d8e3a..bdbc979264 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -7,4 +7,8 @@ IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
 set -x
-exec docker run -v "${MAIN_DIR}:/home/br-user" -it "${IMAGE}" "$@"
+exec docker run -it --rm \
+    --user $(id -u):$(id -g) \
+    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
+    --workdir "${MAIN_DIR}" \
+    "${IMAGE}" "${@}"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
