Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C81BD0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 738E180E59;
	Wed,  7 Jan 2026 17:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIH_7FSrE2jh; Wed,  7 Jan 2026 17:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A09D18223A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808097;
	bh=X9jhCJH8xAPHOiIGWQkpxctNVOYsOhwYfuuM1O+bX4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HGq37hIbi7S45+/TQCP1FvcIC8KmOgPs7NUYBpulV/UT3nNPyTvO71OoIZV2zANkH
	 KzkdFPttLv5DvfRlC3j21s9QQ3R0f3do3VvWv8VMPaKuZxL7h9joEcLki3T6kr0QRH
	 3dpQR/IuElN5OQ7WN2mfsHP0m12vlN2fGdu5/Qqoye/aSOaLkQpyPy2sg9Js2sc7fJ
	 oR2+UuOhg9VFIuIlgOtYVYqPcNc6ZCHdYEv2wT7wMzvWt9VPsCSrRVYpc0fsx+LqPV
	 fZetW6EEJBg50NHAcoOHJ+4xGN9COlQXFJvfd7plxFUpHr1RibfSxGpSs2njbgWmzc
	 leAMAJXfucCpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A09D18223A;
	Wed,  7 Jan 2026 17:48:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5953E25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D1CC60A80
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXXWnaiekGsN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D7B460895
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D7B460895
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D0C781917; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:12 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5151492c6cf862ea8a7544c6b995be9de83e021e
X-Git-Newrev: 50c14b41fc74f65cacbb4931bf6580af3d3f3bb2
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.1D0C781917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/kvmtool: remove
 unneeded KVMTOOL_EXTRA_LDFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=50c14b41fc74f65cacbb4931bf6580af3d3f3bb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Buildroot commit [1] "kvmtool: bump to f77d646ba0" removed the
definition of KVMTOOL_EXTRA_LDFLAGS but forgot to remove its usage
in KVMTOOL_MAKE_OPTS.

This commit removes it since it is no longer needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f20615b53e83d6263346cb038d59df8e8d6b2b74

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 443307ef50e0a5b14b095178b7c8d59ad3639ab4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kvmtool/kvmtool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 7fec6643f8..6d94c41aaf 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -22,7 +22,7 @@ KVMTOOL_CPE_ID_VALID = YES
 # Disable -Werror, otherwise musl is not happy
 KVMTOOL_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	LDFLAGS="$(TARGET_LDFLAGS) $(KVMTOOL_EXTRA_LDFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
 	WERROR=0
 
 define KVMTOOL_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
