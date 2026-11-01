Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3903606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nJWzTlFO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D100C40574;
	Sun,  1 Nov 2026 17:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5EBtu7nXqbPX; Sun,  1 Nov 2026 17:45:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1AA9240506
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793555129;
	b=To7G0u/mmkT6Tveo4BqUVvjWnlGbGIMDI9gF+i6dT68106jRe+6YjhGmgJ7UCWISULxI
	 6BpWSm+RNMTRgjLB6z8nOWCM0GriZW04IZOMcavEYozOV/v9WseteigBOURHQuw2Xa9WE
	 ilNEDHUu7VCyTgkIkh1NBJKySRA9aD6LrDSeUJAqrJUkzYXSRpU4ZzpdKHAjuj88YCfxG
	 z8w8z4H/ZGU3nnj3AIffyqcDfAq6stVZBYpEiN4yOKjCU7cwqLpNE0MahR5XCHtW00Jcv
	 LGPp0VOwvSMr5Yhb81QAEZl7v5PN5zBOeZqTrB+6tJZhbYM9anGIzafqYFQwB79B3Sw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793555129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GWLCDA/woeVdLJJqg4EH40v+2gdJOPOoYZf7hmWv5+w=;
	b=CNv0Xd3XOle9aJxgSN1rc4UPU6FNOMS0CzVPuv0WAmYEwjrOiExotOS6y5hvSaB2I3Si
	 wk7xNdNcNVa72i2SU6mhqYcTw1wu+yZU4mOu7zDYB5clEvlKaeB5w5jKcMkUHz+UvfWhI
	 rZUzB8YALhU/SLFtCuP43ElSOJfJoLwIN+qt/7vNwd5v+egnE+YhYQ3dyHkWRZ4Yvl29B
	 kSRo+v1v0h2t7JINcod4dr19i6+Y8BH4IwcPoL3fEkqS9OJyNQmtROKbgo2JWIc0LvljE
	 JFjPWyAQYYnfDjxmgnnCA8M75RAu1SWRQOVqz0KesRifqyTLhFwd8oHjaKOVlENSkkA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793555129;
	bh=GWLCDA/woeVdLJJqg4EH40v+2gdJOPOoYZf7hmWv5+w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nJWzTlFOW07f6qVm2mVwEWH6w9eO01bGFe3/IJwmNvch7/4oAgRI//iD8Rsbqc2iU
	 G3BCDdoNsD2lNdMc8Vp/nadeIpmfo+R0wajEkK6VAEN4lsVZRwwC+RLPrpDiofxRQy
	 AsdaJy0JVq6lIx4ujSvhZK521kHhhUKwKEvblh4X1+bt1IyIjepY15RPY9B2HmZYss
	 bPoEHg1mn5ZZUAS0I+qeTHC87WV1ObWhrv8LNzCS/1gK3LG5WA8yWG14h+HrykHQWI
	 3h/xomyNXxQ9/mTg1EfgEXvvK1/kIbEuhG7lEnJ1OswYEKaG6v6XoAnWOl1xyVKnq7
	 5eCQwRuvpNX1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AA9240506;
	Sun,  1 Nov 2026 17:45:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB84F3A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D15F040076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6Fojn1cVkrR for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:45:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A19694004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793555125;
 b=sAbu6JRtbjkgaCZI4GygRNM3KHBA/Oljy/eIeg0Hcrp9Z4F4YkDrHyONR0uHYcY6LyM0
 QawUKfGdf52RfFpfFz+kY+lZNVXcfLAGXxtEG6bEfu7AABmMY9H2bv/O05/4y6ppn3Gj1
 Zoq7W/DlPE9+EZMn8ggdbPjELVeK8M30SJnYgkm/5Twf5FgGl3Qb+psA47rU/YjwqdMLR
 z7j8yO+afeE69aRAJ81T+9ZSg86GvSfORfIPNEKuA1XPfMQvBhROXW8KQihYYpsWcnVJQ
 on6JGkH/nDih3NG+I8AA4QJlxx89YDEBP6+pqBGJEDKW6UECztveMbDC8MmR8stnD4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793555125;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZnFh6cN3IoPwncqJeuMzhIOcrak9eScfFuWfnBpc1xQ=;
 b=KoN1BmJMY7T730VqnI4AtFUqRD89vKmXsSx/vY5SP5kCR38r2K93jgYagr6q5OGhA772
 KnkkiQtnCwwVKxhUpxZ6q3EI/ghEGXllJ13R3qoyrvSwx9BPyXGirbWnnMHN4xzy9pjk3
 34MfoQ//jTKcH09rntBnXbo3qPIkoJ6fJQKrCWAHdT7fgz9+DA441mhR4oLNHJ0lmu72P
 X0sqAg/mlJU4SZ/o76QufnKKVVg6boQQKjalEpkgPeFIqhkwoeI8wqcMePeDDKVL39ABI
 yKZMRfmhNAVQ9MpEBn6ezrLG93nZv6+HCF1fsJbIrY/Gp1hbsNG7J0mq3rYz7S+8fag==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A19694004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:45:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F2019D53D; Sun,  1 Nov 2026 17:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:43:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e18c3c8b4122cebdaaae4fef519074293373f459
X-Git-Newrev: 545b29b942c7efa00d67e9c6b36a938a5e3fdd76
X-Patchwork-Hint: ignore
Message-Id: <20261101174356.3F2019D53D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olpc_xo1: explicitly select i386
 architecture
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/545b29b942c7efa00d67e9c6b36a938a5e3fdd76
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit [1] changed the default CPU architecture from i386
to Arm AArch64. Since Buildroot defconfigs are kept in their minimal
form as generated by "make savedefconfig", the defconfigs using the
i386 architecture now needs to explicitly select it.

This commit adds BR2_i386=y to olpc_xo1_defconfig.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olpc_xo1_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olpc_xo1_defconfig b/configs/olpc_xo1_defconfig
index 41226d892c..ea7f3df0ef 100644
--- a/configs/olpc_xo1_defconfig
+++ b/configs/olpc_xo1_defconfig
@@ -1,3 +1,4 @@
+BR2_i386=y
 BR2_x86_geode=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olpc/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
