Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D039606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 15:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RfyBjvFc
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FC71408EE;
	Fri, 23 Oct 2026 15:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxAyHPZ-4mni; Fri, 23 Oct 2026 15:04:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 81CF0408F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792767867;
	b=D7rnfwybvzOhHMaGDlaHIZyKBdhwtT3184PwzAhUozEPQDjBgkDfkbK1VlCMDSXpyj4I
	 6abV1RreWfvx5CbIZT4xuI8YJyW1CNErj7Q5T2gDrmNGNpvhGfAq/bJrYqeScqubZj7Hp
	 OXfCmLHAsL26d5QPbAZIJip5nxcqTW4jt1jEwm4s5GJlmIgk73TNAmHaaIBruAWV1P44e
	 nXxTZWFktrH3o1jKaNDLilJfh/5dlLIt9TU9J6lqSgJl+Y/yTJG8w2VtIsCIuhbUKouIh
	 DFoKwvYvPcO5mhUZHAO8kZWEfsW48ecprWM5tn1OR6+fu9iqVjyf6shu9DNJwar5CZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792767867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=63gV/za7LAeP+fkH+AAK5lOOA8GqOQoKWIz6GNG29+4=;
	b=f9m2FW1AVqlQJjparzNrD82rG1jtASdgH/D70Uhu1X60GCZaKPHhQbzLdMjwGyzJzf7/
	 SN1No7TrBut+EjUI2LysUHTDHwkCGyFxktd6wuiNNcsXbXc+YXhItG/nMmPdlTFQ3M5v5
	 TyV60/K+u/kl1Luz5MnXdQIHsB09wvV6z5D82w7+Fas2/MFJn0u/Wp+BL37sLXohxEqWY
	 bBOmdn8s4mdBXrDOHPIf71e8/IHHjdU4LRO/wWmClefCe+sAfrkTKGnXcxKXC5J/LwNpz
	 nLs7Ih3JoVE3Qnraq3nA6jyeLGd+bXhlB1AdVzf15r2TapxM1RnyhQtJMiT4XI0ELBw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792767867;
	bh=63gV/za7LAeP+fkH+AAK5lOOA8GqOQoKWIz6GNG29+4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RfyBjvFctXiLls2L5iZdJth2QRaxHQ6srl8KE6sP6JvHKYpbFQR1WnZ6UBhpASHm6
	 tkZzFaHksOD2yw1CCEGVZHHIt4IJ6ekNwpnpYxh7TMzagd0BuDkQkezUlx8JgeSYz/
	 O8YToQqikqdUp5cqrYRHoycDpPHcmUjljl77eU4gF6wYhhTvVvMcXen2LqA+egDPpU
	 jC9MHSwYuMy4VvMO0nm67yJ7DHQuKaTf8xqImV5v/joJNlV5GiNTcncrLRi6xYngPv
	 safyx8QvWS8tHDZFUsNpQS9+cgxQBzLTe4XKasm6ysCid+7UUNbXmgZaO15OE/ZSgB
	 nqd3X3Fy/b+Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81CF0408F8;
	Fri, 23 Oct 2026 15:04:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50FE549D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42B22811D8
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxJtBOnJX17P for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 15:04:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1DA9E811D7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792767865;
 b=XniU5bSqHIwAwhQe0hY5SuPexwQ0pSSe7dTNkFVAJgpz4zjbB5sRQs4dxdWTJNqkAWqR
 HEHayVvt7Nc1FMVQhVnS6ziMsjdacRKHd1voto7A8QDJPOUAU/IjrtD38qIvVK0N9JVAl
 4zt91WAO7RYkVylab6jIomFFk9xohE9FDJqUR9C49r0+NmKzwQP2P8FZ/Las975IuXnKw
 ZUFb3XXSm4Qcn3wxLA3ZMfMsy0FgMI3YJWZNJVbrcn50opm+wo/172wDrAIjHy8z2Gr+W
 VH2uJGFq3zu74nUxTNy/qFhzBXpJjhshn/om4rTcp2ncUOaaeop5315K9u6fvxE9eLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792767865;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4NFanensUIByOa5aP81DTZr+4mwLX6Bpo5JkCMCUaOE=;
 b=KAW123LCAlVuF+R57aLnvpKSwwgCzhyyufwz+pz8gP/D1TnY+j0Giml+sK6S8GwUd+jV
 XQgRce7Vhne4Yf5rQS2tGhegaQcjp+ClU/17yfV1Ao9U5Muz1zViOhXsXsKldaWiTQC4Z
 duwFubeTA/6Lq8k2Crv7xaUkMBf/EbynJEWXwgwwoT43oB34Uguc9657tFewYLTVP571m
 28MxmZY+OqxmlBWFy+LTZO6z1Or2FZB6CGFsiC2UKs1/J/UuqNJbweS09jkIKaWevmEgk
 jKsPB3BG3/orHzz1mvABY4u/uuoBkC7n8VRgq8lIwgFNGuQpVAeGS5G0qNTD0evz3/Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DA9E811D7
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 15:04:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7676F9C677; Fri, 23 Oct 2026 15:03:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 17:04:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 079767988ce2a9c62ff782d31cdc0f5ceeb4c650
X-Git-Newrev: 2cbf77c1164f454f1b2e50765bbbc276b0c7b602
X-Patchwork-Hint: ignore
Message-Id: <20261023150300.7676F9C677@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: security bump to version
 3.132
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
Content-Type: multipart/mixed; boundary="===============4368381722347226778=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4368381722347226778==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2cbf77c1164f454f1b2e50765bbbc276b0c7b602
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 3.132 contains a fix for the eMudhra intermediate CAs ([1]).

For release notes since 3.131, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_131_1_RTM/doc/src/releases/nss_3_131_1.md
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_132_RTM/doc/src/releases/nss_3_132.md

[1]: https://emudhra.we-have-a-problem.com/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 02bbcaf00d..37922f094c 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_131_RTM/src/SHA256SUMS
-sha256  ca0005bc77e9255d9942103e6f9756cfe311a3df72afa99860709e386eb3c167  nss-3.131.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_132_RTM/src/SHA256SUMS
+sha256  ee9cf4837ba801141a804321c4462ad8f452ff4314275c6d5108a6b05af227ff  nss-3.132.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 6b4e68a624..209730f6b5 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.131
+LIBNSS_VERSION = 3.132
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============4368381722347226778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4368381722347226778==--
