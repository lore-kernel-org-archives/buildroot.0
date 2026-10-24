Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C0D606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d1FQn4ig
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C36D60A9E;
	Sat, 24 Oct 2026 10:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCcC2xtfVWC7; Sat, 24 Oct 2026 10:33:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B5BAD60AA1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792838003;
	b=QVGkrGkUql/F9ZeLhSSbfG0Wrony/9kI5y8NXkvhVW5Cu40IDaKfOh3vagK+6CsD5jaO
	 aEpF9s7KfzcrN7s45GmDuS96TzrDcrnKJJw/REdrtytjuTMKcOuck21CV8ih7w4IDdMzr
	 qw6AoHyL86ZT7NwxnFCoWQvXgoCTxDJg7hH0rK/DbJ+Y3HvHvpgl91ZxajGY/+AAu5yYs
	 ZJsTsreGvzKlCpDiP7ZOrRZLnJquxwI4PtEqXGrGZR+HucufhlnyGNQoYeDrias5yDlFs
	 B737KeUr53jhBIu7p9kJwdwXlqUwBqYZCUuECQDqRoacf0MYZSsQzQA1LcEj4nk1LjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792838003;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/7FxNNXQ90HaLP36YrhLFi3+s9defzxr0Ys7Jt3F7x0=;
	b=PrFlwQtfzrPfHxPgl6YHKVPZGhcoWMsXumXwozy1c/lBTm9YnCp7B6VVJftt/iY5NUvA
	 UPCoAqBafMsijnd/LToUuprY+1Idbt63138Yam2jSXG1z7WTJB1aKuky2zpQm7yzZjuNU
	 4Rb6GSHWPqHrtFAf5aqFTqVuvbtSQ3DVUgmk+XPe/zkGL6N29dKoR8tRT2U64IB/sbhVi
	 aKJTp3L6xEdWZZT21jwexoRAMW4yNaemogJfS7NVdFxZCkKkZoBk6DGmQ6omhozF1TZDi
	 A0hsePGWZl4X9giWIdNmql2ctEDx/xGUJn7JYfNeOoI5sfpQDEis8OrxXxCB9vTL15A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792838002;
	bh=/7FxNNXQ90HaLP36YrhLFi3+s9defzxr0Ys7Jt3F7x0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d1FQn4igkv8SfsPL/GtZzzeuzTIml+brSOuT5d7gIrXpSHYH2MZGeZvKpfovo2mKj
	 u47abpb4/qk3xzf9vxYX8BmKw2c+m63s4lYmHahepNZguwn2R5xAsFpPIlelNA9v7D
	 3RDKZoWy6YmsiHW0dunLuxhiSnWUsZV+1PUC0yz3ziFTc9p5vtt3Csj5NBEla4uAxy
	 +PYKiwZYckN9hffn87+quoIh+z7yyKwNt9TIPUVAak2/Y62hDgFuA2PBitKtY7t/4y
	 Ljx6qynxQLeul4VkBL0Z6fXeFV1TXJOf0opWo5dhymz8Qge02FSaDefgePGhlWYfL4
	 fugM0Sjdgi3YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BAD60AA1;
	Sat, 24 Oct 2026 10:33:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DCA343
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4071C40A80
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhjU5Et4_p_o for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1C17340A72
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792837992;
 b=Ktfqw47VPPkvrj4SBj7Ip3LQ2ZpqWLqGj9SWl54e0qRqcqvO6lE0qeNmawudsgzdLfsE
 1GlV7ykH7Yj4Otzhp9NDsoYBJUrEFNH/HvM+wVVq5xfMYgDAgqtAKKj933SfZ3h+eascv
 oGNb7LSvop2zXGMkiQNP++MirTJzzcmhtg1jEkKuUrCrPWl3ZKVVZIhH722KPPkRyOU4s
 2CNeG8JWFPeLnoUoJ3NJbTdeBB4d3j4PegO1OMCIEKb7kYNpQ5MsYS52xhwU1XJHT7vaF
 gq3vii9sZnllp3uSFUT/GYohrvfWrFHKEYyBRFam1EAsuCb/8bBiPv2vnrmkfyqXh5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792837992;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=38i2I3yS0HJTcOrOdce2K0Y8MKnfRvZTeJAsBIAGY5M=;
 b=R6JC8GXEt4B6MpfS0Em+Jk2VFEpZquVEMNdS6V+L5DgIcX2UrDqyUA8gy9FpsqOA+YCA
 8hWvrM/Gkd3XVihlItAWEC6m3VjnsE1mlC/3O76vuUJ+uDy/fmsX1wpYmUspekoZ/NWz5
 Opu3u7An5kueOG443BjV1cD1RBbOzL43ubYrIHq1fRiBp8TO3Ej6GL3HH2s9PKXVTCWgj
 70jCmko5f8kYEAmXBITFQVzuubmWV1fTVdxLyhpWNumdNaGfeL+WEBZvfKczsyvY44woT
 R5tUkLylTS/9UCe9iZHX9VDPocth4XAIfIMjI4dhOM0hjhUWyaMhDsPtC7/vn+IekcA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C17340A72
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 349D686965; Sat, 24 Oct 2026 10:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 11:55:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f3bc67d341603d6f53bb0b9fdd4bd914c6f2957
X-Git-Newrev: 25b21ab9aae0de536c16e3c2460f78c13990e9b7
X-Patchwork-Hint: ignore
Message-Id: <20261024103147.349D686965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-settings: bump to
 version 2.16.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/25b21ab9aae0de536c16e3c2460f78c13990e9b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic-settings/python-pydantic-settings.hash | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 226a923bf1..4ed74fb707 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  68615b705951d9a2de8d8ea29c377580  pydantic_settings-2.16.0.tar.gz
-sha256  5b6c578049ede4db0e2ef3b4eaa4ad4069cfa9211f83fb38df899dfade50a614  pydantic_settings-2.16.0.tar.gz
+md5  c31750bce5209a37412ce332e0b31975  pydantic_settings-2.16.1.tar.gz
+sha256  aff602a1886338c2df3d1e958e2193a8dc33cec75b91f202e83fd98484b4b0da  pydantic_settings-2.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 708b1df045..1d5766dffd 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.16.0
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.16.1
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/2e/3b/a5d2294799b53b448319978cfb5bd139d5a9d45e862af91661614f14c922
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/05/ca/7817b4bf0c4b15c6a6ab8cdf4cb96c268335a8ca2f525de93b6ebe4c7d28
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
