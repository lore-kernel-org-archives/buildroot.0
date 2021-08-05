Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F81C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:05:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A53BD60EEA
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A53BD60EEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 817F760A38;
	Thu,  5 Aug 2021 19:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9GnDwvYY2vr; Thu,  5 Aug 2021 19:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B85C760A46;
	Thu,  5 Aug 2021 19:04:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C70481BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADCB94018D
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Scc1tJzXMbuU for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:04:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF9FF40527
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:04:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 59EE18B868; Thu,  5 Aug 2021 19:04:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 20:56:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1116a3060955c36c43a8bea5f1f00ea4effb4e48
X-Git-Newrev: 4200631ce243c323bcc5ebf5fe8710f3612f443d
X-Patchwork-Hint: ignore
Message-Id: <20210805190431.59EE18B868@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: use dedicated 3.13.0 patch
 directory
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0871180574731253115=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0871180574731253115==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4200631ce243c323bcc5ebf5fe8710f3612f443d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Existing patch is for 3.13.0 optee version but is located at the root
of optee-os folder, leading to error when applying it on more recent
version. Move it to a dedicated 3.13.0 folder.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/boot/optee-os/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch b/boot/optee-os/3.13.0/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch
similarity index 100%
rename from boot/optee-os/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch
rename to boot/optee-os/3.13.0/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch

--===============0871180574731253115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0871180574731253115==--
