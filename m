Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5272C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96BF404C0;
	Thu, 17 Jul 2025 20:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNs_iMeXpam7; Thu, 17 Jul 2025 20:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D725841148
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D725841148;
	Thu, 17 Jul 2025 20:41:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D23181A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3A9D81E40
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5hiPswPQf7U for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:41:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA99A81E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA99A81E38
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA99A81E38
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:40:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B79ADB977A8D; Thu, 17 Jul 2025 22:40:57 +0200 (CEST)
Message-ID: <280cb004-6675-4820-a580-b027891ab29e@rnout.be>
Date: Thu, 17 Jul 2025 22:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715222000.731348-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715222000.731348-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784857; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=51E3opzpiBKsJV34/dvUGhlfxA3WPZ2qmq54Y6etuSo=;
 b=Ou5rmkL7RER0zXPYIRZBIs5S1U0OuPAzzA/BL8N4Ak2VhzelIyleOaZas3jUQhukUXqozo
 9mWWOei8B8KVaqGfgVhHkLyPxKT0B7Y2/wxmCr+LwKVC8aNFlISAZKa/Nn+wcC+/S53+MS
 awRrgLFgqd9a/ny90BC7gLokpbAMOpfF9gGQIKOXmcsWtBqSZ01Ehv6s/wgzgPW6xNi3gl
 gtlpV9EINrWU8JKiwIhwOBL07Jce16Qe55rmrpOF4ixlr0koYADAuiXWFaquDlkgYL6Nt7
 wxpuWJE7BfYzg4G2LJeQMsRL4cKex6Vi+TjVZTLaLTXbwqFfTbsMBr1UDCouVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ou5rmkL7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.6.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/07/2025 00:20, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
>   package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
> index eb9caddd52..a2798b5c20 100644
> --- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
> +++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
> -md5  faef2df5c61d114588fe61c4dac2c39e  pypika_tortoise-0.5.0.tar.gz
> -sha256  ed0f56761868dc222c03e477578638590b972280b03c7c45cd93345b18b61f58  pypika_tortoise-0.5.0.tar.gz
> +md5  1a80beca2d767b93ff62ebe9fbce6a63  pypika_tortoise-0.6.1.tar.gz
> +sha256  36ec2c88c255b9ed7ef49a6068cdeac10dafd4ddfeb828205d3afc092507fc3a  pypika_tortoise-0.6.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
> index b2b10abffd..f0e92faff5 100644
> --- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
> +++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYPIKA_TORTOISE_VERSION = 0.5.0
> +PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.1
>   PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
> -PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/7d/7b/74dce3354d81988f1d69b689f20b28c3e92f2dcc0c46975bdafd3eb37b18
> +PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/db/03/c293fd42c3669e5a79d508c3ed1ca3ffa501600d93abd904a0f86d493ba0
>   PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = poetry
>   PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
>   PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
