Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B25C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C90960BDB;
	Tue,  4 Jan 2022 17:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sjOxPp5iCcM; Tue,  4 Jan 2022 17:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F4BF60BCD;
	Tue,  4 Jan 2022 17:13:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5F01BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDA0E40118
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfHTKtK20N5b for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:13:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A37C440104
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:13:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id n30so38934848eda.13
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ZhfOs9Z8jBPcVejfdZZj7eq2+Ah2ntBzXao82eDJFQ=;
 b=Hnpsa+Sqo7IeXffm/ikqhiBYoSk1iUIjUm+IWiYWxn+VtB33CYflX+MJs4NP7ytsaz
 2e3TcIf+9rhx8NnPjZulDvf6Sma4JMKV/6wlM0Z0XFgHp9OzBic1LmUe68wtwMt26jAI
 IrCAoEV4AACvrXFBPR6v92XOJ8u0Yn8zdgaAq72H8KVb7PwGrXXzRKtnLZ05doFPpxvZ
 uYlU1ERJ55ULJMUhRwodSyIdAJOIHp8KGqCwJjzhUgrX+usXbnPfo0ODbp1pj7z3114g
 rgIOSU8TOB+vPYUVep4ju27KnJj9L9z2r6u0hxG2txZpsmjxbOciWNJzbsu5d26ic0dI
 E7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ZhfOs9Z8jBPcVejfdZZj7eq2+Ah2ntBzXao82eDJFQ=;
 b=RbGDJSOd2z7PytTGwLoGTrNHV2SmiVl4egOUxKWmRU6z8WCfZOUQJ1MI4zOF5vgl8g
 7RMx1OryJGYUUMVgi3HmH+D+yOVJxj2PJXzGY5XCKcSnD5YFBFgw5oQTfyNp1Cp/BAat
 L5SWbFRNdUa2I8Hx8pJUmx6W4utRtYdLs4vYB5hw6RvDV3olnwkv8e7YLPiPPRsyzQMW
 1Z/TlPhhGvOiZK2hlX1giu1ihtToTdnuf85NFGhtoFmpGB3jbtiJPNtNjNRVzuaMgMrg
 MdN2duLiMMBK7/8NgDulmZobC1pK66/2PPt1qYXVb3CXteZFI8KkcI6hOFlzufX/z6zW
 txXQ==
X-Gm-Message-State: AOAM532EnA3ADGWJ1QtXICX9PFDFOXmiR1XEgiiltPK5BB8dw1IspzEs
 kmREXldAmSc56GwVxj5cppl51g==
X-Google-Smtp-Source: ABdhPJx182ZjitIA9Y3mjBTWLCnNUMrugFpmriFLxcfiT8Hma9B9dxU5r+AQErwD4cpkFJyTjgK7Fw==
X-Received: by 2002:a17:906:58cf:: with SMTP id
 e15mr39572178ejs.343.1641316415766; 
 Tue, 04 Jan 2022 09:13:35 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d27sm1665066ejd.117.2022.01.04.09.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:13:35 -0800 (PST)
Message-ID: <d12354da-096b-8265-8a37-262024d01881@mind.be>
Date: Tue, 4 Jan 2022 18:13:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220101180004.2499189-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101180004.2499189-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python{3}-cffi: bump to version
 1.15.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 19:00, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-cffi/python-cffi.hash | 4 ++--
>   package/python-cffi/python-cffi.mk   | 4 ++--
>   package/python3-cffi/python3-cffi.mk | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
> index 8ab672a56f..41565f9a62 100644
> --- a/package/python-cffi/python-cffi.hash
> +++ b/package/python-cffi/python-cffi.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/cffi/json
> -md5  5c118a18ea897df164dbff67a32876fc  cffi-1.14.6.tar.gz
> -sha256  c9a875ce9d7fe32887784274dd533c57909b7b1dcadcc128a2ac21331a9765dd  cffi-1.14.6.tar.gz
> +md5  f3a3f26cd3335fc597479c9475da0a0b  cffi-1.15.0.tar.gz
> +sha256  920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954  cffi-1.15.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
> diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
> index 2504cf18f4..b14dce8225 100644
> --- a/package/python-cffi/python-cffi.mk
> +++ b/package/python-cffi/python-cffi.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   # Please keep in sync with package/python3-cffi/python3-cffi.mk
> -PYTHON_CFFI_VERSION = 1.14.6
> +PYTHON_CFFI_VERSION = 1.15.0
>   PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
> -PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804
> +PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/00/9e/92de7e1217ccc3d5f352ba21e52398372525765b2e0c4530e6eb2ba9282a
>   PYTHON_CFFI_SETUP_TYPE = setuptools
>   PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
>   PYTHON_CFFI_LICENSE = MIT
> diff --git a/package/python3-cffi/python3-cffi.mk b/package/python3-cffi/python3-cffi.mk
> index 52ea3b3fbf..2770eda93e 100644
> --- a/package/python3-cffi/python3-cffi.mk
> +++ b/package/python3-cffi/python3-cffi.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   # Please keep in sync with package/python-cffi/python-cffi.mk
> -PYTHON3_CFFI_VERSION = 1.14.6
> +PYTHON3_CFFI_VERSION = 1.15.0
>   PYTHON3_CFFI_SOURCE = cffi-$(PYTHON3_CFFI_VERSION).tar.gz
> -PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804
> +PYTHON3_CFFI_SITE = https://files.pythonhosted.org/packages/00/9e/92de7e1217ccc3d5f352ba21e52398372525765b2e0c4530e6eb2ba9282a
>   PYTHON3_CFFI_SETUP_TYPE = setuptools
>   PYTHON3_CFFI_LICENSE = MIT
>   PYTHON3_CFFI_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
