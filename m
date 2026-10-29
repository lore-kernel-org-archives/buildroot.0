Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F383606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qU/R+hEw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D80E81429;
	Fri, 30 Oct 2026 14:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UQSz3KcEsT9; Fri, 30 Oct 2026 14:08:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7148A8144C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369298;
	b=IT4SnOmyaiVLHyrn2fcHNYkAmKBKM1ATwapFafAddu4Oo1+IhIHXRj/w6GEv+U5VxQ3R
	 PyvvteH9ejoNPD+Ii/VXY+a6FPnRnsUQLIDF6+lOw34eX5NrJ4SYKRjHO/BAAHniA/f8q
	 U2/tV5WL+XsFpA47eA+/SJJLflh7PcoHNsJR2tmzTeDn7s4aJpGOdeGBAuf7+IevO5xLD
	 sbboP06METxFCNJSH0yTeKmBNGBfg6aIuQWuDc5r2sYTC+XiHXOlDzi0VLwBu9L1/uj3b
	 pf3XOmjj9FqqFFCGrnWXCo5Y57DMGDiCSkFAHrGh+RKlXDh1ds1euxRYK/x8E6rtNyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=SX15BehnSVV5ws4YYfLtWG7WObKO7shpY/vUVlE6EyA=;
	b=pqWr5k1D430QaTZ1A7dRfpQFSm1RIXlXn60FxahlC3psXivsgCXE7kzKqQHBieczJc2q
	 nSCqCv+cbouiWIOir467uHhC/Sp8Ld543VhVBFcVd/nKRkzOdf4nvSwUKL5Fn6FiUqRiv
	 gtUo04gbc7xQsc6UhDpnGesB4b3WB2TT2CqYzJ9pRpAQuyZdajTkj4LIt6bgwrTgQynUW
	 ja8AuaMw9Hkm2UjFgO+RHyFrnq9DwVNdXsacc1TaC0D4LW32+zHG3WZQrZVA5LMBhafUC
	 EO/8SVJhAeiaaDqQbV9Geb163kdjGJ3Dgn+N5ljatWNhK/7HzMUjQ45yVnonc7ZNZqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369298;
	bh=SX15BehnSVV5ws4YYfLtWG7WObKO7shpY/vUVlE6EyA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qU/R+hEwRcABJI7dBx3XI+CRDwQxhDFX0ZiFQrYGRL8CWcVyVYh6JSOzqMK6SEBVX
	 pVWTi5uaL26IHOlfEQUFVYRY4fFpkB2xWIOpgTwm8UetVTPs9+IQ7Fc4Mgy718jTcY
	 4nTbYM2yzUIv7a4dgzQYExZuUbScff2jVn98cDbl6kupxY58Onf/Dv8/D0s3r8eSGv
	 tS9zTe6TK7XSnww0l8fwaeOcYPNZEfVCdFa/GDDm8jBmH3ZgLwvxTsgHoyJQAon3r2
	 qrZSODQ12tRcxJewfcEuMarhu+AVH2DJfJNglcVK6G5A4pjAb+IAOg9gbY3Euxmr7V
	 5kjOjwE4mkl+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7148A8144C;
	Fri, 30 Oct 2026 14:08:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4167DD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22E8B81185
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yaH8XMrG-FM for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 480AD8116F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369168;
 b=S7crZyPLlWHkP0UDezhKnhcGltfJwJ0QH5UA8TuRohTe3+GnL/f1V218mbg/a2pcwcX9
 3jYr/J188B2ptaB/9m8LoawtbSTuFPPwtlN8gjRzue9ogKL5iYclKg3OQsidcfPbaKgKM
 KJ7YXfSUsSTshM0OCmkV1OCXdRgT2l+CX7rS9UpPbFPj8kQtXC93f2m1W2zsrlr3nZpxs
 jcGR7CWyMRicBsA8xdzAY0fleQxSLJ2Y1sXaDmBkNLxhOJG3xnJO6EzbivEbo3xLhwWCZ
 kYY5yGI42AClvw4eP1WVOVWPofhlBEl68MkajTNXJYihhEtOKFPwqIzxGx/R8HGVdsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369168;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Tmah1nmPz7vbh3w+u0CaaTRW6To7s2+Q5dDts+wdJaA=;
 b=TwWWqYUs2pfjiL68bDBnxa8sUzE6Kq0rTGFQW6vDJQnB+Rfp9DoAk7xcdzJz1KGhVyRn
 PKb9cqQa9mh6Y6HksnVqndDq0r9mwRLv8riAmSETr97NhvWNaqu72kdYCCaVK0cAk2vaX
 l7wO4dBlQN8iA8HzwbaWlMuO6WF9qY8xFlkR/iuQa9ooNMf8cTKoXj3n7V3imJccifMaU
 oeMorEI1QWCcMgj67u+w9ROepRH7PztjVcum6BTCeqZsTDVGxyU4kd6s+4eD6hrr7L3tE
 qbIF5qbCUE6PWPgh3LmrSJ9g0Fpn/Q79lclWqdK3D5xrjjfbvBl3ZuXJPT3bsiTFQ5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 480AD8116F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 679169D389; Fri, 30 Oct 2026 14:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b637e48eb0f7d53479f8eebe05d47f883b76a321
