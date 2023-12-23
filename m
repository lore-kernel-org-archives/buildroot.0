Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC0FC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECAD982214;
	Sat, 23 Dec 2023 21:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECAD982214
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwtuWT5f6Ypw; Sat, 23 Dec 2023 21:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57938821F6;
	Sat, 23 Dec 2023 21:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57938821F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE8301BF406
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 777FF60BEB
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 777FF60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lBmhH15VaywR for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99EE760881
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99EE760881
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 806A782572; Sat, 23 Dec 2023 21:37:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 22:35:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c20334d35cebed3f28d92734fd6d070bfb936e68
X-Git-Newrev: 9212a719a5c3078048737d56596442e5ac7120a4
X-Patchwork-Hint: ignore
Message-Id: <20231223213725.806A782572@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: stop ignoring
 ShellCheck issues in google-breakpad
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9212a719a5c3078048737d56596442e5ac7120a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The issues have been fixed by commit
f1089391a83aa63b6977e65970451365f10dc66a ("package/google-breakpad/gen-syms.sh:
fix shellcheck warnings")

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/5815132933

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 99e9e0e0c5..0868593a92 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -505,7 +505,6 @@ package/gob2/0001-dont-include-from-prefix.patch Upstream
 package/gobject-introspection/0001-disable-tests.patch Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch Upstream
 package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch Upstream
-package/google-breakpad/gen-syms.sh Shellcheck
 package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch Upstream
 package/gpm/0002-Install-unversioned-solibrary.patch Upstream
 package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
