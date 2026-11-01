Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11263606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SjjVN1qc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFF7680E27;
	Sun,  1 Nov 2026 17:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEgIHungFN_6; Sun,  1 Nov 2026 17:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 058D280DBA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552877;
	b=jaBO62mbB3XBTciFvG1UA57fJo748YkRw8O1JCdYvhjlgAWSylcQJc64VODLlXXa5/jh
	 8eaNVbVUZxwTD7sOkjucznjnoM0CDkSMN7ykNlaXEm1AISb7IAXjPdeIJU3HY2vRce+d3
	 /PeNHkZ0sNWtba31E9gMHCssW9f5yj/VZ18JkTI7stjs40Z1+n2md7yGNa1H/lTV2W/ID
	 zgCDfJRNs7PWVsF/glK+ExQZQb0vZl5/vOMjjhS1eG9JOJxS8cu28H3VAbuO/hnBTlz+4
	 2WA/zcOcap9Uwvt0i/BN4GMU/6Ih52U4gF77M2tXVgQ2eoBY2kgwb0TMXasLNjk2GVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1y4NQzI6dXvZTslJMN+o1V4uhk7vmU2P9d1/w5+su4Y=;
	b=FsR9mSCT1B8T6rIjBWq93GUz7R1CWaKfF3tSVBTAKNMVgTFw2xPdyXKs3KRz5dvPhVO7
	 GrK2mBa0Z2r31idDFjEPoEnery+ZQ9Y3uPCs8OoEqrIfgTif7gXg6QKmb48vK76OxDcK2
	 Ykwvn4oR3LGOuEsPbf6aLt4qfWgDBy3vc0P9t8LYbO0i4fro0YfXwENWeHUp3lrqsqahS
	 JyiKhBE08hXolp7J65tiVElPBKDQ/1/TLdH1Um7y2QINtZArVBiRUnmMN2+V9j+F6Hx+o
	 lyAY3KHkcRCKCPoORdZMWQdj9/7Dzn8GnO87h0di/ZRcmZlET5a1nIDykncoYz80Drw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552877;
	bh=1y4NQzI6dXvZTslJMN+o1V4uhk7vmU2P9d1/w5+su4Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SjjVN1qcSg4BwzLVapHBfvUkYIqh2UOVXPjPcQo+IQePeIDegtZpoosSTYQgBbe1x
	 zy7HQmIsYVkpHTUtmr0SrKQA0z9Dqf8oPtI+pD824ECBZUVZWpWqVQXxcR1J7R5IHc
	 5BIMaGuXtpO1NN0pZ8F70bdqTyLXe/puamdtebXkZJF3w0MT2dubwY9SRwY1At1dGs
	 2Lku1pg4q8c/2CYbjQ0F8t0oT13iJsAtDygwy0cb7Uxutk8ucwXg/68qFRvkujcDDD
	 3SQ9qUOJkgghoZVtKsgkmhBlUc+35gBCwYILljJHdbxY21fjsLVls5lgPmEnvSecp9
	 0zCCDyQscFdWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 058D280DBA;
	Sun,  1 Nov 2026 17:07:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50FB32AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 403A680CEE
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rBhnAlW4TIr for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 52FFB80D43
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552839;
 b=Yby1u1vRzdQDJV7a+tZmg1CYNrYJCHX47TuFH0P0NhHnFI0XkAeFA4WusYxUHODFLvHl
 lZ0Gzbp2LVNxjqTvDWiKYVFgdL+MR3pdqZvVn9910Otn4+Grqrx7bJf5H+2xE9v4br7YA
 U+nELvSnVK7BnPf2VBaepZOxKNYa4qCUhKaAhZy0IBf9mjXSBmk9QZDNgBZsZb5sW8wRZ
 pJ66HuHcQEUK3nSbCVC7qOLENvJKELIbClVkHs7GjOVtB3f+or+Ng1B++irY8QvsWtHw4
 ouaH4Sa7IP2jw0lhJdg1b2Jbr6t0bhQOX5y9EmSvrPCfVRbIMHcfcpVkf7F8PGA15cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552839;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eTgSbCYZafJd/nroEceF4a18D3rzUTu3UUjAgLVsRqw=;
 b=jtRaIj0AjHSNZ2LaA8h/2kltkYh+EQnO8lo4wxLHH6FqOMGew2jkqcnn7uR9hpr6TDCg
 8W8N5iiq6DoltZ7Q1S3kO4DfX/TWV14V8vac1uNVj8YTkrfKmeuqromW3TEJhBKOIZNc2
 QCvnh8mkrr8fLob53R9TuG1JVknMxCdr9wtqGPh477cEGMCowKf07X9EphKVxrKG/zf7Y
 MkUzv6a033ZFzje7MtSRJY8FvuVIAMFowt0kkNm1pRhISNkabcFnVVyz/pnpPcT+f6Nil
 ixfVgSPQegnoLrxegHeP5WJCmy6MsugPp4h5cYe/30mzwDEjM45Uiz7bXwhCeVH/alQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52FFB80D43
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 207449D4FD; Sun,  1 Nov 2026 17:05:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1db5919ddf9c0539dee9b5958498f2a58bd160b4
X-Git-Newrev: 0872f129e4397c63f39afe760ad4ae38a2e6b0d9
X-Patchwork-Hint: ignore
Message-Id: <20261101170550.207449D4FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multipart: bump to version
 0.0.33
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0872f129e4397c63f39afe760ad4ae38a2e6b0d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-multipart/python-multipart.hash | 4 ++--
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index 5163c82fa6..e3f0b30957 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python_multipart/json
-md5  93ad538d98ed5604845e537d8a0cb369  python_multipart-0.0.32.tar.gz
-sha256  be54b7f3fa167bb83e4fcd936b887b708f4e57fe75911c02aebf53efaf8d938e  python_multipart-0.0.32.tar.gz
+md5  c0154f3239d972a7c6a0db9d89593f0c  python_multipart-0.0.33.tar.gz
+sha256  b8112424a6abd162ec08d390565dd113ad699f2fe6fef3c987b8bbcbfe9e390d  python_multipart-0.0.33.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 7572dc4a83..d944bf767d 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.32
+PYTHON_MULTIPART_VERSION = 0.0.33
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/5b/42/55c32bb9b12693c092ad250a0e82edb5b31ddeda6eb772de5f308b3804ad
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/9f/b7/15b905f6142a9a8a68f66900788da1a32e4d4254452783b37ad1eccb0506
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
