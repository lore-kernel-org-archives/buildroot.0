Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECACEEF317
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A78D760B4A;
	Thu,  5 Mar 2026 08:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gv44x2a-9zpy; Thu,  5 Mar 2026 08:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B332F60B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697764;
	bh=p6ryFIruLCjAKQgweu9SCisQNllm766cg0Fh0I0u5d0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FKGJIS62ZrvEYhl39mdstzGhV5vAW5eBlfcmOaqLiWFtfTVfaY+UGRpuC30cRUxMs
	 Xjqmo/wenQ1B6SfHjOMIO3gKR+1gyHYZoTuz8eZol8Z2u61vlzGWe6ZuzSvjXLLyBg
	 sYUzdqrVJVsr+lPxiYOBeb7OPOmac4u/Cg/e0z0xb+DW9lO5WC0yBcYzdDr4j3n7RK
	 wRC61x1YuqI+j3CTgVE7QLeluvw3mDg8lu3uqdZX5uZn9oz5yb1/0K3hUtaSp3x/W0
	 SCt+Q8fIUNWwf/4dvugfyUGeQ5VSxbYUenR4k9VSnMCqNVgQDodU44EhEBBToEqVS5
	 p6OonRQAnikVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B332F60B7B;
	Thu,  5 Mar 2026 08:02:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 129C334F
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A831060611
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ibuw0_vWx7nB for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9088605F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9088605F4
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B66D5863DE; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Feb 2026 20:55:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 461eac6f23181c008110c11e911dfb453886a732
X-Git-Newrev: 603b0350b67201cd9e21f45be00dc04fece26d2d
X-Patchwork-Hint: ignore
Message-Id: <20260305080207.B66D5863DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bdwgc: bump version to 8.2.12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/603b0350b67201cd9e21f45be00dc04fece26d2d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/bdwgc/bdwgc/releases/tag/v8.2.12

This commit updates the README.QUICK license hash after year
update in upstream commit [1].

Also, the github URL [2] redirects to [3]. This commit updates
the _SITE url accordingly.

[1] https://github.com/bdwgc/bdwgc/commit/c40b182fa58b92a584571aebe50e07105476cbe9
[2] https://github.com/ivmai/bdwgc
[3] https://github.com/bdwgc/bdwgc

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
[Julien:
 - update _SITE
 - add extra info in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bdwgc/bdwgc.hash | 4 ++--
 package/bdwgc/bdwgc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index d38b2bb1b5..dca7e61771 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  832cf4f7cf676b59582ed3b1bbd90a8d0e0ddbc3b11cb3b2096c5177ce39cc47  gc-8.2.10.tar.gz
-sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
+sha256  42e5194ad06ab6ffb806c83eb99c03462b495d979cda782f3c72c08af833cd4e  gc-8.2.12.tar.gz
+sha256  46cf78d79f08ec7295e1c767213582c60eccba2c5bcb07b1b29fd7ddb138fbdc  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 0700ee7bf5..e81ad3b288 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.2.10
+BDWGC_VERSION = 8.2.12
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
-BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
+BDWGC_SITE = https://github.com/bdwgc/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
 BDWGC_LICENSE = bdwgc license
 BDWGC_LICENSE_FILES = README.QUICK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
