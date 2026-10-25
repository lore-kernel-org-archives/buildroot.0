Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959E9606A31D
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 09:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r13/8kS/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60DAC8108D;
	Sun, 25 Oct 2026 09:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Aw4mfket8NY; Sun, 25 Oct 2026 09:30:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 58C8680E86
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792920619;
	b=PVKPJ43+tWj5UnkTTV7cxWfk4FJt9cNcACviexunUPedaJgapyTA6Eh9lTRMt0pCV502
	 2FBOXeKPHfNKZ1iwZ76t3yveYbX5QETy2BiZLICj/BIASXSIm8dmKT8m0jwTh+QSuqgmh
	 ipI7AOVfaI9D1/fz5VpzlBYDi4/crWBkPthSTDDbFd1BAkie3QpcIAZgqOhT7YJL04VA6
	 Rs3T21TSLYsqF9sEMoFE6HV+S/9aoD9kC8/aXzp2/qy57CHXv8q7D9uZrXndayT6pBRjn
	 WX/dTC+UondkpHr26wWfTSL/a0iuO+XUJgiKYi/0fh0mjA3l45Tv/P4EcnPlTaOSIMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792920619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HOs1FZ8kypmqztCBnX2zhTO8IGXsxZQCM51nNu++6FI=;
	b=VVewUbPt9cjiADroXMPJhFZ+Xsca+py0518yUYPa4b/6MWd+GI/AYPcMhR/iZyEjwXFP
	 POsCdANF9agKoD9qE9K7NI8s8wjz5/8AgMsG1tmZwAckP/u+VmQlMqKHVC8qncpZ2TGlb
	 EwUyQlkf9YvKilFT52Hm+GtbfIgz7KyUaZ3jeVU8s0ajWI/VASv4AA7H9Z12BFcLiMrG5
	 BqO+2MaQZMtLxUTbvLMiEXaO8N+aFtTYArg5WRiYzSsTaSRu0wGwLkHqrKlCq7JQEnYX9
	 ed/VJy+FWEgQEiJ89/AN6+1sFfx1VCK6SoAsLPglv297vPssfTrP9W0T6NBmDphUDaw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792920619;
	bh=HOs1FZ8kypmqztCBnX2zhTO8IGXsxZQCM51nNu++6FI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r13/8kS/7CzkuKk5LC2vRUTSl1kIn5kZo6L1W/88lAYTGg2uf7hrfUbNZFsDazOKc
	 csPA2ROgojq9dyvUh0fb/qBm/j0Zi6RSrXgxh4V0xSEHECOAiKfyPCdPsJqDub2IWO
	 yQ9RG8011ARGM03Yj5SM0A/4roWlUf8ydRPIF85ICZXpP2i3UlX+Ickl5lXBLwBpmc
	 F/FS2g1RuX/WYz+LPYY+ZhcxVwzxUkkAUbxFrycZWNFqbgMlquvvkefkEeTmkkWMWL
	 wj+48ytE4NbMaNYXCQsKFheTPK/pLML2LjaINmP9ckZJg9QE3NY4XK7/SMHkNioJby
	 xkmLpCbL913+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C8680E86;
	Sun, 25 Oct 2026 09:30:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDFF13AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF62740663
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYSpic-cxSNH for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 09:30:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E6ED440661
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792920616;
 b=UrWTsnQU80Gvmxzug1glc3ozTSf1fG/+ymVaolgcZOSMVSIYaWPENZ7oxZfWp7GngH32
 7778uodiMtBndyC37BaHsEAZJ2Gaha4boPIDyn555oA15TwFKgp29KdekiQBVlkTdNVYZ
 AH2tMcbf7Xnzw4muYt/cqkurQjNyozdcDwb3waBGjlbRHeqQzOtfRujlq7RTJ2ca8B36j
 +R46+uNTNIRznKMRF2/vlQo1tpi0enEZnLLphKNJKaWCSjp08KKWChfoDvgKgonC7LJQl
 rDrdJuRadblpfXdJbtH0ubK3Khr9alesSGwG1MeHi8JSRbcmYemvZqepVxSMsEuRJOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792920616;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JPHT7sUQUIUQsBaOLMr+LU3HBoLiqv2hR7Qf1N9k7V8=;
 b=KJqmWUrLxplN4uHunM93eqXJlCpJNQsrgAvAl8GILI76zvItDXWaFDHCelFJQm2DHiaF
 ctg7WapvdFSNR/WAwyF2Tjj+NTJ1HNyPCG2YUBnkxtYr8GSsDynfAShIIzChDsJULMOgo
 l+PzZbht4F/NWqHKMc4byUNAibkvuuxDiwn0TJ8GyEe0RKSRCbQbQPpuwSd0eU+dygWTt
 UcaJuRO8KCUE3OBMY9KSoo0ELe+a4I5JXBYuFJ1Clp3EEI7G8W/4fj+IdZz9LIjqtpcvi
 8B3XbnfYggKGpRZNbIbDaD9OJDQwqkiKU81HyniSDI8WRUHREJ7xCpHviDMxqtnbpsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6ED440661
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CDE59CE16; Sun, 25 Oct 2026 09:28:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 10:28:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90d7316e9bd5117e0b36e0b00d6ff445d0956d2d
X-Git-Newrev: 728ea9f901a32146aa7eebc6b2d746764f41abb7
X-Patchwork-Hint: ignore
Message-Id: <20261025092851.8CDE59CE16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycares: bump to version
 5.2.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/728ea9f901a32146aa7eebc6b2d746764f41abb7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

pycares v5.2.1 updates its internal copy of the c-ares library from
version 1.34.8 to 1.34.9, in upstream commit [1]. The c-ares 1.34.9
is announced upstream as a security fix in [2], but Buildroot builds
python-pycares with PYCARES_USE_SYSTEM_LIB=1 to use Buildroot c-ares
version. See [3]. The security updates are handled in the c-ares
package itself.

Therefore, this commit is not marked as a security bump.

[1] https://github.com/saghul/pycares/commit/1e99ca3aed29afcaa716b10b2c909d26bdb7e904
[2] https://github.com/c-ares/c-ares/releases/tag/v1.34.9
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08.1/package/python-pycares/python-pycares.mk#L14

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 14583b122a..6da3a0a6c3 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  b326db41b14da39ba62344fc6ec799cd  pycares-5.2.0.tar.gz
-sha256  90ea74fe26593d2c4e79e1ac4dcdff4a2434b183ec6feef0524e4874a7d307ef  pycares-5.2.0.tar.gz
+md5  ff8d5334568ee3d563836691a1cb3c6c  pycares-5.2.1.tar.gz
+sha256  3e89edc56a3745046676207958bf3dbf2971c5df0d64de9f7a893eba8bf255b4  pycares-5.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 555f2e969e..0cc1cf586e 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 5.2.0
+PYTHON_PYCARES_VERSION = 5.2.1
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/e1/16/66c5e0498934011d36887d69ce116e347253399d06931a6ca900c7cc0899
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/c9/f3/4df974f2f902fdcec81087773f37eaedc7c8308291fb3f15da7ff21a5b88
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
