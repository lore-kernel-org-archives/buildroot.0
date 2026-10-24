Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA384606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jNqLT317
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28075817E4;
	Sat, 24 Oct 2026 13:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXUPFNzm33TV; Sat, 24 Oct 2026 13:21:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C6773817A3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792848108;
	b=L6o1sajGBrPjI6OHmbupZPf6v0ExFL8lZWuN7Nmgx+JrrK/lbXas/3nba4mCg47a/ii/
	 DQePahYxmqVr/tkYkGynZDUbx7CkiDB+qerUMGYCLhRVx1rVj9qR30Rniw9zzC/XZvxdz
	 0yi9m+6Eq8+lUnIlw7cae2DmbxvjtL4epJlYBQSaEoBWRB57TytekyJ63htDR+mdpg0Ga
	 5QfWygaFl44kAg1lzZ/XyM94UmFqLZ+6IouPr8tmK2Jef3e6Urb2mN1LBOzXcOh6V9PPd
	 j8UDeen1pUZ00K+FQW/EElzk0kneGDZaqd0xnq4NLnHgFQ7e1gUQYSmdBvWu6iDVlDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792848108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HveMePohglD01k5h/0J/dWzzDQQuRl+nFxPHwOuvOx8=;
	b=IkgBvxz+w+6Ia92qigLkw16SqICmQCpeDa2c9fGkqdz+muCkVYIhHQpKwCBRMmnqOOPK
	 yQCG7LqfxFYkp5uObVwPTDggd52gEi4XJRRO7wJ4se50Z2jFzEEgpUaTSmTa9VVBs4HtZ
	 PKo8Zqx7Rv/t8wGVetxw1EtbVclLDGdKlU8nxjmJ1hYyMXDUeNoHsPeoUpnIns0tPKMiV
	 ISd8yLBqSXCgzLHntgr1RwAe4EfQ7z6fj//GyNl2BjjuHyTla+aofAp3CfXKYyfp5nfJp
	 onDi/uEtahvZUKKGvxzSZrJ3NM2qOzVKMdMFJl27sx/XpsgC0SkfFBhApEqlCrOM8XQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792848108;
	bh=HveMePohglD01k5h/0J/dWzzDQQuRl+nFxPHwOuvOx8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jNqLT317kFVjzKk713j6bCdw/pr0jl/MgfcCUDyrdd34mfvmkjWNr8rtvneF1qCNz
	 U45xIMAiZI3xsm+gG7KWIF9b3Q79dKqFMyL4r05eiU1SjpF9AqbEHJD6advLkn83AM
	 MZt7eeGOUCN0J8WCuLo+gpn3qAe41bN1FE6CegzOk0Sr+i+AfnYJoTSP/ZBwOMYX2y
	 DcI98p5Dolcbh1JrCmqGxuNnIei1GCnINhYTgMw9UVx4s5SETjk78p8G/2v+BmGT01
	 VppzuSZtzPitIFz71QgrzC7APAvMpwx7nf5Q2ufUnLCnrYUXRwmZFSVzORy27dr03C
	 1r+WrdozKE2aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6773817A3;
	Sat, 24 Oct 2026 13:21:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79F4B380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FABB60A59
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GegGqadTrdmG for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 13:21:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 82AF860A4B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792848104;
 b=YhaeVMH3gqkJqEEtPEeQsw3Xv7BeAvh64hu64KwKVbXdbEwwyLdbg1ZwVpPVbn3EBquZ
 eTYXZg4+RZrmj/UY7m44tI65/8p4xKSy7ideOF7fcTiplAROdfRr/bA3JFVmeyy4ShZTP
 /wHPmRMlyvcIyQP+627AI/ctlDzkdZggE7IPgiXaMgxRJYngVeYpMJbCAfRSiBVzU6w5e
 7gzX1F+CQCCKKrBr0dAVpGcUn4XHLvOS5GUF9uzk3EK6M2iH7qjyZJCRm94GueS901XKF
 m2fYGqOJGaV34Et4rS8xWg1pSnS1+EBuLut9gOkV/TqKZEAHS1/irFnc3mqSQtKAlDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792848104;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LX/M5sqKoZLie+z+19obzyDVHX3wg6oXIQxgYPup5JE=;
 b=VBed7c8OdVL4bxVBT4SLhLvjB0QvlFpbzPp+QDjJds/X6oJrLYVpTxUlBPVsBe6EC7ys
 22CHx3/OSN4uSdLMKAeBIx/BELDvXkOqsvua0xN3SD9JzxK/pZJJSveL4eZb+0JC40jrd
 EC44YlFzfNPsKlTngjNJPgivxPETKiLbR0Ivo16j8oOl2PUCmX1k460DbqNSuo+uAcH0Y
 GD4IY5OhDLpkqlRVmDbEwyrzmrJTgp8H/0QZeMTlyHzCALQRELGEp69/Esj5XguIx7M6c
 upnyyYn0Ao0WPYuaiyXeVNVfnIOrCOAbu50/pKlOAlhnxAXL71Jyvo97XsCDDJrZ66A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82AF860A4B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:21:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87E3A9C7BA; Sat, 24 Oct 2026 13:20:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 15:16:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b234f0a773f2c4e06f32a42d0920f83595ee9df0
X-Git-Newrev: 6251fe645541609bbbeb84f07a3b53f367186c22
X-Patchwork-Hint: ignore
Message-Id: <20261024132019.87E3A9C7BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-googleapis-common-protos:
 bump to version 1.76.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6251fe645541609bbbeb84f07a3b53f367186c22
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-googleapis-common-protos.hash                              | 4 ++--
 .../python-googleapis-common-protos.mk                                | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index aaf12f78e0..c21b8cd324 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  d1bdd06d44f08c8f3cfd5722ab5363a6  googleapis_common_protos-1.75.5.tar.gz
-sha256  c7a866fc34ed29a3b10af627a4b9b1dc2433313ca6e959f0ae4feb132047ed72  googleapis_common_protos-1.75.5.tar.gz
+md5  46939afd0ee1e69eadfb2c852dbb0e84  googleapis_common_protos-1.76.0.tar.gz
+sha256  71db0e44a1d4c2dd024ebad44ca67129cc1e2892e4861df466764749d5ef8642  googleapis_common_protos-1.76.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index e21c5df3ef..9bdc82a6d2 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.75.5
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.76.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/8d/2b/6ce81972d5c8cab9705fddce3153be63222d9e12fd96f8baba5038a744dd
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/62/b6/bc095b23a3e0d978e75c8c18cabe4c11f791837410670e4486f0d539bfba
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
