Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F6606A326
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CbHq6g10
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFCA1406D4;
	Mon,  2 Nov 2026 10:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrujGcsEub3z; Mon,  2 Nov 2026 10:44:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B99A9405BB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793616248;
	b=Xoq8tT2AdygOwoM2gFb9ioX1GPsVhVyGPM5nI7TDt7nB4dOXUVCOVL5DEdklTmEWTUNd
	 zAbGbtae1JPXUjSBYFAsNdGHOkIwo3oMZfwMUdvTQstoY/yc3aCgU04QEXUrxpacxI5tf
	 lfgolOmxVOt/moyWikxe2HEYYW5fyrOAvDyexnHML7u84cTjVcF1Kgp7FAXAmYYWo2vBs
	 p8Gh8P6BG2CYOJf7LXOxVC93MR14DK8K0EzQYTbRseYAljvherYMYymbl22CaOvgEYTyZ
	 NvAwGl8a3lgmyCNr2aWVlSafcFhGd8aYFv85veGN5dYMex379bs75W4fgilCfLwQ2ww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793616248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kstkJOoW4NtpHVSJ4Sfb4VBU2xE+PlUJ/ZyqB845H8A=;
	b=dhXteiOwbMq7wL7IsSyMRzMZV3qnPNoJn2K1MDnUiqW9ELHm7ME+eV2z7TF1OVXKcOew
	 j5j1fZJTLOGJThjiJ+3adrXO6ClVfQ40zBnROuDlLwHa+wwGxKE39VyDlsp3BR9WNTadg
	 D0mujd69wLFpBCDRh4X/iSw+vTFHHQ41k/Ii4k+bbiM2QKT1MmpK0OPnGLv557fGb1J3N
	 cbFr12kYwouwJaJsPZTKCJ1SBkZclDFhal0E1DJ/dHNR81YNj+q76aFDyE+OXalxqcw5H
	 GpeFN8WbFrxdVLCCsyY0BCNpdylU51hLx4ouqnM8ahSvOqaIzYeX4i7OEUtRkrRkx1g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793616248;
	bh=kstkJOoW4NtpHVSJ4Sfb4VBU2xE+PlUJ/ZyqB845H8A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CbHq6g10Fxpanb6DMX4F3Nm8jF+PkmOOS+NRvBySgL996AIdAQ2Lzz6TlDgCUYNs8
	 a5jCE9ysJ04WiYrBwywwRMfR6JBmrhpEJul2R16Gvw9OQxlNWkDxrxeM9Y6/8I1wNf
	 ft+PAZwU7bF6v7Ah140bAvLnbghY09GjOIEwxNLzcScu4cU4u+lIelLSjzv19hxGeJ
	 bLGg+2RDJFCipUgo0FuzImdWzNUDndj3eQXm3CoaNm5+L4ivPmAMN5cGl8YCzrcbBR
	 8hDHCp0BTPLgEA6hJ7OpC94rWZ4UrDjdTM3RFecWGeUFa6j3sW7jI0DxMw2baiv6ar
	 hy1DyGDzs2XSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B99A9405BB;
	Mon,  2 Nov 2026 10:44:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4693D3A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA4AC6075A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izC0K_GJ-RdD for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 10:44:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DFB4B605E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793616245;
 b=SRmpF6ySHMRlpJfPy8/Du3qGOl+j7GDaUMctErQSP5vBRr6SmHrFL4mUDuUCc3P3+PQM
 L+RqLNZY7enelNk7d8maZ143VAlvtHGWf39E4DwYUgcK0JbzdxoJ3cLdfcJ9MVPYNJ/Np
 LJ6HcdONyifEHBqzVVGWjiYsE/Cz4deE8+KFacET84G5ZvKeaUCCkapgnIk+dG7AYcBJF
 9UPSSTFoSJJcmB0dYAVD48tX5viOdRPg22/mtJa89oscR5gofEcgrYMHOmWaHCb+nXE+x
 FkAO50+jVN+XLH4DDzKonpVxZLLAittinBqRCAWGk6aRLSfpI+K3jM9KULc0yeLhNdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793616245;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DJ0yuxBSOyznbDunsEb0saGE9Kwq6OkFE5VBmSyfykY=;
 b=am/8GbAR5IqaLqr4gl4cTDgFw4vPFh61s8hF9dD+qaSFfEwqLWQcJbr11UMCWyZwkgCE
 htkXJ/V+zXEv0XOEV4Oohi9rxZcxNFxqlj2R3w9zhTHpy7IAziFb4vciYD8eTke5p8Utg
 ECil6tuE9yH4JlYDLxA5INO7HBam9PNombOjKhi3FnildOQF1N0+IzyvBU/jHiN2dWGuz
 yGqHRgSw3ssIuk5Psw3tAzTDqpyHZAv9BYrpXq/zgD2BA0RXkHVhOi+8bFu92Xw53T0Zs
 AHHcK1N0jp3vE2dTMhcndV9KjaGYtsxsHH6fBAWEqEF28tjP7g7ENadT4RqnLYtV67Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GJxzZDA6; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFB4B605E3
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:44:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48dfdd0678dso1952960f8f.0
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 02:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793616242; x=1794221042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=DJ0yuxBSOyznbDunsEb0saGE9Kwq6OkFE5VBmSyfykY=;
 b=igBLwQLpZBbv84HPysRlJbGvq/Z4RQFxNywQRr7HDXbV/cm4tCdpI2V+nQIKrnh2dp
 JuiMWvxUYrCkHPlJtIj0JKbRotHQtB6ODWTB3ylJ9Bk+KOo7J8HdQsrdJ/8x7CaySXgX
 tMeF3uwW/azKmFUkW4p1dCNaOPz2R1wT9Q2OalmORz+DkanHHCUAVUSjjJ/pnQ9mNjmB
 CNjvMU0machPdJ0+TqPLbICT65/4PEO4J5kVPqs3r+E19wplhtEs/MpATC0WoHFg4qrw
 weLOIyz/+GLZnnPAFZoYGehdX/MoGRV+hQapKvZM+X9mJ7PH7d0KneqWGn7bWYM8EQK1
 A26Q==
