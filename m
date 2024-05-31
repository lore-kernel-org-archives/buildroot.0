Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB16C27C44
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 10:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09A5940B14;
	Fri, 31 May 2024 10:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0sdvKNeo0Gr; Fri, 31 May 2024 10:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1860840B24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1860840B24;
	Fri, 31 May 2024 10:44:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90D291D50E6
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 10:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB1781755
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 10:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUp6dFQ1Bl7Z for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 10:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2453D816E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2453D816E3
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2453D816E3
 for <buildroot@buildroot.org>; Fri, 31 May 2024 10:44:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.89]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7K3i-1s7VZK3vUC-007lTP; Fri, 31
 May 2024 12:44:31 +0200
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 12:44:25 +0200
Message-ID: <20240531104425.2515591-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:KlvG3NBYOeANxp6wpVy1oV9t8kvTPXUd4d2gw/CQGT74yW8pjtt
 o8MXpEfpyDbho22xCbCkcGj722HLm+vyplGcN/Yi0618KeGLtCtgRUpQObDSPjSksWH5mgM
 CLu7rgbewOVMZtIg75HgdfV3qAx9FtTHuqOLzxarlmWYXZavAZOj80fMwKskPpXRYMb0xjt
 eyMjOZ2stoutwvVvXNSFg==
UI-OutboundReport: notjunk:1;M01:P0:jWx/oniBBfo=;hOMTJyNtTE2vl106bcf7WSKk59c
 jBFK1AvMpO+jvgZZzdtlyjvVgby/dq/AeMR+gNLnzjuYQaKIZ3spRBMqB81BhxcwQQ9Ey1FdX
 aLgrU+fQejRFL3zchKnHxm8YiaYRLStz4hCbdF2L8h1hHhiBrIO9fZ0ArkvHxCsZEcu0QP8t+
 hU6ptJbutwhPwFLaFnsgnHr0HIzq0uzTWzeg3rgFsXrmeFVOl316OqP2VUyRmnBPjfT7Aaz6M
 wI+9HAbkAbZQq6Y+S4AkDMjvZwO7iB/Ff3U6Jr6sVcUxEVHJ/436Drf+AUi8jNbzqPzKMLtlz
 8ew4QhkLzB7nDdxAg5QnVlkvGhObLdpzqZ4aJSYk3KIslZbC9+fL6d6lNcxtif+4ZtM/k9AfS
 P/GXx4jNMQzWQF+rzPTQxtuAIHDLGlC1qJmZCLVzn/OB2HM+KS+1kpKRcrDPNroqv5AFww+c9
 QX2rRXyGmkujwGxVKyuCqVkOR49K5+KStYO1HSqoKPLFJ71/2L2PpDROXkbEMzKoq6bw9u7Ji
 vaj+SGzqhPO8V3NB+FHWBDlIaLLUQhUKH9FdZOGh+vIqv7+dKlPos7JW0CaYClMFIot9dOIYe
 N1J/zHYkgTjdcd+jRJdjafULXbPvoT0mrfJUFb2iRCr6SctzuAaLKCeVJ0e4UlOh/4wiJSM9J
 q6LemkBJeycnaeY+r0Jj+P2QCLxfLgcitYlWJapHd5nS1cw6fYCBggUNU+tL9cvf6tYUjYDtD
 oWsIV8LLaLUeiROB7wh/ZpHH1zKMaQh5AvKo0Ld4gtLXrH2V13cwa4c+97HsG6bXB/eT0VUCO
 jaOJCHw7QD/TJ3aJkLOTz00vBt4ZvJRpd7DK1NMr3DNrg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1717152271; x=1717757071; i=fiona.klute@gmx.de;
 bh=l1runkjfEcjLpZCi1ZpI+WC0QP3GgSmWZTVXZeB9Czw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AY+peVAIF/ZqC/AGFxLbhWtKLQ9qcJGSqD/qsy+SZljlyFiTQ4LTAyXKtSbFn/Jc
 gKSjhTRXLNJVfuLuxz9iwZZWCYoeyHGVCMQTlnE918soTlwI2uxR6MhRVsEPB6bR0
 KjgEsP3wUePIEgXSBN1CuXN9P/NisYAH2HX90XEPzqHwOqYcMKdJe+Joo9KcGyAnx
 +ZOYzXOcwYmrmjYV7LLOqdMvg5Kjar/ne+/q4SY3P1c1VIUs27+8GNzJslWFjISsE
 JbunErH4s0OKtQ6zgjSA86STwswam4j3V1MzgUSPguKG7D4NUnIohtJPnLMy9/NpR
 yCmJqYfHo7sjK3PLAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=AY+peVAI
Subject: [Buildroot] [PATCH 1/1] utils/docker-run: Allow running with Podman
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Podman is command line compatible with Docker, there's no need to
require contributors to install Docker to run checks before sending
patches.

The additional "--userns=keep-id" option is necessary because unlike
Docker Podman creates a user namespace for containers by
default. Without keep-id the repository and pre-existing output files
belong to root inside the container namespace, breaking writes,
certain Git safety checks, and possibly all access (if the user is
using a strict umask).

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 utils/docker-run | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 79694474c1..3dcabe2718 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -29,6 +29,16 @@ declare -a mountpoints=(
     "$(pwd)"
 )

+if command -v docker >/dev/null; then
+    DOCKER="docker"
+elif command -v podman >/dev/null; then
+    DOCKER="podman"
+    docker_opts+=( --userns=keep-id )
+else
+    echo "ERROR: Neither docker nor podman available!" >&2
+    exit 1
+fi
+
 # curl lists (and recognises and uses) other types of *_proxy variables,
 # but only those make sense for Buildroot:
 for env in all_proxy http_proxy https_proxy ftp_proxy no_proxy; do
@@ -84,4 +94,4 @@ if tty -s; then
     docker_opts+=( -t )
 fi

-exec docker run "${docker_opts[@]}" "${IMAGE}" "${@}"
+exec ${DOCKER} run "${docker_opts[@]}" "${IMAGE}" "${@}"
--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
