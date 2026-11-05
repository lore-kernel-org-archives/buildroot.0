Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF59606B07A
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W57XFDv+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51D2660888;
	Thu,  5 Nov 2026 19:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLFs8Qq2YSm3; Thu,  5 Nov 2026 19:30:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6ED4A60833
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793907049;
	b=rpLrNMwt6/iYvTx1pfPp5mLAXwDhSzcw1da2kkvw5YbCSK2Xty6jQMcKP3B23rZq3iIg
	 tZvL5R0X4pL/v6jcpUbpDJqGRS6r3i8rlb+q0z4k6JhGs6uvYaQ34FbeU7PMHYhb0urHU
	 u4P4s0iIt00IX30k/wDjvl3i5c8FqjaJxH+uIhtuLJSIxCmg306RNLn+DOqJB8r3tKrUK
	 DRab3ZQm7/et7f+wlL2GIGd3pmHiHfQIumLKnyV6RBRhMVBuu20uLkd8ToTqIOtxcLD3L
	 mYxu1d7O/AjPS9fwJT5oxCxpJqxLfSgPpPT6gdBOwxf2dVVKmSt5pnBVlBg7mYEiNCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793907049;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SDQZr4ov+M0eqadLbU8lNvydSKEc4BaILIi6SFA3gfY=;
	b=OEoSVfJwrwgWG7sXbDvuqwuDVvGSDE/mWvMfoMGJmHJrj48ze1bzj+q2UqZjY7Oa8BHZ
	 9vE+NEhc32bDnyEB83d/zQMjHtXkLl84ybVJ3WHd7srgyPzhVt7vb0piZA7DqFDoYiRjO
	 Nrd1QXmEkUaRA7eGbiIVcWwQp6oAD/cq4M2OELcTACnGl6v02Oi1UEXL9lnkCBDubju50
	 S88fPOvUsDxD2Ncu/JPIiitRdV7WWlzaZd0fOZjiAQlNOKXBBLXagfs7AzE2TTvU+A2Q3
	 zyYpul6W4qPamlGTscqWQO/53P3Hm8Q9KOUMlr0iAAo05zVyAC7g4yv4WBYMIZP9qgQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793907049;
	bh=SDQZr4ov+M0eqadLbU8lNvydSKEc4BaILIi6SFA3gfY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W57XFDv+GZ5AycLJ2HoV+I/+iAsIwHH14EJvh0IIsbQ7Klxu+zD+1NHH9Pzr6L4cn
	 4Uj4JiKT8EPMNLtbCpcXk5fIFX96fsX+MhUbNz7/m/D8EEmX+FLhxNSMcIw0cwU7G3
	 MwxwFgIx3BfFEnRZZ4f5n/DqcwfoP9smczPVGys1WaFyLVRKVvY9VZEt0DWV88+JQM
	 LCa0LfNrJCyp1QXYzAVEs1uNdn/HPK9ixswrobJStIb/Qbj1Sshzdnk5aGZ1uiiULK
	 Vr9utjtHgwRRpdfj9vtJ7eEPIIEbLY3Opsp0ee9R99vjDnSfHXB0BPIbAUX3uUT/nY
	 BBssQzQjvbmEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ED4A60833;
	Thu,  5 Nov 2026 19:30:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A7FB235
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B0548119C
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9ZDXMLTaU1N for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:30:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C709781139
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C709781139
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:30:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 689759E047; Thu,  5 Nov 2026 19:29:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 20:24:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b34752398f28ee6b15ab852daa8479864330eed1
X-Git-Newrev: 9c4e371d76cfbdfacd8bcc5a6322809b093d470f
X-Patchwork-Hint: ignore
Message-Id: <20261105192914.689759E047@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump to version 7.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c4e371d76cfbdfacd8bcc5a6322809b093d470f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release annouces, see:
7.2.0: https://lore.kernel.org/netdev/20260817193804.46fb3c18@phoenix.local/
7.3.0: https://lore.kernel.org/netdev/20261020194820.5c9fbfb8@phoenix.local/

For the changes, see:
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/?qt=range&q=v7.1.0..v7.3.0

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: add links to release announces in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 691e87bb43..645b1b5d79 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  fd9fa1b95809417157ca83dd72957e3261bdbce896353cb936f80af0b33a4b5c  iproute2-7.1.0.tar.xz
+sha256  5c1789d290bba048a6135ed1ab81b0402dd0fb528d1f1421765c42b1fc3d6289  iproute2-7.3.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 344a6fa8e4..aa0a094db1 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 7.1.0
+IPROUTE2_VERSION = 7.3.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
