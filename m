Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C9A606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SyCfJlLM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A94640704;
	Wed, 28 Oct 2026 17:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YjrUkyoQP3q; Wed, 28 Oct 2026 17:20:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1FF8240689
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793208009;
	b=Cc+gLgxqDItPLVwANQLtvIvTxZje8EtC6tSZJDsZ9hAAZth9oULRJDh9IGNZICCW6Ypg
	 M29EeGKZI0rvjfyFE2tQNnTl8UGjx45mVh3utgC83r23FJWCKkIghJRrCtP3MTddMDVBj
	 ZcfXo5zwUZGKg3ew67H2+REYA8tFREwrLaKr1HelbiSaCmSDMdJ21i+Tsvaod8S51DXk1
	 v1nEjwxT5S3M9OS+dR5VrCLkhSc5Mzt2OYw+2E4v+lUX/Hfi+Z4qu9jdgWC5JyOZ0tdnh
	 lSli6e0jDnmOZrUahOAqhc6ALHYEZYYU7Nj0wjJOET9Hz2sVDtNa/hMw92/8BPleyEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793208009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FZMe4H8Nyi2Uy4lmFHmh0WRrjyxRE/wlUvBP8O4bUPk=;
	b=PNfsDqqHrdsUpRiPiVL69Dv09ep0UIfnEZ+jhkZLvPzNCcePA6tmneMSSSJmdnZonJS8
	 AqfvI3nrCD3IitIiNNa7+YGe5ttTvExGidUq4Fv4CaXN6MRwV4yrSNR5l9z7yBuZG6OMF
	 BKHK4ng70tzYmvxeb9XKH9DViPV9tir2dbolnybEpBAWIZJ5TypCjiFc5k1zcSKrvc+5k
	 CLoeWOIQSPdF5Ko+r2JwpupwhtJGF3+46Pd7k6ch4WWXTjcUnVS6TF1uPIwbpfDBQbiSa
	 ouErELlC00qNwxfeCy9gj3WlEOFPCkatL8k07hNeSAYvPyzKxlOifsWQuBPOX6rP2sQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793208009;
	bh=FZMe4H8Nyi2Uy4lmFHmh0WRrjyxRE/wlUvBP8O4bUPk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SyCfJlLMiHP85faIc2LnC7W5au2BZmyGhJxJjj/UxdUP/YtOD5eP3mpmq1G/9rN1r
	 paQEVNgFZX0euUaiEiRMwn80Do39gDP/uzV4FgT2ncQjXYu0SiEvFkSRq/PBm6vEH/
	 tdYPJ/7fw2V+JiItuuC+lly9GgSklWx87ooPis6He7vC7cPYUHk3MMTF0H0B97NjzV
	 5JtT4tCaBQCo5O86Jx0VS6M+yaXwra/9z4yZyW9ZOFjag5MAcPHQuH/06SgYjl5+Vn
	 hcoS2XSn7xVi4wETMcij918v/FbrzoC9km2DQKCcClIMYAGPuKZgdfvqZq7Sx1tnFW
	 GzthitHvaJy3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FF8240689;
	Wed, 28 Oct 2026 17:20:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA40EA32
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0C85810AA
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lT1k4DokL0y8 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 02843810A1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793208005;
 b=bzzreTC/L/llpRy1TQ3RDw4LWB9PhYLaEaVjeu6enXg97f2b4TkDjpJN05xVfwfE9VwY
 iT87drlEeFi3IrOz7J15gPOjiOoBdDqER23XDZtBYv5n/oXPWuFUOIwbnJM2Ngx5KZFjm
 xfYHpLrYG2s1gczgIhEeSaTDGV+JxrrxGEWL6YCtUNnN/NR8DvQ5alNgcg072l4mSNVVr
 lYSwQbfq8g6NspFsVeY8W0C9TojKSM1T3GSs0mosl5Nj+xkTae1qMl7O0QyFQg5qpUji2
 9QfOH9US+C4VjskmMh6wMzhnGgBrFA9yKFm/XkM0gXnRQ8I+UY/wYpBiwynjVtNQpRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793208005;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mVTnJ1dI/Kw5/Of/bs8ihPAhW6KljNGdc/Jyl7SxsWs=;
 b=oQbpP4FRmIViX5ghQvPyoh53Z63mW+WUkVsc8QeHs7QhnBv3nqzDrAFOgqsiAU1YD2rI
 1Bh6sG2u388tMNJhDP6M47i5zvnBLPqGw2Q2LSD0Fo127wUSp679SsXXGHg92Gh07SnJR
 rzYKKohJou2PdaRg8XT3ee6HesPGSxkzzR2P6IfezCBF+jkMg0Q0RPn8TZ4jSpsuG+Drh
 jfuQcG78Ip3w9Dyhn7BK8uQ/2DslTaRAtqoAFjhHV2cvbYvEpGPAsBU3PjwMzA04WvGYw
 1Cuss7v7UbY5TpR1TA4hq4OhZ2OfQ04G7nBCrSohuqhQCuytXhUsv0aIiFI7Jmksv9A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02843810A1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 17:20:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0763B9D216; Wed, 28 Oct 2026 17:18:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 18:19:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 210e86765e62428633862d74e6daf7447f31eb45
X-Git-Newrev: 7a2bb487b217f64a2d1c973b4922107ce3e5d6bc
X-Patchwork-Hint: ignore
Message-Id: <20261028171838.0763B9D216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tss: enable host build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a2bb487b217f64a2d1c973b4922107ce3e5d6bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building host systemd with tpm2=enabled (to build systemd-measure)
requires tpm2-tss.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-tss/tpm2-tss.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index b9653ad33f..9bb3b9d677 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -50,4 +50,20 @@ define TPM2_TSS_USERS
 	tss -1 tss -1 * - - - tss user for tpm2
 endef
 
+HOST_TPM2_TSS_DEPENDENCIES = host-openssl host-pkgconf
+HOST_TPM2_TSS_CONF_OPTS = \
+	ac_cv_prog_result_groupadd=yes \
+	ac_cv_prog_result_setfacl=yes \
+	ac_cv_prog_systemd_sysusers=no \
+	ac_cv_prog_systemd_tmpfiles=no \
+	ac_cv_prog_useradd=yes \
+	ac_cv_prog_groupadd=yes \
+	--disable-defaultflags \
+	--disable-doxygen-doc \
+	--disable-fapi \
+	--disable-policy \
+	--with-crypto=ossl
+HOST_TPM2_TSS_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=c99"
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
