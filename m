Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AA7606D808
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cHgSQpkD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AF22404EC;
	Wed,  4 Nov 2026 17:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVF9LpOhH3ZZ; Wed,  4 Nov 2026 17:24:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7E8BD404E0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793813093;
	b=UZUjlE89HxwqtyQ9itmkt8RLjpkbylHXpYGWELsSS9mTmMNSeLc9QSeOL0HhSRB9cHG6
	 V8GXLVXBvLA6ECc7XE5xAM7Vkod4iw3A4n49QpwGs3Ok1QRATDHyZRAoTpaHLWPQ7/SGe
	 SFyB1oMMXX0vXYF0SXEkMExYz8xoFF95PMT37uVNa2HAjE/ipS8TsyutwdfTDZsCXr+Fh
	 hLxlw9hPEfwWF2m8BON8zx2MJzxJEaQRVvxAVZPymNo2vBUdmMNHAFd86mseeAoJesMpq
	 ra8oWzowbTRh6m7gi+XooS1ovZnZbdReNu8y5NyQLRriL1t/T3PHJV30LSTossBM2BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793813093;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=PRfJESn/lGpJDwWzU6n10OIpb/6gOk9gvC6YsRxDNSA=;
	b=jRsy0j61UUn87uuRtZG1P4di8HCJKPosYPejIYyP64TChO6DLm3jEKSwpAjZ5L+CD65Z
	 arv7dcr+XrCfG1kp3MiLzwaz/4w8LfSKXjHemUa656r1tUcg7cf/X3iWu9uG8Yiq9gNVm
	 DLMesMSkCfOHcvWMaYeTEIgogVNNYZky50cjV1Xh6cr38N4a1h/24bIzHSMQQpG3MdYmg
	 eiPLpLkIpgfHRKjG+Sq16AP2TieMh4TUxiTXVohVBY0lGEc9tAKxmyhRAkoOyBzNedFYI
	 Wf4OZEsuUdgD/hwCVXja1xNV+wy26bbQWx3be6pDwueMMrtMV1kBNp9e2LaOVSTwMPQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793813093;
	bh=PRfJESn/lGpJDwWzU6n10OIpb/6gOk9gvC6YsRxDNSA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cHgSQpkD3IaJcY+XCzGrwvombWR7dazjqB98pB2b2sN+CoZYR4cv8Dnd3+Uo0yhtO
	 O8qysxt/DeuevC1VL/spD4vRPjmVNMuy5pvmCz7bZA14O2ej1qjvkN+RBc1XfONQjg
	 YfQ90mQf6QlGZ8xiGG6InHu1AlRhvH3ID9VWDP+8GE4uyqWqEKBRa0GpKAK5enf2iq
	 QD+eXxQAfB4JaNBtdjZroLJhnL4+YMP9ZkKsPnw23IafNEVBLL+rgFbyCg+XrDIYS6
	 ydnFwMhw7KxqWTV1GMVGaHcw/49Oc6M8iqouK8BDMBlL4W2rA+anLIyG4RbbtqpYF+
	 w50UWhymRs97w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E8BD404E0;
	Wed,  4 Nov 2026 17:24:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BD6CEF8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68D2E605F7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AghU8M84k2rL for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:24:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD75460642
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD75460642
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:24:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC7619DCF7; Wed,  4 Nov 2026 17:23:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 18:24:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa696984dee031f5d0d3286ba4dea2f2d2108259
X-Git-Newrev: 1ceb80c538d2ad047fcbda32642612f4df3bcb27
X-Patchwork-Hint: ignore
Message-Id: <20261104172320.DC7619DCF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mozilla-ca: security bump to
 version 20261020
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
Content-Type: multipart/mixed; boundary="===============8328851166602101354=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8328851166602101354==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ceb80c538d2ad047fcbda32642612f4df3bcb27
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 20261020 denylists the emSign ECC Root CA - G3 root, to which
the compromised eMudhra intermediate CAs chain ([1], [2]).

Changes:
https://metacpan.org/release/LWP/Mozilla-CA-20261020/changes

[1]: https://emudhra.we-have-a-problem.com/
[2]: https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index 9e0b6ff142..b5a5b570bc 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  c1afba5f4fef71dfe7b6328ddd3c26d3  Mozilla-CA-20260813.tar.gz
-sha256  81f0bd9665eacbb6feef13b0fa16fbb30162c09292542b1206434e569196dd9b  Mozilla-CA-20260813.tar.gz
+md5  c6270de86fe89ea7d1b26b43bad8c5f6  Mozilla-CA-20261020.tar.gz
+sha256  1aeed97a463389e582e085e82de03ae0bffae74d46cf8ee4c511341e5508c21d  Mozilla-CA-20261020.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index a8cfdd66c6..402339d18f 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20260813
+PERL_MOZILLA_CA_VERSION = 20261020
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
 PERL_MOZILLA_CA_LICENSE = MPL-2.0

--===============8328851166602101354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8328851166602101354==--