X-Git-Newrev: 444dab5b7a93efb4e1d978ea9060e3d405ddccbd
X-Patchwork-Hint: ignore
Message-Id: <20261030140440.679169D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/c-ares: security
 bump to 1.34.9
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
Content-Type: multipart/mixed; boundary="===============2360438349242921702=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2360438349242921702==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/444dab5b7a93efb4e1d978ea9060e3d405ddccbd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This align with the version of python-pycares bumped in [1].

See the release notes:

- https://github.com/c-ares/c-ares/releases#release-v1.34.9
- https://github.com/c-ares/c-ares/releases#release-v1.34.8
- https://github.com/c-ares/c-ares/releases#release-v1.34.7

This fixes the following vulnerabilities:

- CVE-2026-33630 - GHSA-6wfj-rwm7-3542: Use-after-free / double-free in
  c-ares' query-completion handling, remotely triggerable via
  ares_getaddrinfo() over TCP.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-6wfj-rwm7-3542

- GHSA-pjmc-gx33-gc76: CPU-exhaustion denial of service via unbounded
  DNS name compression pointer chains.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-pjmc-gx33-gc76

- GHSA-jv8r-gqr9-68wj: Memory-amplification denial of service via
  unvalidated DNS header record counts. Please see
  https://github.com/c-ares/c-ares/security/advisories/GHSA-jv8r-gqr9-68wj

- GHSA-wpr3-8q3r-4q8c: Memory corruption when an application cancels its
  lookups after a connection failure.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-wpr3-8q3r-4q8c

- GHSA-fqh5-3x7m-wp44: A DNS reply that arrived from a different server
  than the one queried could be accepted.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-fqh5-3x7m-wp44

- GHSA-97vq-4mxv-7vhm: Use-after-free of a lookup after shutting down a
  failed connection.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-97vq-4mxv-7vhm

- GHSA-rf6g-ww74-97qh: Use-after-free when an application cancels
  lookups from a callback, or shuts a channel down.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-rf6g-ww74-97qh

- GHSA-mw23-pfg6-2x9r: Use-after-free of a connection after the
  socket-state callback returns.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-mw23-pfg6-2x9r

- GHSA-v33j-65h4-4ch8: Use-after-free when an application cancels
  lookups from a server-state callback.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-v33j-65h4-4ch8

- GHSA-pj7p-v3cw-hq66: Use-after-free of a server record when an
  application changes its DNS servers from a callback.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-pj7p-v3cw-hq66

- GHSA-grv7-fq5q-9vfc: Use-after-free of a cached DNS answer while the
  application is still reading it.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-grv7-fq5q-9vfc

- GHSA-ph6c-3cvx-mq6v: Buffer overflow when ares_dup() or
  ares_save_options() runs while another thread changes the servers.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-ph6c-3cvx-mq6v

- GHSA-cfcv-8v2j-qj6r: Uninitialized memory returned for a numeric IPv6
  name with a prefix length.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-cfcv-8v2j-qj6r

- GHSA-wrgc-prmw-27xh: The query cache could return an answer obtained
  using different EDNS options.
  https://github.com/c-ares/c-ares/security/advisories/GHSA-wrgc-prmw-27xh

[1] 728ea9f901 package/python-pycares: bump to version 5.2.1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 304f0c7a4e4ae791081f83a12aa54ba6e5620e39)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 7bf4163e55..8459c18393 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5  c-ares-1.34.6.tar.gz
+sha256  9364b70a12eb59a06830fb488d9357f90100dff0d98b23ea3593a183d43e6f2f  c-ares-1.34.9.tar.gz
 
 # Hash for license file
 sha256  460f5e768fda3752ca2169a95df062578a10fb126bfd65f3b9b1a1bed2f84807  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 1653b16c28..b977c3a122 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.34.6
+C_ARES_VERSION = 1.34.9
 C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v$(C_ARES_VERSION)
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom

--===============2360438349242921702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2360438349242921702==--
