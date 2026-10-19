Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9B2606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qXx7TOlB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A7180E9C;
	Mon, 19 Oct 2026 21:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Brlbq91pYwXP; Mon, 19 Oct 2026 21:47:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 299BC80FB4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446433;
	b=svOLhIzrvz0O9nSRkHZ8p+PjI1A+C+vJle7mMCGhqmEkijki1KVm751YsF75qjjgUotT
	 CkVFt9MVtCwZDsKWtkMAEKSLSUz9Q2YP51acdKAbzV6D/+OSe9ks2VTAN47T/eyn5xOVb
	 GOlWxPspzNp6wZPJRk0KvPtP4iLgAgsA0rxI7hPSnSFakA9Lb8xCwGRe/csBAghVTVf2g
	 54LFRQtG/+cFqPuhLx/9jwjKficO9z07z7q8x7gInvBhK0MDsGWzyEqQYxs3M2XdXiFX2
	 XVncM58F+Rq1J/1VQLCjYcWmAyFYhD06ESUQcgJ05z1rW01xxD8WEvHtnouoVAtb1lw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446433;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FKBLaaIpFWd9/T7lu6ZWnmEIhMTet5gCUSouExEz+o0=;
	b=HwCuHOwsDP4udfpwgDmpE/PJPyhosRgG9WXwUt3SmGFIHAg0Qv+4KJg+yNT8K2MJMcfe
	 SS22zBnBCcRkmoKEofdi2aJSQcDipy+oY/i779ro0SzY9jskkXCzEXzymKqKtZiU5sT+f
	 RQE0cgWX6oLGau/2Xo4ADv5vIHZV+skWcOttWkKyWDPHQ3uG7v8PkEGCqH0uyjSk6oIYT
	 SaaT7UzV0Gqvd1/fzVR/FeZ4sJ+Dv589XNqekOKwOk+BcrAJP0rzwzPzLfnY172n/cFgx
	 ltv6wDM1sYZamvQOXLRuL+UeKB79Pt/5wxtFDCWyWqlyGgcAC76M55Fbmo6T82m3HCQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446433;
	bh=FKBLaaIpFWd9/T7lu6ZWnmEIhMTet5gCUSouExEz+o0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qXx7TOlB21v7sdPHMAW2CuQa7I3q7fHNTfM7KaxYPoWq+P8nQ/80LjbwU+Qtiu9XA
	 cYSjXAXmx05/W97+IeEftwWNy54xA6T774farmY9mGmI2sJVRT3w1Jg7OnfRVShJUY
	 0Hr+TtKNf2PSuAlasbSvZkplnM+8LiTWhxD/bEoZUxaWEtOvNcfa11KQfmKWhSABZ1
	 fGqSddenorBbtNw5aLSEl1Qoz97iAJaP/WFKL5xlSJUvtE3IjvUW791idLETfVvqD4
	 o0xzx5kY0LZiCdmgfVprRj72IVAMTniF46LzGRVcQWmFkXCEAmO8/lM8cn2PK0YYsF
	 30uQM1gmhuX2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 299BC80FB4;
	Mon, 19 Oct 2026 21:47:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2E5E11CA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF72F80F52
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XksozyGywrLD for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 491BE80F9E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446424;
 b=dte51AbvSRrcoL6pSjOLixrp2UCDTuJIbARcQMx/Ov0cBPfOBFET2VyR00BAXmnkNMV+
 jVSBPtGmG8sX0Itpka9y+wYzxQFIHWpS8Gh5S+8OUANldLZ0mcWSLLoK055a/g/vKDDv/
 hdx5S+T4MRqbzR8J15x/IaYIFpr27cpxNBE4s94ymUqD3K00y+Az3KrMrIj0S6s0C+1Vq
 MDi/BJ8fgTj02PWl4YedYU+84Ycuq/wrjefFl0zjyFV0sNRO1KfnWe16i3l4bd8NCtv9M
 EHtrYJXuZbt+oQE1iZI4RCGUXvRmYsjmCbr1dPVtlI6QYg1kShvddDXrR/JCmgadrdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446424;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2FVi4q665g3tj1hO/Mlltf7+AbrMview3vNlk9ZmDnw=;
 b=sUl1GOXshUh0CM93454hBH5Q/gyY81VOcHQdk7xE0s60tOMD3psnobNLRBQ2fbf/8V5H
 8BPSZ891eufRVN9w538AfZ8NFN+SDPrcx3YSEidFWGzQ84LJU3/VUVn6vTts1+V0neacB
 ks6adib2Sr2bPF1yo4AY8OfgQBo4iDFoIBfJK8e+0O7UUO5+iMzkl0a9WiIS/G1h74ddJ
 JKJIDdQ+Z/qjOEI3RcWNcrFxsIQfOoZWC4u9DM2rXYVot+ePl2xWVBKoYBAuTIkJmFk4P
 xqd01ipqpfUyBkWrKR5aQ/u3t6tKFHGpfhiOz1I63QITN/rvsicq+Kng5CMgvO/5fIQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 491BE80F9E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 854FC9964F; Mon, 19 Oct 2026 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:31:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9e468d6bb6556933fce7e9ac2dad35ed9fdc42f
X-Git-Newrev: b636e15bce8e3795c117d2dd57d43b25e2023733
X-Patchwork-Hint: ignore
Message-Id: <20261019214541.854FC9964F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_ttf: disable samples and man
 pages
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b636e15bce8e3795c117d2dd57d43b25e2023733
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-6-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl3_ttf/sdl3_ttf.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
index c37d6037be..04a5a9a098 100644
--- a/package/sdl3_ttf/sdl3_ttf.mk
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -14,7 +14,9 @@ SDL3_TTF_INSTALL_STAGING = YES
 SDL3_TTF_DEPENDENCIES = sdl3 freetype host-pkgconf
 
 SDL3_TTF_CONF_OPTS = \
-	-DSDLTTF_VENDORED=OFF
+	-DSDLTTF_VENDORED=OFF \
+	-DSDLTTF_SAMPLES=OFF \
+	-DSDLTTF_INSTALL_MAN=OFF
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 SDL3_TTF_DEPENDENCIES += harfbuzz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
