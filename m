Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BD9D3ABF6
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 06:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C00CD607DC;
	Sat,  6 Dec 2025 06:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbpMb6LCrGR7; Sat,  6 Dec 2025 06:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F214607BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765003059;
	bh=eAIKD6SP/VTwAEaRfu+CqPHkzgd9RyHMeMUodSEbe5Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=htAba+ez8Pi9KvZ3zdNGO5bLAfJuNcyXDceN4ZMKG9R4g2Do1T+jcaK3uwMzRBM+U
	 CB+XLJDxHy0IBBebbZLK1f4gvsJkQUZ8HhoIsOcxnZ7Pp3qmmZiWlCqFjorgdfUALq
	 Pbjk0nufMP0QGa39GXetTnhk2EP2hR6vls2kyRa6YVi5etsK4zAGvA+DedLwOQfjCx
	 fyDg2xGrexUTMHIukqrnKT650GpBwb0wtohWUjAsS9kmKlkbEZi9LEOryfwfWJRzQw
	 HunVlrXt3vlE/Z7LUptnqEKTPku83bkBzztrUw5zI2bx2pZ6qTvQW6mrwPalwn+PWU
	 tQb4nZedolQmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F214607BB;
	Sat,  6 Dec 2025 06:37:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E63FF151
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7825607CA
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPp-MudsdoHG for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 06:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2656360727
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2656360727
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 201AA86453; Sat,  6 Dec 2025 06:37:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 6 Dec 2025 07:26:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e11cac64a27d3be4a9cb7f1313276e6f386bb6e8
X-Git-Newrev: a65bbef5baaa04d9074264e56b76e002a8a39f4a
X-Patchwork-Hint: ignore
Message-Id: <20251206063737.201AA86453@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lugaru: switch to github
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a65bbef5baaa04d9074264e56b76e002a8a39f4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Old site returns 404 for the tarball and does not contain any repos:
https://bitbucket.org/osslugaru/workspace/repositories/

Switch _SITE to URL shown at https://osslugaru.gitlab.io/

The hash value of the tarball is unchanged.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lugaru/lugaru.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lugaru/lugaru.mk b/package/lugaru/lugaru.mk
index 53797f405e..57ec9fef3a 100644
--- a/package/lugaru/lugaru.mk
+++ b/package/lugaru/lugaru.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUGARU_VERSION = 1.2
-LUGARU_SITE = https://bitbucket.org/osslugaru/lugaru/downloads
+LUGARU_SITE = https://github.com/osslugaru/lugaru/releases/download/$(LUGARU_VERSION)
 LUGARU_SOURCE = lugaru-$(LUGARU_VERSION).tar.xz
 
 LUGARU_LICENSE = GPL-2.0+, CC-BY-SA-3.0 (Wolfire and Slib assets), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
