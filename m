Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8985E73151
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE60F40A48;
	Mon,  2 Feb 2026 10:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzzEf1NDv2r3; Mon,  2 Feb 2026 10:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE0C840A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027597;
	bh=OQGzxkAZGYsQBdh26Hgqgvfyid4apv6IHmYPNZmm8mY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hJuG2GTGRL1huwkY1IGZe3iAgRkL06sduID9AvyTHLQ3J41dhzTILBykfGcIx0lcW
	 LXZuxjm5dqpII0Bi44bOllbB+vJvucYEw521z6pXsBNllpZ/hDL9ufu1YQEgWaTrXo
	 CgjsVuTNE9q6rT+bnIohskHjPw+h9xu0QzX6nRKFuIkxjULlBH1T2Xxb5b0qAFnY76
	 kh7pIt+XE3V2dInarGcUKh1g5lglN6cSmZZl43YjVtKBFYwdmP0/KCUs04QU6Zs254
	 cJv8JP9k0q970/pNUOH8r0Y8Znib6wBVVmNsW4q+iqsKXOeJ+1/EKSU/OgI1hEK6sU
	 ldA523MWAkflQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0C840A44;
	Mon,  2 Feb 2026 10:19:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F701E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2603F401FE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPCiHOYVttNj for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F1A340266
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F1A340266
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:19:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37C8486283; Mon,  2 Feb 2026 10:19:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 11:10:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1dc7a75e2ded835b96e02c80238f35a62ec2953d
X-Git-Newrev: bac34296bfed5282df07496c845d74924beb5da6
X-Patchwork-Hint: ignore
Message-Id: <20260202101954.37C8486283@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efl: update Upstream: field in
 0001 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=bac34296bfed5282df07496c845d74924beb5da6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/0001-ecore_fb-fix-build-with-tslib.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/efl/0001-ecore_fb-fix-build-with-tslib.patch b/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
index 2756e0932d..4b12183de4 100644
--- a/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
+++ b/package/efl/0001-ecore_fb-fix-build-with-tslib.patch
@@ -12,6 +12,7 @@ ecore_fb_ts.c:(.text+0x4c): undefined reference to `ts_read_raw'
 Fixes:
  - http://autobuild.buildroot.org/results/fa111306b95316eed54771550474dae804fa261e
 
+Upstream: https://git.enlightenment.org/enlightenment/efl/commit/f28462ee1082a26e4c394ff5fc6e2994d02bfb0f
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/lib/ecore_fb/meson.build | 2 +-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
