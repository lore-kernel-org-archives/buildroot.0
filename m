Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A263CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 14:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D837080CF2;
	Sun, 11 Oct 2026 14:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1K_-Xs6LWfY; Sun, 11 Oct 2026 14:45:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D68D380DB5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791729948;
	b=b2Vvp80ocC9MY9D6UHr0//lsdEPBqxgO1/EBrVL4lg4Snlfhi41RmOahtaFrTYId9PWN
	 3kERGiozl+JiQdo4i/JG0BuQ+jRnypNZC/EcEfe/nQnEJC2hqzjiVBqX6jpw4u++lHrkD
	 4457eRsneW6dkn1gMdm70sZnIHxTqZ1SeA64u3J5FgjQFfojsHbiYm+OgIYjFa8pm0rDK
	 SNq0avqJC6h2D2aWiPA+nNjHrKpWR9V1rWwFiAlzM/v/2BHqJm6EReLZqWJe/HcD1EcAX
	 C2tkBoxQmpkUnjPOPMPh2cHfAY5pxxkq5m4ZsIaUNDNOesqDcq6CYg0ctdqLyVL+dYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791729948;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=YEXi0fS2gIXyDO3c35D7etwhebshkPjHzsXiRltmRh4=;
	b=U1B1Z04TN5pPa1ho0/Fh++OSfa0mgpaV5IXUf3TUCyIVPFIy0sWoNJsvr4scvDnjDZFJ
	 ppO+GzVdV/kcwUryu0VefQkjW7K4rtV1MalpOYX3AAWiRKpcny+BG9rres70CwIxwymEn
	 T31uQYKLxiAhx+K0GT424gEOgs7Bm5Fb644Xrzc2hIYpxXzWmQ5YSDnZRhH8U/osI8zAF
	 ShmiZ4a65DGe6JeLqmWy5c3cGobQ4sDNx4Qf8qJPK7cO72j4SOvdL+iwEWZlJ/ZsnAact
	 IjdL4DGuVmZNlOnKCmIYshGP8DBLqbGmGE8CO0vBtxEIXwxe8Eq8B9hrgSs2V8BrcKQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791729947;
	bh=YEXi0fS2gIXyDO3c35D7etwhebshkPjHzsXiRltmRh4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BujCMiL774va5G5dA51rtr5HsFLWHj9ChWONPV+sLflSL6GIHY4UU3nD8pF/FxaAq
	 /We6dEwyoW5lbF2h+Mk81cRbGIy65XgXBwrWQWGxTNyRGkvSCDxpStjlHeA85pbHkb
	 2ipbdVIzRNeKz5FkBkpUmzbvANcnqnVNR65/Jvak8wCIM6igDxPpjvCiizhgCEklBz
	 8AvmapAgy7ilXCCdDogGt9XUOL2V1PWJXuA5jIqR56pPioPDkaE9i2jlxOQbsaQeqw
	 ruBbqqcgbIbEIo8HKjfmnP/zsuZefXS1XqQBfDHURIVlTMO1hdM4FS03Jt8sv2/5l4
	 iMd3MkFZ9MNkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D68D380DB5;
	Sun, 11 Oct 2026 14:45:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFD1875
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A15E380DB5
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYbxnELEnQEQ for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 14:45:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AD7E380CF2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791729944;
 b=qrNUJK1qHJVpXe9AZCdgfuokouTs9WkuRbknIjQHGlHgCU6pZyx5OwBSPlWSpuRq/D0I
 MafkYs1y1K2Udacs/WFEcvgdhLBH1hluV+A18C8QvReClIbsDECjkvRwWxu3dIfqqbSs4
 9OTU4C+o94Hspu0KGYM2dY9xYr57fH2gZ8NMnComWm63AKUkkFXpvk3X4vUegyoFWfyy9
 jAqX2VpLVNKQftNn3RHLBVr0ZqSnU/oXBp80zBWGxGNgw2LHFtZ+8a3GmCH6NfwF5RW5P
 Sx8wg1cvnQgZRqc4aCiH0RdrI2zEsL+kA1F04MVVFz0lIDsPPBY6ZQ3btMXHwFe8Hag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791729944;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=0wwb0EVdiuBcuTYvXoaKHMmjtPOSx4cOwGh/3yzB/fI=;
 b=Xkx1eSa6N4qhIYKdgoaQZFnEBjVrYwwt6nXy8Xf7MahtnhEnAVe3HkMuWOQLaFBVbKIN
 VDbR/+Gus8S4fYEvWDPDhDVnGw47FGgO4ejavLIJpgsFr/uWJdWTeYHHSYGX4EmOgPhy9
 3JrNp2pCL0pMUHE86/2dsDCVS2Bzr0D5gcESuoaaeVjyOg3MDcpkCRYWStz95RlF9iL2H
 9rA1AsxAUMqKBaAaqUq6UALHVNXU42nyW+VUP6lajBM6VTa+L2lLPKhuqSt6s9v8R3hXo
 I+89bmFYpmERgZQP9PKNSj/7NCZuw5G+KQ6SSRnRJJcW1B2yXlEeSZch8IGwmUSvIog==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=iqDORn67; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD7E380CF2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 14:45:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EAEB7B979F97; Sun, 11 Oct 2026 16:45:28 +0200 (CEST)
To: buildroot@buildroot.org,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>, thomas.petazzoni@bootlin.com,
 romain.naour@gmail.com, br025@umbiko.net
Date: Sun, 11 Oct 2026 16:45:18 +0200
Message-ID: <179172976508.202205.5195853238554851193.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260328074708.98982-1-chakrabortyshubham66@gmail.com>
References: <20260328074708.98982-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v5] icu: fix static linking by adding
 -lstdc++ to pkg-config
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 28 Mar 2026 13:17:07 +0530, Shubham Chakraborty wrote:
> The ICU library requires C++ standard library when linking statically.
> Without this, applications using pkg-config --libs --static icu-uc
> will fail to link with undefined reference errors to C++ symbols.
>
> This patch extends the existing fix for static linking to also add

 Write this imperatively: "Extend the existing fix ...".

> -lstdc++ to the Libs field in the pkg-config file when building
> in static-only mode (ENABLE_SHARED is not set).
>
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

 Applied to master, thanks!

 One important thing that was missing is a link to the autobuild failure.

> ---
>  .../0003-fix-static-linking-with-icu-uc.patch | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> index 36a3d1f696..d74aca8088 100644
> --- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
> +++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> @@ -13,14 +13,26 @@ http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef52
>  
>  Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>  ---
> - source/Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> +This patch currently addresses linking against stdc++ for shared-library
> +builds. Add -lstdc++ to the static build flags also, to fix 'undefined
> +reference' errors when linking programs like xmlcatalog (libxml2)
> +with musl static toolchains.

 This should have been added to the original message, not below it.

> +
> +Upstream: Inactive-Upstream [Buildroot specific]

 It's not actually Buildroot specific, it could certainly be submitted upstream.
It's just that nobody ever did that.

 Regards,
 Arnout

> +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +---
> + source/Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>  
>  diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
>  --- icu.orig/source/Makefile.in	2025-03-13 19:31:23.000000000 +0100
>  +++ icu/source/Makefile.in	2025-09-22 08:56:36.791792784 +0200
> -@@ -279,7 +279,7 @@
> - 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
> +@@ -276,10 +276,10 @@
> + 	@echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data libraries" >> $@
> + 	@echo "Name: $(PACKAGE)-uc" >> $@
> + ifeq ($(ENABLE_SHARED),)
> +-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
> ++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
>   else
>   	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
>  -	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
> -- 
> 2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
