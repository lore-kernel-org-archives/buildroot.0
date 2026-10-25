Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44763606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JZHD5Cq4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7CB80D7A;
	Sun, 25 Oct 2026 20:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIF-6z8knFXB; Sun, 25 Oct 2026 20:24:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2ECD280CDE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792959891;
	b=dc/+MkYZu/2NxqAu6++iGItzmVYWBlfYuhJnZzh8/SB67Y3dr38K9TUah01JfQ+rZcJn
	 46IY7tbQZMNli/MuL2QVzehjaXk3GsQMYFMAdC3Vc0l0C7Wo/BEOBtTyX2fGD7yBIzrXq
	 oisColyNfmG7QCVH7OUJeE/yGl4tjB505vIdW52AxsNnfII8nJQdIwhVZl5VWTUiWwn+K
	 +35gtcH8pEnYsQYLlD2WUNUyphX4DmlBptghEOvJPNB451n1Qft50tFvpiaFUK+jlTwHR
	 T1CanDRQ5OE4rScCBjFte8qi38U3JF2f0mQKjmEGlLl/jk+ap0BOtv3+x70Dlsk8rQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792959891;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jfePQwUahxFjFlMu2vmBfv796rqoHx1u7FKAuW+Pd3I=;
	b=pKQ4++rkE9fF02vb8oDa5KVIg/00MJX6oarF5TsGMWN2m6CvtjckuVBjBTc8n62KLcVx
	 G3TRczG8m6Zp9S0UA0gmT7OVyAXOVleaLYtIA8HHEk7LqXX3qm7iJCnu0Vhn6hV4om178
	 VnTXpcDgv5kN3QsXo8cSLWeryqrOUOPnibRdw4fxJOp7s2h5layXRYkug6gkIYfXdzN+o
	 +TB+4MAL7pVSc1Fnkg4YWc/Yiepi/zNBOLKvDk4eSkEgrfb0VlOTIq3V1vm41TarUd+mn
	 HTsfJ+1w7Acnt25P8TjuHL4NV2mzODvDWSGeSqMp7366LQ8cI9+atD/LHc3A7w/2ZEA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792959891;
	bh=jfePQwUahxFjFlMu2vmBfv796rqoHx1u7FKAuW+Pd3I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JZHD5Cq4z/imvxpbk2x9oOtXCBuAG+CHDeLEpYvlnXqLhvgHfIE6a4ejleIXaUnYK
	 xXvQqbRCEj4rxdMo85CCjKF3qBLwRJubTN4H893GUOlDhe6e98kmhzsJH04Ltb3/r+
	 35Y1jRiT3GOdM188bnXpH2IlATFp8lZHfr1QRgdmKL9gqlO8QqW/c8VUjJjJJaUZjQ
	 Xrac7mRf9+fl1O1sc66Uqn6z7cwA5LjE3HtfLz0CEFnRHSBXMwZgu1bCi0L0M1gauh
	 jHDBGKFmPzMrugp+mZ56eIn7/q3IHEw8yRbSnfBWsLCa8MGFzVI9C0ds5Ca8VWRDWZ
	 Fb17xTTj//MCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ECD280CDE;
	Sun, 25 Oct 2026 20:24:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35F92380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2779C80C67
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smB2gEvmyZhR for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:24:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 04E4180CDE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792959888;
 b=dk/JsbSKpbIxviK14GLuUbydtl6xFq2E/mW7fjyE9EqpTVPxAumhIi28u71cMIWOPat0
 mV5qvXFHsQp91s0VsYCCnLR4S0Y2UPMO9UFJi5bHCdbrdRHXx8RkiZr/zkpSy1xi0Uo0s
 5hpMzNGxwvJBe7SvN57ZaHyRH4bnd5w2V0ErBiHQKmI/9FC10bP/kRtliukTNvyegry1A
 NsHDuHbyvR6IyZn/TRjjqbRnDESGTLq0nNmC9Ui5eyrafb8ERUkMqXkC590dCN397fkDi
 kI0Qp8n2qQSnMv5CfmLpu66jWOqEPh6TYmHACR2SybbmPwmCEmDwVmnDiTKgAEiLS0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792959888;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=a6hxZHdIDD/kFVM0bh8PBx6KgJIYSDpDvPzRsVxuBJw=;
 b=q+oPzGw7vhl5e2BJYgMWeqGtqIW+lk8YoEzmzgbliOC2v3QNgjQFkcesT80bInb5T5n3
 E6poSxvgKHGIg6lF3IM7ki0U7JelrFZqNOWN8qZHW4PRYZowRlXbC0fUDUKTz8Jfv5oQR
 Tf4T6OC3gCGVWICv7cUirAsYTECtYflVFfDHrALJwMYtvPKwK0mOCM8Dob0o0zTrC9iRi
 PeNMLcIaiKbF3mBUjseFMszxdOEvCWJzduGlLYOl6OZbbYjxG2cNvdgP+iObVyojYiBP6
 YCcmqqoKvUz2byyu5JrCpVAra/ttX5Kxsb7iN4FVX0CVY/2XRkvqKjH93xaNLQIPmcw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ebg6HeTI; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04E4180CDE
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:24:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 67D171A1343
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:24:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3CDB560740;
 Sun, 25 Oct 2026 20:24:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 782F010328E76; Sun, 25 Oct 2026 21:24:44 +0100 (CET)
Date: Sun, 25 Oct 2026 21:24:43 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <at5lPGMINQbpxw4q@windsurf>
References: <at2w5EdFCWiG0ZjA@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <at2w5EdFCWiG0ZjA@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/chawan: or1k is not supported
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 08:33:56AM +0100, Waldemar Brodkorb wrote:
> Fixes:
>  - https://autobuild.buildroot.org/results/2aa8986b4161c9ce25d4bddf8c29d1b204893e0b
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>   - add the suggested Buildroot way to disable unsupported
>     architectures (Thomas Petazzoni)
> ---
>  package/chawan/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/chawan/Config.in b/package/chawan/Config.in
> index 220c81a16d..3cd31019c2 100644
> --- a/package/chawan/Config.in
> +++ b/package/chawan/Config.in
> @@ -1,5 +1,11 @@
> +config BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
> +	bool
> +	default y
> +	depends on !BR2_or1k
> +
>  config BR2_PACKAGE_CHAWAN
>  	bool "chawan"
> +	depends on BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_PACKAGE_BROTLI

Thanks, but you had forgotten to propagate this dependency to the
Config.in comment to ensure that it doesn't show up when we're on an
unsupported architectures.

And in fact, the BR2_USE_MMU dependency being an architecture
dependency, it could be refactored into this new
BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS option. In the end, the change goes
like this:

diff --git a/package/chawan/Config.in b/package/chawan/Config.in
index 220c81a16d..7a7e982b47 100644
--- a/package/chawan/Config.in
+++ b/package/chawan/Config.in
@@ -1,6 +1,12 @@
+config BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_USE_MMU
+	depends on !BR2_or1k
+
 config BR2_PACKAGE_CHAWAN
 	bool "chawan"
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_PACKAGE_BROTLI
 	select BR2_PACKAGE_LIBSSH2
@@ -11,5 +17,5 @@ config BR2_PACKAGE_CHAWAN
 	  https://chawan.net/
 
 comment "chawan needs a toolchain w/ gcc >= 11"
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_11

Committed with this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
