Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109A2CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 17:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAF4940018;
	Sun, 22 Sep 2024 17:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IO03PydMlZi; Sun, 22 Sep 2024 17:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F2E740022
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F2E740022;
	Sun, 22 Sep 2024 17:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D42771BF297
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 17:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C307560657
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fBxlHfVOBRp for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 17:47:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46F9660597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F9660597
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46F9660597
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 17:47:08 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 529C944079E;
 Sun, 22 Sep 2024 20:44:39 +0300 (IDT)
To: Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20240922173522.3283547-1-nemaakhilesh@gmail.com> (Akhilesh
 Nema's message of "Sun, 22 Sep 2024 10:35:22 -0700")
References: <20240922173522.3283547-1-nemaakhilesh@gmail.com>
Date: Sun, 22 Sep 2024 20:47:04 +0300
Message-ID: <87h6a7twbr.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1727027079;
 bh=xC2mOf5H1NM46a4pcSgp2TVtIHXzRhOGU8T21aX4VPE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jlapjlaxY/7EX19aGUEb2frJWseDt8ZPnNkftmZWtcbST6MElykaubkNqIsWAq1KY
 M9uj5YplKoOoL3TrKaRa3fDV+mKYlGzSB+q0XnXiBufGXhTt0EwD0PfxPCt49BgZ/L
 pYuf/ahN92eaZGShbwIQ6aFiQzSCDzsrXgCRmnlxSB3yn6ZPfK9I5HjIZinmuELULe
 jfveoWNEHTEwas9S2JRRavrx1W+KmWUDWqkcdfFRWxdycVX+gebSjp41CIMI+AwsOl
 RiSU0yB9hkDx+x//WY29z0Q+d4t3aXfhAoIA4Wji6Kh2WvpjJ8bABb/j088qFAjPCs
 JCb6/nWZDdAuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=jlapjlax
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.10.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Akhilesh Nema,

On Sun, Sep 22 2024, Akhilesh Nema wrote:
> Changelog - https://curl.se/ch/8.10.1.html

Thanks for the patch.

This is almost the same as Bernd's patch:

  https://lore.kernel.org/all/20240917182118.3009727-1-bernd@kuhls.net/

But Bernd noted that this bump fixes a security issue.

baruch

> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 1d01935501..4817ec11d6 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.9.1.tar.xz.asc
> +# https://curl.se/download/curl-8.10.1.tar.xz.asc
>  # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  f292f6cc051d5bbabf725ef85d432dfeacc8711dd717ea97612ae590643801e5  curl-8.9.1.tar.xz
> +sha256  73a4b0e99596a09fa5924a4fb7e4b995a85fda0d18a2c02ab9cf134bebce04ee  curl-8.10.1.tar.xz
>  sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 3661cbf5bd..b81e355195 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.9.1
> +LIBCURL_VERSION = 8.10.1
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
