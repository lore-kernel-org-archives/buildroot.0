Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51FA606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rULlgTa/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F5F681210;
	Fri,  6 Nov 2026 15:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hP8jXzJUnOXQ; Fri,  6 Nov 2026 15:59:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8AA1B81327
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980772;
	b=meM/zSPU9crD9Rwn6bMLZGbnGrEnuwX6vm4tBlCuH0pDXCsM30Yqlsklr+fzgKvgYLap
	 5Ug+ICKmkJHUeCHvjLpOex9zmAIc1WVy2oILx0RdN3rw240un5nkoEFooIDYCh7jk5zTE
	 qP+VVKbT+J9VOrFGH6OuYcerfdA5pOdTh7/56er1F2pNmAp8AzvvONpkBXRuep1yLYvU7
	 bNIUKs7Smdh+rBC6N9apKrYSk3/MnTljhzBOwhVJYkLff1THpfb0czM5QJm/IZeTlQqOr
	 A6XKnZgJ7md32jC/jGZxmElTRFV9cKt2mlWFWQ9so9BYak7ym65lgAnHmSLGR1Pv3ig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980772;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7vx2XP5w9MNTVzKgLUBhMfE2uYz0JSRsMsuDr/bbIKU=;
	b=ZlPpYVGiUxLU5lN8Y7FadNWIkd+jj9xDU1B6dTfkc6QOxxPvR7e7Srcvi+GSCo9WvCni
	 Pwo53vViqfFQtbbdA9UjBQi+Qd57WDvejRUfHev5OmUU2l1i6J8U8mqW7rKSQQOjaOLxK
	 83bTd6HrpERJ3Nkj4cK79v8OWMcfkzkw4b9fOikIpqHMo3gya3ozbE6ip4+yZ74NNhHK8
	 +Khg2HeSpMVh81t+TChfG/nKwcfWfXrx/sW2sWugsW4oHkSqFNxhklS296TV/E/8GFIOa
	 jshEzqpHuVxI1mO82VLlH7/IYKM5LR3wc1fJUlO8NLdYNAEm+sUDu+bQvfcqnwHrxHQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980772;
	bh=7vx2XP5w9MNTVzKgLUBhMfE2uYz0JSRsMsuDr/bbIKU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rULlgTa/OuwE2q+DaBfh3tw5ppL2ingtX1d2RlTv47ldhwkzG8T6wGJ2Dm8QYtZkS
	 f9gp28CFS4THAtruvNB2Q6CSmEJAyL5RkLJzahimGcn236RLuIElvrflXkOvCubqvM
	 jXUWa+b20q5JM7w0P1wb7iD+Zw/fc8pAyaiTgvfzf0nLVeAt/ee0TNYtGcman/BPSF
	 xIZVJEgnca/aa9c5knLsgUUxUY42iCI/vLaTkNvRphWWQF67XFS7nQgkGtmD+1StIu
	 ulOSff2UbdPIjpCUA78lv7OoUgZ78gbxlbCkY1B2I+7EJqoL22iZkuj7fzmIpDQyeN
	 FVO7pRaoQcTeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AA1B81327;
	Fri,  6 Nov 2026 15:59:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BAFF7AA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3678A400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpxiM8N0d500 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6A918403CB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A918403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A253B9E09B; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 09:05:09 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6574d3a92a42b1e68f922002439495c280e09d11
X-Git-Newrev: 6d4f7583c4d30d95261aeddfa1a48436f0fe3bb1
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.A253B9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openssh: fix
 build with LibreSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2446337647418578923=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2446337647418578923==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d4f7583c4d30d95261aeddfa1a48436f0fe3bb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...emove-redundant-field-of-definition-check.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

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

--===============2446337647418578923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2446337647418578923==--
