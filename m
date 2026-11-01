Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF989606A330
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=agzF0WKi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A616980E01;
	Sun,  1 Nov 2026 16:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sx24VR07iMUj; Sun,  1 Nov 2026 16:35:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C114180DEB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793550923;
	b=SfxEKAGFewEzaqLtSJuMRr5FarQBVQl8lqKFsxziqXH6HRFznAW2+G8wlnyExBBiKfAd
	 5Hrd3l/jpVR/TM8fXXnH8UtPhVbZgKjj6e0u0v8DfYSf7gtQSiBdKNbhtoeETZPDsrzLa
	 Cml9+ZmfUSVYdDzBN5uT7CTB8W5otnStNVvKgRMVV5rGSotLpkEA2/stCTjWUELXjBuGk
	 pjJfhx3W8xplZY7ALMqu2/wEHrfoRNE6b/fKGWTbfMis/8o+YBDbERykaZ657KR3RuoxG
	 Dbn+ktJVkrMED5QGwvrx57FmRYIlHDQhT8EhNKDZks/zlQngi2hys0aFxabITunJwrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793550923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zXJunqM2DW5r0h/mb27go71RLyYkZcEkmG+2ZBFmpB8=;
	b=VUQO0luIC4MNO/Yqqox9Q7zNRBRqwsGxYgiiv4NKbMkw+faGhkFZmOl9fXlRjaM4DQOR
	 sfHGZUwD7LtJN6Z0996AwbbWwxOPiBgbgFXZ1yx3V8nXhWEjWaaPIQ6X+8+Krx0CyDV+R
	 9zxdMLlVQciK+C6DXBcSjHVX4MWIilP2ywSVK8KWDQzQajQlMdn/qj+TMTBa8PHhjbO23
	 mJj0AAsFdnc4IFVLVITo0QQ2WQGz1rlJL9nE2ry6bnm6IpSGgi7r2zdrjACZWEGbWqAOq
	 k97+zEsBh20rpvS5cn2afFJqDbbRtPlD7WRElq2e4BCzvOZr3xxQ3hXpUQ3/pBYX1rA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793550923;
	bh=zXJunqM2DW5r0h/mb27go71RLyYkZcEkmG+2ZBFmpB8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=agzF0WKiYUEpaMeQCjfjAq7ULgTfDsQPhmm4y8EYQObkULPdQGUb1YJ2EIW79S5Br
	 SNSKIt/Yt44X7X8gDTQ+oY17hoGLBtTBUS+MDu5+wSmCitNHGJqOKpp9tLUBZh6ntG
	 SoIVquYLAusRkC0UusRrvgXAtbpds4WtZomqcw20RKd9WVcqR6cT14AXA4cyRVj7Oh
	 UJLc/9gvwnonVaFlO/OTCcPpXgIrVhcMTuuZJopgjNEZuWv75nB+VBplboHuy362LX
	 G68kuC+Mj5fR8Q9oqAIGywmM/XsInJ06m1QELrxdwm7tEnunt/S4IWezysS8K5mOBG
	 hRpPUGlPsqimQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C114180DEB;
	Sun,  1 Nov 2026 16:35:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BB803A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51AC940462
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJf4eVHmXakf for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:35:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 92F214043F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793550921;
 b=rkB2jmIJkdnUvBTCLo1nttYGy+6VrK9mVYwacaXaEla4SiI+Wlqo4jgH/wazfizTveC9
 YYI0AzESzfIElYxgXs4tPp1n2SucZ9XAj9H40x+yJO5FlgWWA5Zdwn/XJDFlf25RwLp3v
 7VFBgBQeUDhm6y5ZKaC4/bGq6RaTukDoKgKPCQmFd6aXR83Ad/snNx1cvH+kYRprcOX99
 V8NCCj/i3kz0RiWkTZlnTA0oHUfhAvjRi/hRDiaKcsafoZ+7VZg2EB0eP8N1cnIwuNeWn
 3y/ztprjdyzpIQ1z7TbtVqvHRldwC+1HnB9Ye9z/zgiWFc6fv5mq8p8LARsjW6COVLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793550921;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HVejnUFMTr8HXZf0Cvxsw9MSgSK+matkEpjAa40GZfI=;
 b=T9WvXKZNZBhZaK88A57OhwZEhnBlSgV+ZEbJGTZXugR+2JKQg3jo8O53H0SKbDmY+Eq7
 aabftRBenoMr+Dt0HS2YKRCLr4vAxFUpGyQ4LgM5akW6v3TzjKfg3B/pHU9KFIhzajIdO
 s+HXjaD5YpbqmX20nftkDGaY+br3PmXBtt7PUgV2homr3og9XUOCYJSARW5Vljf9NCX4v
 D+oE5R9mYtiQRzJ5wm1zTEeTsmiDjnSIu8Wy1Tmroa3gKPxtg8n1jPU/WgcoS+NWlFMhP
 mHpx/6trWe2jgE79VW0/NL5jMpvkWdUVgNxwB0ozaYWcT4WmaZBn7gSTBuSNcefHrnQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92F214043F
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:35:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 540899D4D5; Sun,  1 Nov 2026 16:33:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:31:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 626ce47f204c789aa13219c3a9fdf31afc8b41bb
X-Git-Newrev: 6934eb7af36f7993d5aba4ec124c3bb7446d4f98
X-Patchwork-Hint: ignore
Message-Id: <20261101163352.540899D4D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-snappy: fix build on
 architectures without Rust support
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
Content-Type: multipart/mixed; boundary="===============0291111301949365107=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0291111301949365107==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6934eb7af36f7993d5aba4ec124c3bb7446d4f98
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since version 0.7.0, python-snappy uses python-cramjam, which is
written in Rust and therefore depends on
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS. python-snappy selects
python-cramjam without propagating this dependency, so it can be
enabled on architectures for which no Rust target is available, such
as mips64el n32:

  WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_CRAMJAM
    Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
    Selected by [y]:
    - BR2_PACKAGE_PYTHON_SNAPPY [=y] && BR2_PACKAGE_PYTHON3 [=y]

RUSTC_TARGET_NAME is then empty, and the python-cramjam build fails
with:

  error: target was empty
  💥 maturin failed
    Caused by: Cargo metadata failed. Does your crate compile with `cargo build`?

Add the missing dependency. The only reverse dependency,
python-autobahn, already depends on
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS.

This issue has been present since commit a8c315b62c0c
("package/python-snappy: bump version to 0.7.2"), which replaced the
snappy dependency with python-cramjam but did not add the Rust
dependency. It is not part of any release yet, and none of the
maintenance branches is affected.

Fixes:
https://autobuild.buildroot.org/results/1167070d4ede2d347f343438ab609c0fb3fda519

Fixes: a8c315b62c0cda0045616bf81ac08ed09c343621 ("package/python-snappy: bump version to 0.7.2")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-snappy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-snappy/Config.in b/package/python-snappy/Config.in
index a0e8289680..c98a3fc71b 100644
--- a/package/python-snappy/Config.in
+++ b/package/python-snappy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SNAPPY
 	bool "python-snappy"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cramjam
 	select BR2_PACKAGE_PYTHON_CRAMJAM # runtime
 	help
 	  Python library for the snappy compression library from

--===============0291111301949365107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0291111301949365107==--
