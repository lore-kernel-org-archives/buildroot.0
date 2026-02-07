Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD44DEE0AF4
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 19:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9593C40BE3;
	Sat,  7 Feb 2026 19:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0Egok8A9chK; Sat,  7 Feb 2026 19:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0860040A0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770493089;
	bh=sd4INjlCCsyyr/WRg4AP3dGwzyYwYYMb62+Ou2XO4DU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TdKno9hWhQDrIGZALy/r8YoG/izOyaxVrbtR4/l44LNhQWES9Rm5elD0TmQOHx4X8
	 THBo8YiHwqLjoB3cH8zSkqB2qz+MzBfJM8DbpukFklU/UhLNr9YBptYMvjEakXGl+A
	 5JCYeFY8ih7EoM8FWcooBKnyQ/V3wbvbrWeaNdtlRadgtU8Xdzz54xrtvrAv7N/9RA
	 BquIUbXP/XIb69DUoosVnsEDwUylAwH2JUX9+Xwz7L0sTsPUbHcVHXaZm+KShd5erb
	 cdBI6bvMiVOWJEiXf5xWNEHUpxiLaAwadyewwsvimaLQHsd0eenQpPCXMD0HdPaOJY
	 +c5VM2ekSyK4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0860040A0A;
	Sat,  7 Feb 2026 19:38:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1E1C2C5
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3CBB8223E
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOufixwKTlQr for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 19:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2473881EC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2473881EC9
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:38:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01DB586B53; Sat,  7 Feb 2026 19:38:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Feb 2026 20:34:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbebf670c4acd9bccf81ea18f1cf38d9f934271c
X-Git-Newrev: 2b3b25a7dcfb4d0dbd99cadd8d898e3b7ecc790f
X-Patchwork-Hint: ignore
Message-Id: <20260207193805.01DB586B53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swig: swig-wrapper.in: handle
 symlinks
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b3b25a7dcfb4d0dbd99cadd8d898e3b7ecc790f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes https://autobuild.buildroot.net/results/e656684298b0462f8044667e7384c64d6508f22f/

Use realpath when constructing the path to the real swig so the wrapper
works even if it is called through a symlink (E.G. the swig<version>
symlinks).

Reported-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swig/swig-wrapper.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
index 61c885fc90..e6cf2df134 100644
--- a/package/swig/swig-wrapper.in
+++ b/package/swig/swig-wrapper.in
@@ -5,4 +5,4 @@ if [ -z "${SWIG_LIB}" ]; then
     export SWIG_LIB="${0%/*}/../share/swig/@SWIG_VERSION@"
 fi
 
-exec "${0}.br_real" "$@"
+exec "$(realpath "${0}").br_real" "$@"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
