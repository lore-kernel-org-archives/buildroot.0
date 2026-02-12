Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BACEEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 566AD61655;
	Fri, 13 Feb 2026 19:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fk5yV_938Tnd; Fri, 13 Feb 2026 19:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9776156B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011510;
	bh=2wLZzCodnlM04glBw2U4m4Zb30BCyCOe8YoZ+Xzjwog=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FcGwkz+MTl2luiAKj+jJK7UIHSzisXppNSLfk2o+xYoSE5NrnnhZ1QCeIZX11QmGl
	 qheR3d8zktCJTpPvjiAb/Umw5B3O0g4V18sPFfdEVDghOXgaKUJFvxSlGfvptS5+Xz
	 jnELvafDG8C9rQIz+wtDX+hyuumHfhJK3u0COP5ub1R127XpFj5g2ldrwVxyWJ/lon
	 BSPGJCrfT4HajxoVU98u6VOTNdEhccI6igwdSQ0VUfDDKxHYgkxQgmu2/uH7FNlbqP
	 W3aQD7EJzhW4OsYYvHxypzTNw5xD+9lVzyBtHXJ+h3pwe4VeBEdVgI5YF8NX3NLodN
	 zYC4/eOL7BtAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9776156B;
	Fri, 13 Feb 2026 19:38:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03D3CEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 093FF413FF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KLg7o4IfiNE for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2C10412CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2C10412CE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97FD183593; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:00:47 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 2cdadeb453023db1ef6cd1a1513d9548e0e20768
X-Git-Newrev: fa26dff91c9a8a35bdf224dc03d6eaa241bb1e75
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.97FD183593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/easy-rsa: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fa26dff91c9a8a35bdf224dc03d6eaa241bb1e75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The CPE `openvpn:easy-rsa` is valid for the EasyRsa package. The last
CVE is CVE-2024-13454 [1] that is reference in the upstream bug tracker
[2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-13454
[2] https://github.com/OpenVPN/easy-rsa/issues/1122

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7bcad09c029bd66cf7ae819e7a2a332025cb7837)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/easy-rsa/easy-rsa.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 7266943f5b..2d70dfd05f 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -10,6 +10,8 @@ EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RS
 EASY_RSA_LICENSE = GPL-2.0
 EASY_RSA_LICENSE_FILES = COPYING.md gpl-2.0.txt
 
+EASY_RSA_CPE_ID_VENDOR = openvpn
+
 # shell script, so no build step
 
 define EASY_RSA_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
