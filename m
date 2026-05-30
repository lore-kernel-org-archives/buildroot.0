Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B69CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CBE6853F7;
	Sat, 30 May 2026 17:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSyxSI0pXqM2; Sat, 30 May 2026 17:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 075E0853EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162354;
	bh=7PwZ/Rf0RILyT4xgNEfjzUOHLNczSOcP+UlCnX1HeyY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z7sfcqmVL8568OtTD/7wDf0qv658znRsdue7RBcWyaOLmuPQPVIR4NN2kwRrHgZfs
	 4AyNtVwvrtyrek0HgJajaEUlQN4N3rZoqkLj735yaYZyzN0Fb0Hh2Ews7Keb+Vb7fa
	 fTKJcSXfPz8bHZJ5x3qieiJ5qn2vI92FWRYYnXynU3wL/1pKvu/EfAyLoWG7XlnWHF
	 TRaWgHdudPhM57JOZeGUdb8ddTZx2yVSTouskK15utgQz1g0Jexzkin+zFOjqiBj7a
	 PSkJBzrlbb0YpSZ6AE5WBa8ZgrpHZdJHN3gHXhF10+bbMwH3MgmJ0Bj1KCzgJJBmvo
	 4Q6n0nG14JBNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 075E0853EA;
	Sat, 30 May 2026 17:32:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DCC81F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97DE540064
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4EYCisbVM81 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A79744269B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A79744269B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:32:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89AA78753B; Sat, 30 May 2026 17:32:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:30:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11e380fb0300265b5e896a153e2dff2f0762fa1c
X-Git-Newrev: 2deee0c87dfc5db94da8ac9213f5d09a4d9a3038
X-Patchwork-Hint: ignore
Message-Id: <20260530173215.89AA78753B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: fix
 zlib license hash
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2deee0c87dfc5db94da8ac9213f5d09a4d9a3038
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
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
