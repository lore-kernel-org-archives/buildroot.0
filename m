Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018A1CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A285180EC6;
	Sun, 11 Oct 2026 08:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VpTEMV70TDT; Sun, 11 Oct 2026 08:35:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B919180EC7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791707725;
	b=dQcqHLGe2or6G1fRjrZIAguyhoclvCNanhanDXOn2CN4wJLx1ACSUogOvAsK3CkGQ7jH
	 ZOxSajiRZiWKiAUOAj3A/ssIGvaqwzYAFZwkZ31+5hX48mSjxzSoI9ywxzC/vJwgORcMC
	 7Le209ZVrAl84Ap3WNMHw8+CacI/mK8+YfkVxXSJWyBZbMQD4hmawS8uok7aRHcGFCtvW
	 76B+cOvNQ0XTGyDmD7+zGaxzx0Wmr1cksGRLAcTYyWgONJSbLHVNkrJqcw+hdlS1eSExm
	 UaXnqSxvEpesssu8djIHIrvnclZzPFExQHZJI2XU9wtTbtWprs30haUreqv5P9Rxh4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791707725;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Be1Ie37vBCQImeWhfviJlwdx20pxWnwuBvhZmVmPXd4=;
	b=Ym28r7vnRh0CIkc3/MVMRN5tsm/HLMi9HYT/oJtYoubwhbqU7HaP1DG4xProVPaFv0Z0
	 07iLqaKhC7XAhOaWEqBZP/aSv7tXBjzmOwXey/SNYyXa5TCQUhMr6qqQNtgedeLLES1VG
	 8DQTOcftM+zO1oFxOXLdn6nuDKa4HI8NPENbDdXtzj6qBLY7lat5E1kcfZSBZQvr4Ssv8
	 sHHvlnSZ4Tp8xvbBCy2syBRsLY7hsX9z9e0Vd+W6C/+Qkav487vDTvDrboZCntzE2aUOU
	 5N8nyoWgERLbXxBbvKd8qsO8rYQdpHsg3lYgpqVeDxRFCzyQzm2iQ1fT8vd2VL/ewhQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791707725;
	bh=Be1Ie37vBCQImeWhfviJlwdx20pxWnwuBvhZmVmPXd4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WNKqoi7qgQeAdQicmb1JKqf+7sIbag+l+Ap8Y6b5ExOefA4yDW6NJysZaaHoVAhnH
	 qJ1h/CK/q2A2T5wHfy6zR6locceODt5zdBie5L4vhy7A7Ey5e8rW1Arf4lzbnWZRkb
	 11Jv+Arfqsdol3ve7QffPBP/hbYAutOuB9dhDMD47WhLIqxQNuXg+l295Kptu++sDc
	 eIEcUg8REQUs2ZTkjmgQ9gc5yTothsh9grcaDfSajYotyRPG6ZY33EG2ZbZZnTPtO0
	 JPi6ppDY9uBVD3wlQ4zkFSw93OXIQMKL9ZuMTswYidlv36YP0R0IARV9ACqzrWzRsa
	 DQI75WlPVI7KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B919180EC7;
	Sun, 11 Oct 2026 08:35:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78B64156
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6732160631
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsWlFJaQRK8i for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:35:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7AF8460623
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791707722;
 b=DPdPewA+wUExL3x9S3mwmQSN3X/kkJ7q4A55vxdzrPV54SlHS6P2XBbEFUv+z4546ZeC
 PWfqNrG/r35W6MRLqQ0uuEzNzJbU5AIlCHm57S66GQZGIBc02YQfEYlTkXQ48L6AOmejH
 hdAQJ0z7+KS83Ov9nr9keSLHODBKIaXC1OVLX1pdU7wt3xjYSfSVcf5EDWTqgIu55QuiE
 UsM6hTzmEyoi+TYrhFJG0x+jw4Ua30Wx9guF3oa06i3Ms1N+YeTCUWgE2A3blHKBhvILO
 Q+x+cosFrRaudywzB2cNUEI0I0plnmGaEHc0LJAOx6ri/Y26eEtVCEvZb2O6sxp7adQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791707722;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=anZcT+0gHhnN4WMYQsJr5YC1qVsfI7XJDR1n1Zw0gAE=;
 b=PCubSOjwu1opiFGTezSGZkr26MvtPZBBs9k0dGQuZsQg+Nj3XRnsfK4RgSa81Can/huy
 nU6SWjc7fQycimFLHfl1yLesXC8/5Usr5FtdPs5sUDYtYlgERN5ca62V3VsUwmD2UuJ6V
 tck1hlVjfn36m4Ut6Iei3vB+TbQqPWSfNAeMKFzn+n0eNsKba9wOUxaK5yFP2HmjrDD8Q
 UsgzRHf0swY4khFgpSKZ4JahaSUgGXclCut7N2y9aIo+XXl/dV916KBzPuVmB61uPLsEF
 hXhlPpCosobRcdgnrBT0n9EKq2TbKTA4nHKj72JO7C/HUZsr0v4pqD75zTs9Zbrwjzw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=gqZ73fqw; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AF8460623
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:35:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58F6CB97A143; Sun, 11 Oct 2026 10:35:15 +0200 (CEST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Sun, 11 Oct 2026 10:35:10 +0200
Message-ID: <179170717085.143633.10932803994243912601.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260918091142.62239-1-thomas.perale@mind.be>
References: <20260918091142.62239-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] utils/checkpackagelib: remove unused
 variable
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

On Fri, 18 Sep 2026 11:11:40 +0200, Thomas Perale via buildroot wrote:
> The `self.pending_patch` is set but unused.
>
> Fixes: b00ac4e346 utils/checkpackagelib: add new check MissingCVEPatch
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

 Applied to master, thanks!

 Regards,
 Arnout

> ---
>  utils/checkpackagelib/lib_mk.py | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index eb5fbf474c..065733d464 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -130,7 +130,6 @@ class MissingCVEPatch(_CheckFunction):
>      def check_patch_files(self):
>          for patch_lineno, patch_name, patch_text in self.pending_patches:
>              patch_file = self.package_dir / patch_name
> -            self.pending_patch = None
>  
>              if not patch_file.is_file():
>                  return ["{}:{}: patch file '{}' mentioned for ignored CVEs is missing"
> -- 
> 2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
