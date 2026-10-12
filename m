Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8033ECA9EDE
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3142380D09;
	Mon, 12 Oct 2026 10:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PguVmJULt9Zr; Mon, 12 Oct 2026 10:30:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 356F580CC5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791801006;
	b=jLrOnHy4DRIig4ul710xDmfm2CUQGpxUAzv8AKgEifF/sKJXWLUSPYqW/vyDFjL5Djn5
	 VMLiVos71B7n6wC/yGZGERb/syHxYMX3v/Mn2R2LV5AYL1BLIuV0NyNKnrc43vO57Muk4
	 j55vYq/onBMchkITe6BdAMnDPxFsxydA7Mw4ApQ5eCD2nvnigfkx3KqUQgOjRKdXeFgFF
	 LzSUnAzJs/Mc6Mpb0QdrBvY0yGQ3WrdAbooOH3wNA/vEd07HsjLzE2Uhh57bydimf2BCL
	 /Jr5KKi2HK2w3ror2MplDvlZlW9uFX4KXay+8SSb+NEigtil6GQv8v453DtByMFqRjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791801006;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=QvTGJHws9/0XWKDfIDkReOYC0R7mKopxHh0Dt78hySU=;
	b=l2uA36uwLpQZUuu73hEBAxrHuztI83hcUxx18xYvNd+Hx1/O1dfavn5jp05Y47yoG8z2
	 OUeAmKL1aVfjLXeLigsrd6Hm6dLfNUWH++yv7GfzUykSl22IKJ8VWLDx3RpeGnogwpYkt
	 k+q86Px2wkjNP3aEc92hmO5IwIkHbkgwZgBJMdi1AC689UHQVWjx3Xdduc2jQ6uCe4rVi
	 g3ryLOPhhWsF3jzdhWEP5Lz159SD0ZtKOHKq23wblKx+JcoZUUa5nu9EkO4JTeYp+oNu5
	 cohkGPWrBL1zuFghhiUk3EVgsQh1UmIpG1Y9DWX2W6e9/wnBilHjmMU0q5qt+DuXZSg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791801006;
	bh=QvTGJHws9/0XWKDfIDkReOYC0R7mKopxHh0Dt78hySU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iAK9OY8WNmF3Uu0gAYKjeFjhD+t4sAsuVUJQ+X05ktqeYKALj3zg+HmZJrNAPr6dL
	 7tLzMKwdw2WCFRwWjlw6biXm9VooGXYmdXFEHWIi/dmRwXJDPNjrWBYPj46Dj0Todn
	 I/kb3e1pf77fJjEV0OPOtQT9qKSGIljVxUliscJBzC2L1l2TLoNT4CWjv1iblkkCdT
	 FH+5VuI3haN4NXF8zjcHs0CAuYFoFjqo3n71l4UdHZRgI4PFWFQGgNfu2Zb+eOZKex
	 PPCmnX9k6Brn7AfCXtqjcGeEHnsdGeGpfnSXOqMyC6aBBFROthVrmcxTDkDtUoOscQ
	 W4hIfc8Nd57EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 356F580CC5;
	Mon, 12 Oct 2026 10:30:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4CE7179
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D74E2405A5
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOz7YexCp8Yp for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:30:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BFAEF4059A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791801004;
 b=mHC6foYURRI3M/29eCy/JI8WK6Pg6J/xRLsfga7L1lzeo1K/1gkU0smv+R6UXKU2z1H8
 Wt75/aZmzl4s2B8M4HbPkqhEkM+XxZo34sh/1iHRBGlvxY0n1VK8SMjr6P5TyHGEK3G6l
 tJHChLM9HDzj8SDGL4RhKxvTAEqHzCMJzfcqArhLIDbAYMCPz2laGQoHaC/oGclxkUmKF
 BQsWJeZBQvL6KfAUqiafegqI+PzgFrQlvaUFNyHsF1NPHpsSbBkeGPgFJDQkkTbU9Jcsc
 Lv7c2+xzsHIpaCnSu7n1KERrrFLerRBKcXeLMK5PSD9PvOmb1w+s+phhz+EOcgb0wRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791801004;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=ZBOV3hK/+vOz5opSzhAL2kjLrJXttXs7Ha9s21rj9Wo=;
 b=BTBElicyKfVKwnbVL8B94zAghXmiTlvXce6JuHkDOn0BlZQlnzIGDn5yFvmlwVySIS2O
 pRXqom5ss6vrI1HVPywf6wwbcsqgfkAcECv5s+M4kFu15Jw0HRn+JWwHT574xB9JmugCF
 M14cdBJtn0ICby0KBlxGW8+265f35u95Kt9dWvRkwVkqNie/3sDX/wFaH5cx86VnHS6HB
 TZtmgGHu72tAfsMYmuxLX4dMtOr4diUbKuXujSfbX3WyUKYafDkg3WaB+unUn22JMCajt
 ZBJJ/ja2IVvhEwog6p+w660oR7+ohf5TeuaNNKacDJnKlnPk7HSo64FivLZv8SJdsgA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=JenD+pNw; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFAEF4059A
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:30:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7FF7DB97A17B; Mon, 12 Oct 2026 12:29:54 +0200 (CEST)
To: buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>
Date: Mon, 12 Oct 2026 12:29:35 +0200
Message-ID: <179180053894.385429.9274935735888386980.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260925064257.1162394-4-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-4-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 3/6] package/qwt: bump to version 6.3.0
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

On Fri, 25 Sep 2026 08:42:54 +0200, Dario Binacchi wrote:
> Release notes:
> https://sourceforge.net/p/qwt/git/ci/qwt-6.2/tree/CHANGES-6.2
> https://sourceforge.net/p/qwt/git/ci/develop/tree/CHANGES-6.3
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 Applied to master, thanks!

 Regards,
 Arnout

> ---
>
> (no changes since v1)
>
>  package/qwt/qwt.hash | 8 ++++----
>  package/qwt/qwt.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
> index d4fd210cbd69..e20c9ebadab9 100644
> --- a/package/qwt/qwt.hash
> +++ b/package/qwt/qwt.hash
> @@ -1,7 +1,7 @@
> -# From https://sourceforge.net/projects/qwt/files/qwt/6.1.6
> -md5  cc71be5d6c33c2fc19ae8082ccdd3e83  qwt-6.1.6.tar.bz2
> -sha1  b1f17a86c9b1b0790a0c0067ef69fb6277efac79  qwt-6.1.6.tar.bz2
> +# From https://sourceforge.net/projects/qwt/files/qwt/6.3.0
> +md5  06a8f8eb1bc07bedfb1df601804439cb  qwt-6.3.0.tar.bz2
> +sha1  9180f33f75ff8817f27019c94d10f92de840a5e4  qwt-6.3.0.tar.bz2
>  
>  # Locally computed
> -sha256  99460d31c115ee4117b0175d885f47c2c590d784206f09815dc058fbe5ede1f6  qwt-6.1.6.tar.bz2
> +sha256  dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a  qwt-6.3.0.tar.bz2
>  sha256  d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> index 9f0b78655f6f..67292ee025be 100644
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QWT_VERSION = 6.1.6
> +QWT_VERSION = 6.3.0
>  QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
>  QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
>  QWT_INSTALL_STAGING = YES
> -- 
> 2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
