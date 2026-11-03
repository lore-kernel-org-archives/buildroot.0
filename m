Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47157606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bEKgTDFK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1662081067;
	Fri,  6 Nov 2026 15:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faBn05la3Qp7; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9FCB580FAF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980709;
	b=DKITFtpMo/KIf0qFOsUXFNjJ99JChO1g5sfyNZSu8yi+zFhMvitnAMsOm41g7PAE1WOY
	 AbBSwL0VCqJcv4yKqX1W0OVfA/0oOQylcbkObPnkl1nhlsnGlLPKbH/ZGSqv7DVoSKTqd
	 KgBPoKvBBk1pEqlQ/IMZgP605I3Y0fWEDiRaGuz8ptjLx9dNg4ejVvXiZluEQtL2x55KN
	 9miTLv1Z2iQn1pCh0AsXGTBmDURSA9SGenXEHQenJIPmINrFEuMVhNGu7lHCmQ3oqvL0O
	 XHR83as1JCEYfqNytuy4RuwZ7imFp90GjHKOWk/Z/BqXTfE7HQrWe6ZUa5Me6PcZ6eQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NFXHRoaxc++a/etSisDepKTATiXUJDUc/mUk6UgPgXY=;
	b=mNy+KGaLJs4WXP3csLfzMFeBAE2EWGRvilfV2QRrPrbKKL+sRuxxew2NCvIoGzjCpEAW
	 ic95AGi9XDCuPtRwlUOcYdKGXiUWD9fq3M91PkCSrcZFEDQE8kI9vIufB6xcOT9W/3aum
	 TcC0rYqARs9N5GQVUd7HkAweIDxBGb0Ks4W6aZ42ZaQbOJFYI+h8zSCPxzn0Yq9rChZl2
	 6EtrXdcZS+Y9J+B/crHcZqi7Kw8U/YxCnrNsadf1OePT+Eez8gJUJ79XpanTOKlAyYvJA
	 xjVs3Z+u0/eJgoUM6y9uYexhbGLDJIxil8gWZIlYBfh1glvBloGd6P01xk5OFXYm0xQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980709;
	bh=NFXHRoaxc++a/etSisDepKTATiXUJDUc/mUk6UgPgXY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bEKgTDFKMqKzRm1yE44WmWc7ZoSycgC4Kk1sn7I7+VfTs6CPjJCkSbpa/keJeAetN
	 Fu7RMqrTkD6qSHu6n5p6QqkEP4EnzTvKLIEIJLZ7BDgFpHvRw0A3nqiH8zXYioJUW7
	 0E+6H2iPEZAmRB+pbn4My3BckdtZ5Z2Unn8WgU0fxrPW5GnhzWQs8TEvsFCnuIovSf
	 WDm7nvqmCauXACUUwJsJl/Gqm3x/nPg/6m7Juu27cinPnNhZKxpLIkceYZZHncI+Kb
	 DVJXFyZRXM55TefD3TGbq5CJ3RiZI0MgLqGFxNY7qP+A6Z3TwjjJ9YN2wBpwuSei1d
	 M7eTM1+9vnRig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FCB580FAF;
	Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B81D32A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50CC48102F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NJbH1rpDqAe for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C024C80F8D
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C024C80F8D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E89CD9E0A8; Fri,  6 Nov 2026 15:56:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Nov 2026 11:16:07 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1c562e762752f274d97cc868bd1a5404f1b0ebaa
X-Git-Newrev: 095fc2849af12a25994e5f92657c144ca72515c4
X-Patchwork-Hint: ignore
Message-Id: <20261106155654.E89CD9E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iperf3: security
 bump to version 3.19.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/095fc2849af12a25994e5f92657c144ca72515c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/esnet/iperf/releases/tag/3.19.1

Fixes the following security issues:
- An off-by-one heap overflow has been fixed in authentication.
  CVE-2025-54349, ESNET-SECADV-2025-0003)
  https://github.com/advisories/GHSA-8xx8-qrh3-q8mq

- An assert in authentication has been removed. (CVE-2025-54350,
  ESNET-SECADV-2025-0002)
  https://github.com/advisories/GHSA-r6x8-74x9-5mc9

- A buffer overflow in the --skip-rx-copy option for zerocopy
  has been fixed. (CVE-2025-54351, ESNET-SECADV-2025-0001)
  https://github.com/advisories/GHSA-xjwm-4pfw-49g2

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 96febd9c16082c0f09bfaa7ebb2d3848c5836e3e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 1ffb2c6c02..3d9ff0cf5d 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.19.tar.gz.sha256
-sha256  040161da1555ec7411a9d81191049830ef37717d429a94ee6cf0842618e0e29c  iperf-3.19.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.19.1.tar.gz.sha256
+sha256  dc63f89ec581ea99f8b558d8eb35109de06383010db5a1906c208a562ba0c270  iperf-3.19.1.tar.gz
 # Locally computed
 sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 69c4792f98..df6b32abc1 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.19
+IPERF3_VERSION = 3.19.1
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