X-Gm-Message-State: APuU4Z+CeKQVCWwnKuFo75aZcavA9TNgrktUsoPhaW0P40FowjbBqOlc
 tlS5bzXC42VpIOngufbs4UkUgFxTLrWB36Dfub8kqiGg7tgxPs43abtn2w1KzV0X1Wkbsb2U79q
 pubsh
X-Gm-Gg: AYBFou0rG0q/SCQud8vWII8dj0oi9Ocu0naXnCQOEspkjC9LBipY8r3UlSWhEtTsrd0
 X7jFMa1qLPMCeGHVhkwKcx2dOjKjW1x06T+SkcKmJK2FN9k/cao1NEMqc0NShkbNjO3rxm/pHvq
 8lf5cZog3d84RiQ3/11/jk2QTW8oBcJyoEYVzAbC8KZjjnFlQcotdHOU/cwAbWEk23RgdJznSnE
 jeJbZ0POnC3HOA5pBS5GSgq+OWAYMMCy/odjrwAFK6CG9EOoIyg+LbCd61OF7TgJ8Ism79S6Q27
 CxzqTnIxlwvafCfqPBCxTpe7MPPKkL3XZD5/AB90Aq4GMf/2ougdgoZtZgWHGn03i/WgBHVgLbR
 Wg5v2JGRiwmn6Ic7Jx/aj6cI83ZqFyHnlp2IFGSxq4WNxa3jJHBD6KzWYk0cL1NjCb4POFxcBXc
 ANaydfqnHoTAekhylda0i19bYsrIfBV7bPWO0nAQcZNsdK9jU71CrbUZXJ0H/cIUwJNBeNY9+s/
 AdXdlx1tX3ANBPqdT1h9MtS1GVbELrVe5t6/0E8lwKDN7BJQkjAokFBAjAIN/qUgWY4SR/x8hSl
 WcmQXImsSswxfsJqjhNnjg==
X-Received: by 2002:a05:6000:40cf:b0:48d:c29e:40c3 with SMTP id
 ffacd0b85a97d-48e6e5008f5mr22715697f8f.33.1793616242118; 
 Mon, 02 Nov 2026 02:44:02 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b78f95sm17815838f8f.28.2026.11.02.02.44.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 02:44:01 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 11:44:01 +0100
Message-ID: <20261102104401.238208-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/openssh: fix build with
 LibreSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building the OpenSSH package with LibreSSL would fail with the following
error message:

