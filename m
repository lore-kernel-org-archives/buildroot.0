Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4FACD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D3A881FD1;
	Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icSl2mrt5KJ0; Fri,  5 Jun 2026 12:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42DDA81FB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663129;
	bh=OHPq28DC9LM/dTr5Mm1zqEXknTH2VJ5UhvsXig2toV0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hXstIues2GijuypznAFKx3euZgNKj8F29/n4tIf/jfn3Frd08TI+zsTrsQbpoeZ2Z
	 UzViLFtLLyr8bv79k9UxPIQA0VxxPmvAmqCS3PX4zSCOmXsGdlhW4U9q8IzfLL4cTy
	 XciqUbO0RqB1fiqk/omNDq8uTRu2oWvxPLbpHQjqAWecswjuYUldd+yDdJP2XDvfSc
	 /dFNaGytXdMOXb7wbug0/XPatrnm8PtKyRPOE3b+RSIgCIHQp6FaBuqWPO3jcmLh9J
	 Slt8vSSmTNfkMfXVoEOtzazrk+XeqD8UvwIsxNk/EWo8l8wPk8QlAl+L0aEYOn/w4G
	 YPtiHyi3dpxxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42DDA81FB0;
	Fri,  5 Jun 2026 12:38:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17096F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 874B181E8D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRh1uZwo0qPT for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2D9881B7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2D9881B7B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC6DE87B3B; Fri,  5 Jun 2026 12:37:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:14:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 06baf64bf610e9588049bb613f340d114f5ddb41
X-Git-Newrev: 1ed651ecde524490e9cfa69eb7ea3a45e31ea235
X-Patchwork-Hint: ignore
Message-Id: <20260605123713.EC6DE87B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/qt5/qt5webengine-chromium: fix zlib license hash
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ed651ecde524490e9cfa69eb7ea3a45e31ea235
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit c53455ea4ffa ("package/qt5/qt5webengine-chromium: bump version
after qtwebengine bump") bumped qt5webengine-chromium but forgot to
update the licenses.

The diff of the license is reported by
git diff 0ad2814370799a2161057d92231fe3ee00e2fe98..18c9261dc5b8aa57a0bdd5b62ce6f648cca1ef5e -- chromium/third_party/zlib/LICENSE
as the following:

  diff --git a/chromium/third_party/zlib/LICENSE b/chromium/third_party/zlib/LICENSE
  index 9f056865b57..8aca25d8c7a 100644
  --- a/chromium/third_party/zlib/LICENSE
  +++ b/chromium/third_party/zlib/LICENSE
  @@ -1,6 +1,6 @@
  -version 1.2.11, January 15th, 2017
  +version 1.2.12, March 27th, 2022

  -Copyright (C) 1995-2017 Jean-loup Gailly and Mark Adler
  +Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler

   This software is provided 'as-is', without any express or implied
   warranty.  In no event will the authors be held liable for any damages

so it doesn't change its actual license, let's simply fix the sha256 to
the new value.

Fixes: c53455ea4ffa ("package/qt5/qt5webengine-chromium: bump version after qtwebengine bump")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
index 270da153c6..8026c3f697 100644
--- a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
+++ b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
@@ -1231,7 +1231,7 @@ sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  chromi
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  chromium/third_party/xcbproto/src/COPYING
 sha256  b244f73c3d21edaf44ec253b9a7c389ec43313c417f52f8b71914b0c40d87325  chromium/third_party/xdg-utils/LICENSE
 sha256  1cf71700f3403ca26f002e2dc1d1861dcb3d2af9bb9d98d529a903be9d7f06fc  chromium/third_party/xstream/LICENSE
-sha256  942755efa272dbfbcd7afea7a38556801e36c16dcad002d572378367094a2593  chromium/third_party/zlib/LICENSE
+sha256  e1cfcc55c325b3f78cf55df9664abaa066e2271dffe8213347d9fccdfbac8f2c  chromium/third_party/zlib/LICENSE
 sha256  1744e977d24e20e77b1e97d745fe43779430a1b84247b6c0e89d16e116e7ff92  chromium/third_party/zxcvbn-cpp/LICENSE.txt
 sha256  a4c8c5abf82b36c22f8c9f8bd6229584f32eb9f7a2429dd9664dda43e63e9fda  chromium/tools/grit/third_party/six/LICENSE
 sha256  63f0c0039b477857e54708d9501ed91b7a46e828ac3c623bedbc318129ceb174  chromium/tools/origin_trials/third_party/ed25519/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
