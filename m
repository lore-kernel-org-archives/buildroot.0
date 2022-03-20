Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A842DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38911408E8;
	Sun, 20 Mar 2022 21:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7sUfuHVxlt7p; Sun, 20 Mar 2022 21:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C8A1408DF;
	Sun, 20 Mar 2022 21:12:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 394501BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 258A8401F8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HP9F_Eb6GJOD for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:12:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A1B340002
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:12:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9da3:2dcb:f988:5999])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 93EF813F88E;
 Sun, 20 Mar 2022 22:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647810740;
 bh=lQ818VxhaB8T3BHc2COUsGytYHRSmEBufroKLJko7QM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tiFyWyW/PMudBAittInvhcsxlgJ0hlaVQ+dnU6cujYrFC4I1O5FEhVfpvUskXJ+2f
 UopUaOrNAkUrxjDgnjnIGIlfjYZJJEzZxaVyj4cg6UWL4ESSYnPCFJBYTHUlK0fKci
 LDT/4b6Ywoa4mrBHqSA87I6jKGdhQlv9Z3lBl0d+X5AgKk6yQXgIZ8AgY1+hjRRgrz
 2anPmIXPk6qIuWwLiN5aVLeaxeksTohTOlQbnaUTI/pIQ5MnwtKtp2YFpgG18E6wC+
 YPJazH9HciYH5tuiLRaFDhJ+EDBCC4gCwQ1YB1z+rcynD6kekkdCzdGbn4XbJKRMo6
 YIdWpQs8da4Tw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Mar 2022 22:12:17 +0100
Date: Sun, 20 Mar 2022 22:12:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220320211217.GG1566358@scaer>
References: <20220320172326.1592463-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220320172326.1592463-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/raptor: fix CVE-2020-25713
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All

On 2022-03-20 18:23 +0100, Fabrice Fontaine spake thusly:
> A malformed input file can lead to a segfault due to an out of bounds
> array access in raptor_xml_writer_start_element_common.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...are-namespace-declarations-correctly.patch | 33 +++++++++++++++++++
>  package/raptor/raptor.mk                      |  3 ++
>  2 files changed, 36 insertions(+)
>  create mode 100644 package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
> 
> diff --git a/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch b/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
> new file mode 100644
> index 0000000000..a48a583cb1
> --- /dev/null
> +++ b/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
> @@ -0,0 +1,33 @@
> +From 4f5dbbffcc1c6cf0398bd03450453289a0979dea Mon Sep 17 00:00:00 2001
> +From: Dave Beckett <dave@dajobe.org>
> +Date: Sat, 18 Sep 2021 17:40:00 -0700
> +Subject: [PATCH] XML Writer : compare namespace declarations correctly
> +
> +Apply patch from
> +0001-CVE-2020-25713-raptor2-malformed-input-file-can-lead.patch.1
> +that fixes Issue#0000650 https://bugs.librdf.org/mantis/view.php?id=650
> +which overwrote heap during XML writing in parse type literal
> +content.  This was detected with clang asan.
> +
> +Thanks to Michael Stahl / mst2 for the fix.
> +
> +[Retrieved from:
> +https://github.com/dajobe/raptor/commit/4f5dbbffcc1c6cf0398bd03450453289a0979dea]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/raptor_xml_writer.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/raptor_xml_writer.c b/src/raptor_xml_writer.c
> +index 56993dc3..4426d38c 100644
> +--- a/src/raptor_xml_writer.c
> ++++ b/src/raptor_xml_writer.c
> +@@ -227,7 +227,7 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
> +           
> +           /* check it wasn't an earlier declaration too */
> +           for(j = 0; j < nspace_declarations_count; j++)
> +-            if(nspace_declarations[j].nspace == element->attributes[j]->nspace) {
> ++            if(nspace_declarations[j].nspace == element->attributes[i]->nspace) {
> +               declare_me = 0;
> +               break;
> +             }
> diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
> index 6d21fad58e..69ac121300 100644
> --- a/package/raptor/raptor.mk
> +++ b/package/raptor/raptor.mk
> @@ -20,6 +20,9 @@ RAPTOR_AUTORECONF = YES
>  # 0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
>  RAPTOR_IGNORE_CVES += CVE-2017-18926
>  
> +# 0003-XML-Writer-compare-namespace-declarations-correctly.patch
> +RAPTOR_IGNORE_CVES += CVE-2020-25713
> +
>  RAPTOR_CONF_OPTS =\
>  	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
>  	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
