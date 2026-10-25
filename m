Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19042606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XNRhTA6e
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE65D405F5;
	Sun, 25 Oct 2026 21:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWdrQhK6Mxfv; Sun, 25 Oct 2026 21:24:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0F7D140588
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792963442;
	b=F7w3Te7d06GmMWNOQjJVc8XEtUJQ3GO1dBol6XJpaJhJnfcPbswGHQWYYIBdU8G7NwKR
	 xV5hlz5AsghpO/5uZLC4ht0QWCnJgG8nuQ8ujydR390tIE48kwT7Bet8r6RQXgXIlM1vK
	 48SZdT0blpVb7Pm+f+RfRv7wOacu5FHKV79BPvn6gUZHuPRQop7DIWypkDQlcN1H5ok+K
	 t0OF1405XrfwDGIq0gRgYg1wCE1yGDrMddi794EdQxvznUMyhI4PcL7z0UPfSH+65XlS3
	 9M3sHo09IO39GLr0KrzHPdSZ5CdAEWzGQvBB1Vds6DfQDdARCkfH/MSAvN/EpfnS/hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792963442;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3v/3MP3UFgIsLyehyXFSNWGij5h3HOCGE60znJvK9DA=;
	b=OGJKbHBpVhf5LbTBemMRsKZXhMl11JDnmW85d60/AYAwcg5iTpCWl/s4qvwZTFclXqbU
	 VAbEbKByZp7Pen9x52Aex9EypFNxhHB3Oifu7Tjxcr6p/uuCixcLzk0W0JqQNplu1qOXN
	 poI1o8A77/5mk7dEkSe7wfDrc79vv6tPr/oEoZKmYHQpgltNc72HB8X4XL9qEyof8MzCH
	 KQhDr5zp5UiWjk52JCmOvbJGy8dzx6VY1aGbSrYMY7qrAc5KoYHSCanPWdvt8LydgYiKa
	 SqsHufh9TLu36LZN9UYXYT9lIStWSHpgscKcqnCnvuUiL0QJHg/f8D6P+9zKHESwiuA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792963442;
	bh=3v/3MP3UFgIsLyehyXFSNWGij5h3HOCGE60znJvK9DA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XNRhTA6eg019VnVTwixto6XVABhiw4lj9Br49hY6ZJBL04EptOxnTuZMTUnZbNqaW
	 zkDzUiVDDYU1tEnHDr98Oa9P/OwoI1Quo+6VUJ5oCgJJPlFJJVJAIeR+NC87KvlhuQ
	 fnQdGz0Ql85mJCNmUPKQEBv5qYi9N2vzheJiH+b1i3+6Qzs2WW9Pa9o/nj+tNTUrtO
	 moWHqTAAwcnR8prmc6FkDfEswKXfsmau5SZkx8sICOeD8neIioBLcs+6pLrBJXIF0m
	 VKSiK3dFd8bF964V2/MTK2wVUJXADXtyif+ztsRj3YPLn3Hjp1C9aqHhgV/7EyxJ+j
	 E/wKKXhVxxoBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F7D140588;
	Sun, 25 Oct 2026 21:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E718334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1406D40589
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmdFA_-SMy-L for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:24:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 636E440585
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792963440;
 b=sKTJOWHze+GGt4xsvH2C603RbIuRyoUgRmOR6EYkhofe8tupaBKulAllmJnrpU/ZQOeD
 eh562xEt22Oftx30HQoWOmpP0GW2ijZgPwUMYm8tBJ1QUKy+7InWj+in9Bv6djEJ3aoMj
 uNlZDhNNbrz+jEsSMMi/19i/Ewz2Vv7t85QI6+nb8iyfjsT/4BjjsPMbViKnir6iTOy0I
 +5T+KiBBYUr2+1/x4o3jasicn13EOL1sxCbo2vgdUnO4roma4Wn3QeCr+HSjRJvT3QX+Y
 X0Hult1gPQsz1KlZ+HFHqFu+p90fqq/3eYCNVpxzRIkSk4i6SSnxZ1adrPnxWiTd6SA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792963440;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xRajCYo0Q+gSxldSNUtHRu/Thfa/yckn8Tf/WxW+FJk=;
 b=A0M/b4bT8Dz1GIC02VG4v48E3hVdQuZ8yvusKJBQlUkcNK9eKjw7rknu6uhc+FxU34W4
 NAyVWntquEyl1gZ8pP2XFT4eizZ46v8zggMej5mB9R9KKp4yjn64iDY6vt0hzd8PlhLD2
 qbijVfXDH19ko+nn6ku1UXlaSxEaA6PufpeRlXOwKnuZPMsaa4tKVaQ5SdK5w5eagozdm
 +XVx/HMwITxPDX3fS6NutXukZlejsKjKkOlRsl/zx81GyC9u4NdgHczrQmQdUl4JRy926
 MtZboIpuvIpe+A+78tAUq/uxCcQLYuD8MvjdTZQ0VJi2kkBzLXdBGO8YUr5K9UyCLLg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 636E440585
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6FCA9CED9; Sun, 25 Oct 2026 21:22:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 22:18:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49e3806198097567ca57a0b75d9c7d7a258b794d
X-Git-Newrev: edd9d65265e0771e2aa7dc2be13e5ede596f5e56
X-Patchwork-Hint: ignore
Message-Id: <20261025212234.B6FCA9CED9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-restool: add runtime
 dependencies
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/edd9d65265e0771e2aa7dc2be13e5ede596f5e56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The scripts shipped with restool require:
- bash: they use #!/bin/bash shebang and bash-specific
  features (shopt, declare -A)

The ls-append-dpl script also requires:
- dtc programs: the script uses dtc and fdtget commands

Since dtc needs dynamic libraries, add the corresponding dependency.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qoriq-restool/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qoriq-restool/Config.in b/package/qoriq-restool/Config.in
index 600c2c958d..46330e8cac 100644
--- a/package/qoriq-restool/Config.in
+++ b/package/qoriq-restool/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_QORIQ_RESTOOL
 	bool "qoriq-restool"
 	depends on BR2_aarch64 || BR2_aarch64_be
+	depends on !BR2_STATIC_LIBS # dtc
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BASH
+	select BR2_PACKAGE_DTC
+	select BR2_PACKAGE_DTC_PROGRAMS
 	help
 	  The DPAA2 architecture in Layerscape SoCs consists of
 	  networking resources that can be assembled into various
@@ -19,3 +24,7 @@ config BR2_PACKAGE_QORIQ_RESTOOL
 	  that specified in the boot-time DPL file.
 
 	  https://github.com/nxp-qoriq/restool
+
+comment "qoriq-restool needs a toolchain w/ dynamic library"
+	depends on BR2_aarch64 || BR2_aarch64_be
+	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
