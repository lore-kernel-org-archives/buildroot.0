Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D827CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379E881154;
	Sat, 10 Oct 2026 12:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Omb48_2cfNwU; Sat, 10 Oct 2026 12:24:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 79C1381155
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791635084;
	b=nnfIvohXoGVO8mIQbtnbspAULJtSK6fTy/enyvPQISVVJGlSiZvPa68sK7e9dXNwOXIM
	 Gu7VBoArF5pAQmHxm7EGI6gR6AK0sPETFTLwejuooDzWOyCVbev6jUbTQOXZ6LfjsklpI
	 hBSTmwmW/HiiwDq9QnHXPgoB/ShqwMLnjuIlthjAg0MBkpuhVJElphqHdtXuX/s7Xlj2/
	 dHTZoUFZQc5ssB53eMzvTlEcESCS0IDlgMchA3EccktcThLA3CZsLhcIUguL591rmTShH
	 oICC/fr3cJhHQpEwKRSVCEoQ2ZuvKhFtrvz7aZyOCTT06hqRPrNcUOIU9jr69pz7q9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791635084;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=tfCbrXjARJ2AZbZiw6GoYclQSPvi1i8WFwuYom4N5CY=;
	b=siKIuFwR1wfBgrwcWqVNG8A7ZeaXwHmj+tke24VkDKpptU5b+7wr4rfqPxUsoCCdjwOF
	 94Gh6FcgxzBMSu2pZjmiY6C2LCzyj3FxctjtRkqR9JFfbzU1v2aTIK+//ge5hCPG7XKkP
	 B3D6E0DlmnyoRQ1vxJ5oe4hSTioIz2/pYevYH5QDDuS2LRwGSR4e6lCmPQ5j6s8ZqotFn
	 GXodkckfp6Sa+PX7b+1RVEXXkFp6ofy9AAuVr2ogUVGwMx5YJ89Ac8IktBHGmvVK9xbD2
	 G3J1cY1EL7pkM0pkQD/gRwvJtTN6YIezYniPNwIVYUmS+pF8Ie2Z8HWwo9z+BO53KCA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791635084;
	bh=tfCbrXjARJ2AZbZiw6GoYclQSPvi1i8WFwuYom4N5CY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V1t9gEP00ZoVOKVxVt1paWIKGyfEDxry6hU4YDRvlXzTsVgg00WcSpbv6Jhy+qS87
	 XVoaZ258blQZri5uoXS7fkOCtjZfrSutNd8alAuKxwYf2vvdHC9n38caC5Mb/JLIt6
	 ZDp63KuQhnbediGveKn8RFqtFHFKXL8WXl3mhd1ZE6Wp/BdqXAY6R0LJmhamS3pjIN
	 /GEGxNQ3TP5A8ShaV9UQJwvNfAWakHjixfGpl34By0kk5EU2yfge1F+/GgE+6RYLWq
	 ZsCSRaztr8He8uno+hTx5lhW5ANKEEGAEquRQxNGCOhdYNZ9+z+nm5j6JYz9fO78mo
	 loLfRTjFruXrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C1381155;
	Sat, 10 Oct 2026 12:24:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B41F235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CDCA60629
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_RiPpx4JPq6 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:24:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 889186060A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791635082;
 b=UPvNCX5YKESmy+zvvMOdpSpc5d8Rq2TRTDT2MBIjOlmaZlalInjfOzgpjA8uyunLATX6
 v/0P+oiLBfwnJXMbYBA2gNqlkuKxjmQqCoADVuthS9Q2fWvhVmQaoShQP3SoFwic/fYkb
 qj+6XDMm2RiDS+Z9WjY2eDMyy+77uvQMDPoxx05LzbqL+aX0zzVQCz608mgjDXRNFC+8x
 JBwB6S5yN4f00D+3Zfw9Q61QNPwSRrpnQuyTTNuIxlFURCn/KkfTdskciZfwbqzbP9s5m
 iMSZ/StRHffA5dlhtUBRnuPULDdFXmdBhCSuzlnadqs5+Muzho4hZijLJkyL+ZAPanQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791635082;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=BnAsTQLpVGT3dFguG/76NVtm9j+5cSzY5AvKaIwrgWI=;
 b=kSzd3XO2sxMCdLbT+EFpU8OYqntp7gbgflRyPqfqj8FTXNi4RBevZUVHP/37BCqeqNJV
 0bozS0hKs0+I9KysxCYTWHbTLYzShl5rTA/8EuBryXdkPwHM2bFiMMttmNv/IyOCoL4xB
 OFOt2/sYNsakUpxGtZYVedBKChgRo6kBGrxzWz7kV0tPwgE/QTTJKZBeAV6F7MXbn4Jd0
 B18exBjR94g96RFlWochJG4jbxbdLpkrOGzJ1xuiEidmnj5QbRYhf0KIz/IwgPvWoUaiY
 aK8K7xNK/ur89zVUjXzJZIbVlr+F1ofzGBFzSVZuXUFy7ZIhzdOxQzrL+o9pgaRk7Gg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EVGQbi0X; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 889186060A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:24:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EA5BE78035B;
 Sat, 10 Oct 2026 14:24:38 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:24:38 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:24:38 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003224447.744966-3-james.hilliard1@gmail.com>
References: <20261003224447.744966-3-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <79f8fc410ee6e2a4ab79ed43b839727a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump
 to version 3.5.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/10/2026 00:44, James Hilliard wrote:
> Replace the host-python-mypy dependency with host-python-cython and
> enable the Cython extensions instead of mypyc.
> 
> Drop the dependency check override now that the Cython requirement is
> satisfied.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
