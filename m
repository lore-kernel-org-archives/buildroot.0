Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D460606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nPhFr2yP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39FA280F8D;
	Fri,  6 Nov 2026 15:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSXkQY_m5Hl3; Fri,  6 Nov 2026 15:58:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E5DE5811D0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980727;
	b=VHFd00bJDb7oFL5Al73tSeGOEcwW0gUFo/TgvzMll2PypDzZ8YlIgtQ8ApIia1LRvzjp
	 SWTS3WbpFByitRq8WFZDlD7hpmGU1tK5Czm9zgW1BdWMHM4IBHxr9YwFj4KMileHukChJ
	 n6Xb7gM12tXcN6Glg5NdWvTpQJfTGrNnrnmDTVYlYWhedKj9Q38jD7gZJqct/Pd6zVUCo
	 LJtoqv0Bf+ZZRY6fLoXpKEuhs+46QWgC3qSTHMl717t0ZUZP2qfPqz1Jgwo0GtM7zY2ET
	 BaOLEvTQpf0Bx6cGsCC8GRe//B/cpxojoYR20qTa6uub07AjMWgsiHdNjJM8eurzZSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980727;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7MRhLw8dw7nWFQGktH61GArjBidi5MCK/laPbQtTKGc=;
	b=ifOO+RiQsPAs1CQhprs73e2C6zw7epqVCg9v8+mfapJflyea8kVIwwe/5fNcQtRgOUMM
	 dlDq3HsI7iUd8eNAUBKcqiBcestc62zYkmFVpFEbD4LH+cv1b3odVEEGN5V22hMJBmVND
	 SdSIC0ZODR82REJwxjSn7+YmQiFWX6di99NFnmdJwTPJuPqiB80NZSAzgcA0P3OKJQ+U3
	 t9n+hzEHyvvKPHiQuECRLS7Lt2K8T6OjIXgm++h81P846xCMfGuBQ6eFs75YQD4kigyVE
	 GSD7t1+K7CoaAO7RDlFPoGvf/YXDQXVpzV47bF2rsC79TP24wGvpQ4bD6XJbhlk3H/g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980727;
	bh=7MRhLw8dw7nWFQGktH61GArjBidi5MCK/laPbQtTKGc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nPhFr2yPpAf43IbqvILgjnu+JsKZ+xLrwvTGSq48MJVtUhBZ5vsyDB14t4hmm8vdo
	 WJlrPAN5lQAf68Ocr2Xt7zp2SIc3p1ssM1XHSeCpbkL5jaCvvi5B4ZbCnaqmXG4Ebj
	 3Nhou+CYAJryRJxN+UoLfXXcdxhL7QoQcycUFERj6OIQ549F5SHNvo78/AXQGAK3JC
	 wr+NjalYF+KtSLrTwencaBaITWFLuK3ulL+0Olth4sbvlUsS81DTYPIeU5faYnrth4
	 s5RGmUou5V3emjdNW96Io+KRBa912nL5VfZz4jEiU5Z73fcY5859L0jj++h8z+Q5n0
	 +g8ETzqpInaeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5DE5811D0;
	Fri,  6 Nov 2026 15:58:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BCFAAFC6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2825403DF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a56QE5raIOJ8 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 38102403D5
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38102403D5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FD119E09B; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 10:31:34 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c97b40377f135288efb1068792dcd6f17ed2609f
X-Git-Newrev: ceb557bb180db934a51132d860aa28bd19064bd4
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.6FD119E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/suricata: fix
 build
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
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ceb557bb180db934a51132d860aa28bd19064bd4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit a3374e49baa45679997c37a25accaf1574132c4a in 2026.05-rc1
bumped the package from 6.0.20 to 8.0.4.

Upstream included in version 8.0.1 a commit adding rustdoc as build
dependency "required for the tests":
https://github.com/OISF/suricata/commit/6d74656befe20cd939de8a97bfe272efa112c90b

This causes an error during configure in buildroot:

  checking for rustdoc... no
  configure: error: rustdoc required

To fix we problem we add RUSTDOC=true to _CONV_ENV.

Fixes:
https://autobuild.buildroot.net/results/489/48984ab369d01fae9b53b7b1f51e874bada0619f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit a0b3c2f84e1e048cfe11243645b4df7dc73bc41d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/suricata/suricata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 0ee3752a21..56bbc0c89b 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -30,6 +30,7 @@ SURICATA_DEPENDENCIES = \
 SURICATA_CONF_ENV = \
 	ac_cv_path_HAVE_SPHINXBUILD=no \
 	CARGO_HOME=$(BR_CARGO_HOME) \
+	RUSTDOC=true \
 	RUST_TARGET=$(RUSTC_TARGET_NAME)
 
 SURICATA_MAKE_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
