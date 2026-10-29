Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B56606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cMU9bmQR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C27C810E3;
	Fri, 30 Oct 2026 14:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDTSYBlXCNYT; Fri, 30 Oct 2026 14:18:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B1EDF80F0E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369915;
	b=aKI3ioCgCSaFZiY2BvJjSgU1IHLgegotrQB+ObWDBbxFFzRYNW1PoKgzO2K5O0IZ7LaN
	 jDvSutaTGxjRFT2L1NRBQZg99Un/rBCOF3BqNdSseBwb1sN9fohT0OcqpWJX8QgyeaaPr
	 8dK5DKAzyf5Ou5/zGR8VTVBxQeVs1H7x+j6Ddev3UzHbRKx32MpbU4lPS6ZA/pEVltusX
	 7bsgNOt17f61rLsEiCpixvdX0bBefzFS2iBpRz6VS/6giI1XtSezDYiptqJ5YV65a24uZ
	 pMnL7pHD4dcaQ4z7TDW9h/Ajfqh5+qQSB6pWZrn2ie5sDPuL/LvEkeCIX1La76mrLdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=mrauX0WQ868a2h4KPrVhmm6dvX8cJ5yeeWvBkISOg44=;
	b=LwpzjYHGfP2DiAQuA26BeZQX8Mrj1qjz8vwYKKgrUi/dHnX6RgIn9rKw0Fo7HX9OIIAg
	 Sk20fXSQhObKbtWl0K7rzuAj/ftlPzVry3VOzQXXwec7y46J7zqTZ31u0WXMjE653i07J
	 YDsKqWTYN7BtKeXIBMjYu6/vCV/3rT3niDlzQe7YkvdQZP4BGR1UceD1zFzug9gw91rrH
	 9JiEUNbDJsffGK9k49psR4MnHDZdfamKGZrTl6L5aK0akY/pLVNO8LP0RnJs8Gd4geJb4
	 ziRYVy9xwDJ7zsxcJ/om9uSFI8jBmKa33aLL8SZq7AF3SltPuXW52Ln31xKusZ2TGlg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369915;
	bh=mrauX0WQ868a2h4KPrVhmm6dvX8cJ5yeeWvBkISOg44=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cMU9bmQRArEue5wFABRbbrnN608x3lAaoT6YZBoxlfQgGGW7FocSvMFzgGveeWVq9
	 1qw9WA1NQH1vkQ4k7HzkHe3DZh03xzj9EKmFz754UFnj8DtuJg5ShUVzVLhtPTmxjh
	 lJKPEtJJxdA/rOmkW5OP20S4YacJwt3iMREWypB1xmZClSrF2VIzj8baSHfLQj0oM9
	 YyuT7mOZW9OZW3ZvDxEx1bcXH6KVBoegBrOINvC4V6UUrGJJEMGYWO864sFV6Ck1sH
	 qmRJXda9YHfw5FEJLvfT5PUKWGpcP1L1sGIjE4gXigY2IiSmMlwI6pBYSUIQY80mRD
	 d3KNBR/eZYQeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1EDF80F0E;
	Fri, 30 Oct 2026 14:18:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7287DD46
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F4DE4052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d05T76YWj0OB for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C6C2F400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=pF5MhMd5ayDxBMoEIiodBJqRwcedlpNNKr+RoS7vsp+z9IQ2vFIStrdTqTfoG4ADb0Hx
 2rLwusLaD17MO+4IQquEaAsbCH9dwF8c039ZtUmQEyoPpMDe1U4HuFIplUMrqxQqdOceZ
 D31TtGVfBS5FK+LkFzJF2u1CLC+awuvaNn8avHw+Jt2Mz4bP20goBxatHUpO1lWJ1vKpA
 7juu1Srr7rijBqo7iov0s33pF7qMlgieCf3+4bYrMj5p7kQfOiq2t0e0igZhPtYQsE8Iq
 4oWEa3/MIRlAwySC6qjvV+ZvuPqxUdGMjWG8SFIg3DaqSyawHAKzJWz2Mzj2tW0TGyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1azuflDl0ySHJmAAT34sbDNTJg/EbxfjPEZ6B1aJnVU=;
 b=gUtFWVTvLJkI+/VgtHCXGFA8OKL+nN0N3QucKihspmbA4yE0moZAZ0FQERQTjNVYdXYm
 0s9TUQkvmzhOUAGaBIRTAfHoyfR/vE7lTLhlpUXHhYdXuFImy8EQboLg8hbwMS8H4/t//
 +1O8bR2sEVH72y5/Xgvo39jcg4CZIauNC7gbbgKkOLeSAOiCOblMK13gHRhTW+xXsml9Y
 AmqKPsiY55XvwyzKsOW15MN8Pj4Z+RnoiH3pTgeYSsDyf4npXe0Fe01MvDX5bpq6jtgNa
 ZiiGmJpZxX81P0qe18Nl0r9oZ4iRvd+Fucq9PjMCvEPn7cuh5IiegzL3qFtbl1Oe9/A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6C2F400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4A5A9D38A; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:05 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ee525a6ae43a0ad2f7a485f4417a9f47f235f9de
X-Git-Newrev: b6e74d2e8bf5de1c0663a3efd0d8db0f09e8f192
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.E4A5A9D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pkg-hare:
 refactor build command
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
Content-Type: multipart/mixed; boundary="===============0216328122645133441=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0216328122645133441==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6e74d2e8bf5de1c0663a3efd0d8db0f09e8f192
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

In order to avoid duplicating the build command, use an intermediate
"target" shell variable to store the make target to be invoked for the
build. This is in preparation to extending the build command.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 69cb418bc80276d602ae9e4fe5a30b10ee0a957d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pkg-hare.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
index 14e0cfce5a..15dc769311 100644
--- a/package/pkg-hare.mk
+++ b/package/pkg-hare.mk
@@ -49,10 +49,9 @@ ifndef $(2)_BUILD_CMDS
 # but in real world, the target "all" is not always the default one
 define $(2)_BUILD_CMDS
 	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
-		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" all; \
-	else \
-		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)"; \
-	fi
+		target=all ; \
+	fi ; \
+	$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" $${target}
 endef
 endif
 

--===============0216328122645133441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0216328122645133441==--