```
...
/home/buildroot/instance-0/output-1/host/lib/gcc/aarch64-buildroot-linux-gnu/13.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: sshkey.c:(.text+0x61d8): undefined reference to `EC_METHOD_get_field_type'
/home/buildroot/instance-0/output-1/host/lib/gcc/aarch64-buildroot-linux-gnu/13.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ./libssh.a(sshkey.o): in function `sshkey_dump_ec_point':
sshkey.c:(.text+0x6598): undefined reference to `EC_GROUP_method_of'
/home/buildroot/instance-0/output-1/host/lib/gcc/aarch64-buildroot-linux-gnu/13.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: sshkey.c:(.text+0x659c): undefined reference to `EC_METHOD_get_field_type'
```

This can be reproduced with the following defconfig:

```
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_LIBRESSL=y
BR2_PACKAGE_OPENSSH=y
```

The LibreSSL bump to 4.3.2 in Buildroot [1] made OpenSSH build fail.
This has been the case since LibreSSL upstream commit [2].

This error is not present on the master branch as the upstream commit
[3] is already present since OpenSSH v10.0.0.

Backport the upstream commit removing the use of EC_GROUP_method_of()
and EC_METHOD_get_field_type(), which are no longer provided by newer
LibreSSL releases.

[1] d2423524b9 package/libressl: security bump version to 4.3.2
[2] https://github.com/libressl/openbsd/commit/aea3014df333871d02dc263a69746399371b2009
[3] https://github.com/openssh/openssh-portable/commit/30c746265ebde29806dba77c92fb1fd3803cbf5c

Assisted-by: LLM
Fixes: https://autobuild.buildroot.org/results/b99/b994397c0af4a8555b91c0fd4e84f3d69a67ec37/
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-redundant-field-of-definition-check.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/openssh/0020-remove-redundant-field-of-definition-check.patch

diff --git a/package/openssh/0020-remove-redundant-field-of-definition-check.patch b/package/openssh/0020-remove-redundant-field-of-definition-check.patch
new file mode 100644
index 0000000000..dde0338fff
--- /dev/null
+++ b/package/openssh/0020-remove-redundant-field-of-definition-check.patch
@@ -0,0 +1,47 @@
+From 30c746265ebde29806dba77c92fb1fd3803cbf5c Mon Sep 17 00:00:00 2001
+From: "tb@openbsd.org" <tb@openbsd.org>
+Date: Tue, 3 Dec 2024 15:53:51 +0000
+Subject: [PATCH] upstream: Remove redundant field of definition check
+
+This will allow us to get rid of EC_GROUP_method_of() in the near future.
+
+ok djm
+
+OpenBSD-Commit-ID: b4a3d2e00990cf5c2ec6881c21ddca67327c2df8
+Upstream: https://github.com/openssh/openssh-portable/commit/30c746265ebde29806dba77c92fb1fd3803cbf5c
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ sshkey.c | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/sshkey.c b/sshkey.c
+index 73fb89ac27ed..ab80752b8d0b 100644
+--- a/sshkey.c
++++ b/sshkey.c
+@@ -2705,14 +2705,6 @@ sshkey_ec_validate_public(const EC_GROUP *group, const EC_POINT *public)
+ 	 * EC_POINT_oct2point then the caller will need to explicitly check.
+ 	 */
+ 
+-	/*
+-	 * We shouldn't ever hit this case because bignum_get_ecpoint()
+-	 * refuses to load GF2m points.
+-	 */
+-	if (EC_METHOD_get_field_type(EC_GROUP_method_of(group)) !=
+-	    NID_X9_62_prime_field)
+-		goto out;
+-
+ 	/* Q != infinity */
+ 	if (EC_POINT_is_at_infinity(group, public))
+ 		goto out;
+@@ -2812,11 +2804,6 @@ sshkey_dump_ec_point(const EC_GROUP *group, const EC_POINT *point)
+ 		fprintf(stderr, "%s: BN_new failed\n", __func__);
+ 		goto out;
+ 	}
+-	if (EC_METHOD_get_field_type(EC_GROUP_method_of(group)) !=
+-	    NID_X9_62_prime_field) {
+-		fprintf(stderr, "%s: group is not a prime field\n", __func__);
+-		goto out;
+-	}
+ 	if (EC_POINT_get_affine_coordinates_GFp(group, point,
+ 	    x, y, NULL) != 1) {
+ 		fprintf(stderr, "%s: EC_POINT_get_affine_coordinates_GFp\n",
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
