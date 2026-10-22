Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878F606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 20:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lsQ8Xsh0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D68F80809;
	Thu, 22 Oct 2026 20:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0gNy266PBBN; Thu, 22 Oct 2026 20:57:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3200B81266
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792702679;
	b=LygjKV0Qwm9ao24v2UCbxYavdBXMY7MzXuI3C6Ika8bR0aX0wWT4hWRl0yFfqP4YU9bG
	 mjUcoSiRaR67YMf73ydZIpkD3FEsYGX9Wt4msgdgTWqgBck9hzboTYjT0VyucKjYYDhWC
	 ReAcYSZoVnCcyiUGKqfMl6m4jmgmw63HuxVXXzOSQfxcbm4IreTsYzRQgTIR60D1rreus
	 eQJsQK2aS2IIU1cab3pPEZZ3nrrYgHAJhuw/DwRNSSWrHagca7zlERLeoUGSAK0zwd17u
	 FSLL2HLBbNcROyzrs5GAFl90egyeYXiMahbbduoPw0vuPGYnLdnlDaXZgmSA+MJuinA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792702679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EEYRDG4XjfVpHksle7nU5kFVbpVT817o5tC09tswgSI=;
	b=au2WEo/NskFIacpgKeKrjeQ3qAc+XWs2JkS2nm2+82xXiMeozhB4Tg7hROtx+Vg0RFUM
	 yKzICDLLfARqjnUSMgnbth6XEhitLYV/q702UJVSiNC9dWJTMX1kO9I3uBTjScvAredAd
	 2m8nGz9dOMXQ9H4cVULn2G0tsJ8a378X7csDA4qlSZEnEDKrxGhL1J9/1GFRri8W868oM
	 WbgiCoX/Uxb5Ukb9WO8TRD7SfehYZqpXHbDo3cQzkzxgu1+3w2WKAk6KmjfWUPjWRDHP+
	 Fsx3PKZKccGUHEZ5CFTQVW7ZJOUxGyPVC2d9II3dyKBL4dR+EDDqeIeN6MfOPDOExyA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792702679;
	bh=EEYRDG4XjfVpHksle7nU5kFVbpVT817o5tC09tswgSI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lsQ8Xsh0wH2MkVtDQgUTuw1SE7ige7psYEfn2nlxeFj9CE1+zb+1EmG0KwPotfLO8
	 GaQsxPWC8sqTbDp2sk/qtbYWYxr4SqH1oDpXuzhY8ab8HjKGR4D7RoS4HQN+ftbSIs
	 vUybdwx4TgBQNH40qTZ3ttPMy3L5hSK5QJnWJ5RhYxcLtxs/c+iXU36s7bcvMWsdCn
	 NtOTttNC6LdTsfdEiqnqp4kglakZlDT8g2LeMERaHDJZ3h2QhoFmluPj2sK29WLuj8
	 aaqr7QLs+H3bzk6TVXEDTGqn7wR8knoi1+F7PCGZGQLno+Q0X8S8wfecSq7q7qah6+
	 U1QSWHqwkzMwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3200B81266;
	Thu, 22 Oct 2026 20:57:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 984943A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 879D9607E7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-npc4R98_qT for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 20:57:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C898C6080C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792702676;
 b=DBayXm9uZ1ujjQk9FNIUhtQXdnnALzCumMDhO/Jr90SiNu2sm4Y241W5JuxDs9rPBxe5
 dF1rYAUl2zn99lKj01GUE0Yxr0WpQYhM+olLL2FKuPTwWMmgXehmEOK0YugzVLzsBhh4M
 QC7qWi0yd2eM69wL+MUuycHJO8mG+EfS9mIUcX1o6EB45M4bcXazAmbxNYgLt5tmmk39s
 gIHDZmzE9GjzWFbiW9yTOVTHp8DUtNgiaL2oT3fDZT87eVgqfvHf4VhYwVWPYtZG8F81p
 uUWxjFBpP/AYJYY6uSG2i/GdxONu5l3mOPQCn6AWxaZdG4/3Bweww+SvCK0M4dvBhbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792702676;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OShaJVNnG49fCl6bxs1gf1xzsTVHNvkF37fPonxntPk=;
 b=KrwxnyhMKxVu/Lo1IJQ+4SgthPAx8EivS5vqF1pI4ZPrAXywFp5PFKW0OWDEd0it2Tsf
 /DIT8Cljp7Po4TGYAGql9KNlsYAQtPaRRDeL3Pmh7DBqtcIt43rGyP2l+8xQMwT2z4M6Z
 JDxQi5tEE00N7cKxGo5quP6woou4XoBbjoTr70NDmowlWUjnpnq8Ddpqfb/oLg68Zi1xA
 nrDgS6pFz8BuDNT1qMhBVNcDYuRMQAW2NRrtKGs/7jVvqLBPbb4pvmdFoaySR9GCRUxwi
 1Yldz5zstBz5+dExgdQYM+gkKeM8r8gP+ZdZk10oS94djVagJxDQiMqKbOnhegh26hA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C898C6080C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:57:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A0669BA4F; Thu, 22 Oct 2026 20:56:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 22:57:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b5ba0216478d6a2e7762a567437c928d30271ab
X-Git-Newrev: 5676346fd77e3ce5e672e94732b2d098dda2da55
X-Patchwork-Hint: ignore
Message-Id: <20261022205632.9A0669BA4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-certifi: bump version to
 2026.10.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5676346fd77e3ce5e672e94732b2d098dda2da55
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/certifi/python-certifi/compare/2026.10.18...2026.10.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index c6e0206ea8..a583c17bae 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  915d53b5fceb004991800f62b552e0c0  certifi-2026.10.18.tar.gz
-sha256  b9995d97b64d0431a5af837d8ca8cd6238104d1f319f04bd93ea43124d6c861e  certifi-2026.10.18.tar.gz
+md5  f64fcaadfe9a0ced492ccbfe88bc4a27  certifi-2026.10.19.tar.gz
+sha256  035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae  certifi-2026.10.19.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 5430596350..bdfb8ed12a 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.10.18
+PYTHON_CERTIFI_VERSION = 2026.10.19
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/7e/eb/a2aa1ac3ea30dd3f30ca57f40232138b6b0040719316ecb85daf61167771
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a6/bd/1436c50cc46699de0230fbaacc1d1de7bfec413176099949e9d5112e88f2
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
