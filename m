Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A67606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HFhT8sxW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0523815CC;
	Sat, 24 Oct 2026 10:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ie_KfM7JSS_9; Sat, 24 Oct 2026 10:33:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D30D3813B7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792837995;
	b=V6C0mwpg32DVg46/l00b9xB2p1JmqxQCz4WFfUGf9eRWfwtHNwVMSa066o0U14xrCbcw
	 +MrZO715xp8m2VlasVXGDEU7GGCN4ZGVu11Y5mtlk+b7UDGb5jRCELMmgT6c4kW+yW3nL
	 HfD16caqu13Ppxo6cc1+Qpwknwg3H9BXqYLFm6QfU24zIXnnOtFNVmXn4qk6AdlMsLvcF
	 h3rgHlvIG8adjlL6G+X+0CWmktJ/sTwCDq/eBgJ+shDurgtpAgjPwb5rvtkht4Af4A+o4
	 fqOfrY5e10U8peX8zEvU06XIBnK+n7NhhkE9dcoI9o6SR7ru4szjS3Y7bTWfxPKBJzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792837995;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EahOsHwrG7LQBufId937prxycZZUxL0If+Jx8EwUicc=;
	b=keqoZwHXi90NnDfonfNaFAqAKuKihJuTzgh9wBptbwTrxfCl5W0JhEvajmxmj33yo7SF
	 vPa6OIvJa8/AHM3//b1W0pF+sc3o9kdMtL9ZkdWSlBiRXrSuQfIehMYP0KXWZBZnD0Mex
	 Ly+H8P427RU/S6EkSrNIOxzwB3u5TKVRQp8uR+he+s9+ZwXzHMLKUycRHx1cYDMkbqa20
	 BxqBSeJ9NPNjWCYdjrCo8/wNjQKYTmlC6czFgnCxcb6f+86gqVVsiTBCZohVsFO6bVu6K
	 z32i9W2E/TKadHATj1WetfWvbZqkOpaBc9XzwvvLcZu66LM5TuUWHSFV7W4WExLiZTQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792837994;
	bh=EahOsHwrG7LQBufId937prxycZZUxL0If+Jx8EwUicc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HFhT8sxWoC/f93+UzXbyqaEV0CEK1Ihhxn5oY+tH2GjKIvVPqFEBuwnc27aA9CsJF
	 xO5Chat0Gx6lK4Il9KjU2cMwKO1/TaGiS2syT8P9gAh6eATzIVxYQ6s9bRQoUPDRo0
	 CyULhiM0tIcMnve31gw8okD6E3JlBXzSdmTH3FEbLwTI21b/4hn3DeAWGjTleLCCCg
	 X+93Ef2vc5yuYq0Y+WeJpjU1yOtBeTc9qlvhJUr7WmdtTnVE4jHfAHlrB+jRg7hah7
	 zdOEdczZES/yj4vxvES2QiM/2rnxGP2DUs2zsk80sdFL4QHXa9jXVvhdgJpsCwR6HU
	 fhvO1FARXL8+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D30D3813B7;
	Sat, 24 Oct 2026 10:33:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05FCA4D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB45B815CC
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9er-JE6WKsds for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0CB68813B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792837992;
 b=ECN8rJv1jaspucXpRh/LivRuN6JNJG52ICtYm8CytWNXbwTUHmXQb7dX5k24mB/oC0Ra
 gz967CcBrPsunYYBdtwGYKKBwG5UHAAPkoqKHD1NvTxvKNrOT7OzAAv5M2sYsG5jplfJM
 EemyZzoz5dZEFUgWUE0HFpyeXRf8z7A5jHaqI9ENGtv9odIF4XssZlLUswOe39TiVaxq3
 wp7+V36Bo2YpgyUOk04pPIE5rfEsn72sKJo8yQ2gI9uyQF7Q435uI/k/dBTsFhJLdWbga
 fi6hbx/jH6lHG/l603qjGXmUZgBX7b1K8z8Qf3ASOdXvMRNYE2mrUiMcWwJbM4+rB3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792837992;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=me3AQ/TTif8UJASvD+is59CmzVxm0NnYLWhMYzwIyhk=;
 b=kYc9AOdsOI0xknCXC233RHz+Uz8VMHmAM3SAfR9HhHDQlUfPkBosHXHzXmsuLX7ATh3u
 2zl6rNSLkslVRwDRWmUU9et0mx0LJ+zhThSdOw+Wd6c+uHvcdxaLPXcK4ZTGXtHBskYqg
 i1ehSFSbqKRv31DBMeZLrlUAFnH6YvAiabxCqPOXhcIF5RrqVmAMx5LBGLLwRZ9vKca5g
 hwV65+7EwOvjgkFVYQl4ZL6k4u9OQGR/qD9cB6/ZCi9CPp+X5vFhcBQAYzgdbIopKjaus
 V0+UleXRnW483IeBSMJ6lfkCPjzHykT+JwzZm5oU9otnH55FH9NAYgGl8b5ahxPAH/g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CB68813B7
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 10:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A3169B43C; Sat, 24 Oct 2026 10:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 11:45:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f35240d627e5bf0d134c3a734543872f8eda18b9
X-Git-Newrev: 9a853913b9150a89f90b08dba25222a62a12b61e
X-Patchwork-Hint: ignore
Message-Id: <20261024103147.1A3169B43C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow-sqlalchemy:
 bump to version 1.6.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a853913b9150a89f90b08dba25222a62a12b61e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash  | 4 ++--
 .../python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index 1d1385026a..d1b76cb274 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  ad62daa42396557252047d43e69227bd  marshmallow_sqlalchemy-1.5.0.tar.gz
-sha256  e51192c204770645a2fab0d72f44f8789272eef75951f84b1608d6b4b0bfe0e6  marshmallow_sqlalchemy-1.5.0.tar.gz
+md5  654d6871e29a2a9ac80793df6171217e  marshmallow_sqlalchemy-1.6.0.tar.gz
+sha256  adebc7e36a7ec5662de93b00b850b50e36f4e8fe67ccf6e9e8e5ff42a78b1696  marshmallow_sqlalchemy-1.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index 15715d9006..db391d8d65 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.5.0
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.6.0
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow_sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/ee/fe/247c297809e64116f766716632adbc3f4cd06f376f56dc15bb92f170d247
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/a1/6d/097b9792559b6eef8c6c130d659be0ed8c9fe65b14ad4c425f6cfbc6e90c
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
