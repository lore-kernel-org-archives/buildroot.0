Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11F9CA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D36F60DA8;
	Thu,  1 Oct 2026 14:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLmSa-Q7RP8Y; Thu,  1 Oct 2026 14:23:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5927560D9F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864591;
	b=C7i03bCuDVeDvKFUVONsjwrYXC44a7YxwiEmw9lgk/9kUytttFi/YZa39Qa8smhljeQ/
	 Mk4iOqjyPjxzKJmITF1XduH6n/yNsHRpf/IH8OZMbebH9NZPS5xDoPpJo2WQF9sg2Hxh7
	 YQGjZjJiYZqJ7CHkYSAN1LVXn1dPiVCBvD2B+5Xjs6BO+uaPmyV9UZf1n6gwGZOOH5CBW
	 JRUKit9OLghDtYgUyj3JWhb6iMDqjbPEKsHvKr9VDl/28Hf9OG74holszkN2g5qIPF0qn
	 cqzQjKn3IIz5v9g+5RwCrWjDzlqiM1gAl4G0SJAUJdNS3z3aMJjVOJC0o1kQRPk565A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864591;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=v1trbwtErCApDb6QdPTlsiIkZzpu4pEoTr2nYazbahw=;
	b=rLUfqLpkaHPfKceFlLQn6RCuUas/mXr4XZo8/WvdXpnjInQ6HdEPQtCBMHkf8uopqPc0
	 URWqtWZno+v1OaikBRonido7qB3zPxsLssHpfYZKhBGSdgT0ltYrhd8HQgaZEVhPm3mIa
	 a660yI3UoR88wiZayTYAxau/Z+ae6nSwHKjnwBRSMw3hScfwd9J2KOGHr17ZAqGSvhXMM
	 sRI81OBdT6cCbD0wtAOuI5Np0DRpGw9aeZFBV0zIREIPik6H4low/spKFKflDFAMch32k
	 At1bAi++Ct1xiU1rTKVvo37jZFW0FVsZ0aV0At1xfzjMrbujz3TOkEXFO0Kr8Gt72nA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864591;
	bh=v1trbwtErCApDb6QdPTlsiIkZzpu4pEoTr2nYazbahw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ktpVDvKhTckq9gKhLmBQf08eciTu/cc7IqrfTijHme20+QTMdBACXv7vvA7EN6sGQ
	 Z9Xu/xAvog/u3yxp1ZYn9MCTKLQQgbcUjLgRQrXFOYbO1eObINvuhhzDUNH8mMbm7f
	 9Bdy5rqOkJ/a9xNjfPyEbG3M1hhd7rxTXmPPo0uwWVUP4pJnc1XQl4bIyctnpKIop+
	 VaJVii+B87XrYG26x/SgJqPF1v97tKrynpibcRZYrPqN6RUFmfTnf+x5yHMJ6K5wCV
	 h+7oqSOae/BG5VSqmO26szlW9R6sfRt4+MjvjwmAZNZyeVwW8ZeKMNOLKdGYjNrUj9
	 PM6U7FGf2piDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5927560D9F;
	Thu,  1 Oct 2026 14:23:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C651263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DF4780DF4
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBazztM0l9UY for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6053380EE4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864561;
 b=RcCu+YK8Wa0/o4dZcb6Yfdz8qBynLLkHPJfBpiolczM61neMlp1TVkWP6YQVc3vqaxZH
 msk4JhZp6l1f272qncQTWKt+2fEV+QdukpuUOF7HjrZc13gp3etlV1IONewnz9mFUsu7q
 64dDPtQmH5kpPkOYzjyy6aeudPx1v1//0WGK17YTOFCIYvpNxk3Yq3ydHBsnzaY5MYEl+
 kSFDHWKBOJZPjgN16Cs5iyRGUGyZ86S15lXk6DnIsObFKWYQochc5lm+58PHarhKtd3IX
 YSiOpG5h8MO4d1rU88VXH8l5+WjSICVFYTteOAXwCgLmgm41tQy3qT+uOC2IRSgA3Tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864561;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=88h29DU2zZcnpW2RO9oQmoYKRU/Rb59ej66qvaX+ado=;
 b=HDP+9DNSyka82+dNykqwB70tl5m83AhyKaNeAYxvo5ILepkoneHL7bnyrG+m1UIE13RU
 WPbCI5Op1jsTW/wn8u3qgKkdcTIf7MmHXVlD3/GsR1DI3O155vFlwX3poi1MXY9knGpZc
 XTloYBeBWhySVhU5TCFnTzY0iUl7kNzoabVTsQEwKR3bhI+93UNADCAJvhP+nKhMiCjoU
 7cV4eANt75+VtAQtOr/2Rno+RvxK4aotvj0VB6H7ZJLyAxgk7p0dEtaPytVq98wB06bl8
 RFJIF1xMBgLTnp3edjHnZrb9QUp3vcAgSFL5AqOj5Cn+Jc7ji/BIFoLbkkhWa2RqoJA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6053380EE4
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8C3795B8E; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Oct 2026 12:13:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cc894f92f24d3ae714ae209e779da158ed5da5b5
X-Git-Newrev: 393f0196a3d356dad8e736e7db09cf066fb044e9
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.A8C3795B8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libopenssl:
 security bump to 3.5.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1466106004744088055=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1466106004744088055==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/393f0196a3d356dad8e736e7db09cf066fb044e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

OpenSSL 3.5.9 is a security patch release. The most severe CVE fixed
in this release is High.

This release incorporates the following bug fixes and mitigations:

    Fixed DTLS retransmissions of handshake messages from a stale buffer offset.
    (CVE-2026-84782)

    Fixed excessive memory allocation in relative CRLDP processing.
    (CVE-2026-35189)

    Fixed QUIC unvalidated amplification credit may be over-accounted.
    (CVE-2026-35191)

    Fixed potential CPU DoS via O(n^2) fragment reassembly in QUIC.
    (CVE-2026-42772)

    Fixed a timing side-channel in scalar multiplication for mon-NIST EC curves.
    (CVE-2026-54872)

    Fixed QUIC STREAM fragment metadata DoS.
    (CVE-2026-54873)

    Fixed non-constant-time SM2 scalar multiplication on ARM64 and RISC-V.
    (CVE-2026-54875)

    Fixed out-of-bounds access after SSL_set_SSL_CTX() during a handshake.
    (CVE-2026-72897)

    Fixed QUIC connection-level flow control was not enforced for streams.
    (CVE-2026-75804)

    Fixed a NULL pointer dereference in CMP client revocation response handling.
    (CVE-2026-75805)

    Fixed an unauthenticated and undersized DTLS 1.2 AEAD record causing DoS.
    (CVE-2026-75806)

    Fixed a timing side-channel in SM2 signature generation.
    (CVE-2026-77696)

    Fixed an unbounded RETIRE_CONNECTION_ID backlog in QUIC stack
    implementation.
    (CVE-2026-84784)

    Fixed a bug where EVP_DecryptFinal() incorrectly reported a stale success
    on AES-SIV authentication failure.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 814b4eb0dc..3938a81e5e 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.8/openssl-3.5.8.tar.gz.sha256
-sha256  a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b9514464f5b2  openssl-3.5.8.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.9/openssl-3.5.9.tar.gz.sha256
+sha256  603f5602e2eef00d77fbd429d34dcd5822bb301757a1bc9cdb24c670f1eb859a  openssl-3.5.9.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 6620eee274..d16d024d89 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.8
+LIBOPENSSL_VERSION = 3.5.9
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0

--===============1466106004744088055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1466106004744088055==--
