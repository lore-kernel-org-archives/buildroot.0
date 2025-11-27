Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F10D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4B3560A7F;
	Thu, 27 Nov 2025 19:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbF0zHI28o97; Thu, 27 Nov 2025 19:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE66560DA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE66560DA6;
	Thu, 27 Nov 2025 19:48:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E75D92A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8BAC60DA6
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktmIwmeyEbqi for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:48:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27B5260A7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27B5260A7F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27B5260A7F
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:48:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C5C5B979CEF; Thu, 27 Nov 2025 20:48:29 +0100 (CET)
Message-ID: <46ce2730-7b92-4964-b405-5e6e5b56449a@rnout.be>
Date: Thu, 27 Nov 2025 20:48:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20251111114645.978645-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251111114645.978645-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764272909; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=p3uGAujRjcloOXeo0CnzPYRAiuEH3iIwx4DH+/N3+oc=;
 b=oWmUFiOfxgqJGcGPwsDyd8urbg2nqejsJtm3eQs+NDZ2pyP+oabYeZoVTohLkkd0/SJYb3
 PYRtXobmP3LqUU60s+wJEIQDTLSnOV7kPk0pmFu9++4CgtXyUe53J6CAyfasTc0iyfmbkj
 ScZOMWVIAvAsRWIAPNlpB14KSL3Zj6j8AWP5a22SJoAb/wX5eRI7oiaCJkpbgQszcrt1mr
 9zXHW/JDRDVCBoyey4PAQ743rg4g/hNGSMuvl6Ob8J7U27A5XJWk3BFX8g/5irjvy4aNvV
 GQOnUJhoVh5qDiuy9wAoow5Bf26qoEAAA4+wQExz1XScI34U6WnYE3W0MxD/Fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=oWmUFiOf
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: security bump version
 to 10.11.15
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



On 11/11/2025 12:46, Julien Olivain via buildroot wrote:
> For release notes since 10.11.11:
> https://mariadb.com/docs/release-notes/community-server/10.11/10.11.12
> https://mariadb.com/docs/release-notes/community-server/10.11/10.11.13
> https://mariadb.com/docs/release-notes/community-server/10.11/10.11.14
> https://mariadb.com/docs/release-notes/community-server/10.11/10.11.15
> 
> Note: the version 10.11.12 is documented as fixing the following CVEs:
> https://www.cve.org/CVERecord?id=CVE-2025-30693
> https://www.cve.org/CVERecord?id=CVE-2025-30722
> https://www.cve.org/CVERecord?id=CVE-2023-52969
> https://www.cve.org/CVERecord?id=CVE-2023-52970
> https://www.cve.org/CVERecord?id=CVE-2023-52971
> 
> Also, since Buildroot commit [1] "package/libxml2: bump version to
> 2.15.1", MariaDB is failing to build. This new maintenance release
> fixes this issue.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845663
> https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402485
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/a67cff491a173c88187ce76e0d3cdccdb48371fc
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12044712660
> ---
>   package/mariadb/mariadb.hash | 4 ++--
>   package/mariadb/mariadb.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
> index 05340c1faa..216b3be7e3 100644
> --- a/package/mariadb/mariadb.hash
> +++ b/package/mariadb/mariadb.hash
> @@ -1,5 +1,5 @@
> -# From https://downloads.mariadb.org/mariadb/10.11.11
> -sha512  d9c154207a9f435ce08d5fbfe31814a739e577c656ef9996cf7e60c2cad8b4c07e2de8d94b6191fefa2b5cbde56437b586f85f144d3b4fcec8533449ed8411ac  mariadb-10.11.11.tar.gz
> +# From https://downloads.mariadb.org/mariadb/10.11.15
> +sha512  98d1e54954b69cf87a96be7d76f80333f27832a29279e6b0a9615b830e171713222abcb9ec9b9a545c0fc4a0f9f8e3d4774babcabf534a6fa3cb3dfdaed0dedc  mariadb-10.11.15.tar.gz
>   
>   # Hash for license files
>   sha256  ff437f42ea15b42f3d9617e691b9f159f38a0b1b0748e482304857a5026ede90  README.md
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index 53395afc91..e2c0cee3d5 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MARIADB_VERSION = 10.11.11
> +MARIADB_VERSION = 10.11.15
>   MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
>   MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
>   # Tarball no longer contains LGPL license text

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
