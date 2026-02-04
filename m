Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E705E9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42CFD612AD;
	Wed,  4 Feb 2026 17:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovEkN8fBATbX; Wed,  4 Feb 2026 17:09:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A4E3612B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224957;
	bh=nFMJL3ZpGzzRqPjxeSKEC55QDmhL5g+TmqjhbGHkL6Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oxs5PkgD3TBew+KzxoVgLhwlNCra4lHiK2etFvS4l5i2OYVYn1lCdPuYsiIiQ2Tg0
	 zXxVJ+3At2TtRGnK+AJzb0oZH08KqKr5xZOgKYrKw9B7BCFSGnuNOIFyWpYLOidr/1
	 ae5rnKy8WcHqIqjIgG9zRTPsxw6WoBUJbbVPNV2XQKI5fWMk1w+0iGwet99Gr+qQIl
	 J/QXpSEhUshinZcS9xK6ZUewjDNbn0mzBYirJtjq5IAjLwaBBxBo9mzGYHJU+aw1vs
	 ujdJb+6AAfSa8Di5DxPyU/0wLZZuDSO4Gcd1RSfvtxm1K82ntNM7KCZZwFMGpfnBUF
	 IGktoVCCtIgKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A4E3612B7;
	Wed,  4 Feb 2026 17:09:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73C45173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AB1C4056D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1cwdrvzf30k for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 200184056F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 200184056F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 150368697A; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:35:00 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5cf5bc36f5eef207fea974befd66be67769a4a85
X-Git-Newrev: 03f85b3b08026936cdc7940e26e72c14b0db1ec7
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.150368697A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 board/bsh/imx8mn-bsh-smm-s2-pro: exit post-build.sh on error
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03f85b3b08026936cdc7940e26e72c14b0db1ec7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1a813ba4ee24429ab617d179d3b5efe6010333b2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh b/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
index bf8861f6a9..9306df3f3f 100755
--- a/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
+++ b/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname $0)"
 PARTUUID="$($HOST_DIR/bin/uuidgen)"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
