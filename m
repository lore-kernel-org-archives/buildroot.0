Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9C9606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ov9K9Cxz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACF1C4075D;
	Sat,  7 Nov 2026 17:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYkgxNdEzEOm; Sat,  7 Nov 2026 17:53:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B40124072C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794073993;
	b=pDeU/xjYeSftLgfRK1I0oTxy7zNEnNnB8+K6fh/tO7BolFYkW7MRAwSxcXTQvZDLdycc
	 +qU6qArv4PjFVRel7fn+sVj8JJT/eMszWNm1wKhuvdmBgZbEZIyOLkgT8L+eierJ8KYZN
	 HhLT19eK5wuWrBk4Km41mO6GL2XyhhsqNAVY9dVi3/b7aAtO7PeNallXOTXTab2gXZb6m
	 RI1WO+qGsUkV+D8oZbd9aB+varycULEo1orTsyIEr8+o+Nw85fBWIpeRvUecgNFxuEtqP
	 9xeRxePY8Bqn+OAd9UK8zyh5yR6rrnjkwDrnJxvQmC6J+oxtZHEwnFDrAP4VSQ6nI7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794073993;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+4jGDkHD6KfcdPGySvFk8McI20NiGrmJDXT6OsqGYhk=;
	b=gANnlva8wi60apWO6cqRDOhPk8qrHqEbeGkI1U9Jyu7n+4liFJctIsA/tYRsChpqt5kf
	 3NdzJ2m4ipHiIh5n/xsG8g0kY/Ae6aydd23t0tLN7QIi0aMogRdAtqAcozayURQQouqdo
	 U5jZt6eHnqFfwlZVvS0eJ3NreaQg+zD59GDsxD1rfa1u2lgk3yQEXTBtAUipya2WeTWlb
	 5qfIe72NZ1a/Szqy/idAPjfIhdUCWaJA/wqq8zwAktGEvTwVkqIoGyWZrTdizZyCakwZP
	 yhPn+yXRD3TqgQ+u5LEKK3DtdRs3k3Z6y1Rn68Eiu041qonOBQs9x+6M9Zg7t5YrikA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794073993;
	bh=+4jGDkHD6KfcdPGySvFk8McI20NiGrmJDXT6OsqGYhk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ov9K9Cxz/5AYKQ91NNkvMVVHpq2iwv3IeUDFAElVPzkCiNXT6eKujM6raVsAqUObg
	 hRVfkR3Wrl8flyF1e6jkHsVkiqWIx9Z6ttAdK0OQWnEXDchFT82DMkqRbnVq1oPdX4
	 AYAPYixBdx2X6U2YZT8iNzXP/4TAcGum2frXqPZzx4qFnPqgChzAuBwUok+RUcQyZN
	 1WdtctElk1BQtOx6pnR/898RvXy2ZobhpZe/vEn9gaz24MF5ZDgA0EvK0gckm4Art9
	 +VGC3/IeHj4GbvYb7H15tgS7tveXXvx9H08C5WAc7sRyCBrdMHHn6woaowidktTSbz
	 4oak3jP07mFsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B40124072C;
	Sat,  7 Nov 2026 17:53:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85D30211
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ACCE80F6F
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id po1QMIKonPHP for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 17:53:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C489480F6A
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C489480F6A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:53:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67DB280091; Sat,  7 Nov 2026 17:51:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 18:50:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98de30557a490523487f880f843a0ae17970cc45
X-Git-Newrev: 31057104dbc52ec0b30c9cc0632214a75eb7bcd8
X-Patchwork-Hint: ignore
Message-Id: <20261107175139.67DB280091@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cloudflared: bump to version
 2026.10.4
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31057104dbc52ec0b30c9cc0632214a75eb7bcd8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index b963d57aec..b9c397c5f8 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8e1f95a4e4b11cf545dccafbc49c1b251b3b4625b1986ab8384203d6738c9cc5  cloudflared-2026.10.2-go2.tar.gz
+sha256  a6767773edf7123540d74dc02a04d7411b696066f6d23ea94131541dea532743  cloudflared-2026.10.4-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 5003515ab4..7436b0a211 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2026.10.2
+CLOUDFLARED_VERSION = 2026.10.4
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
