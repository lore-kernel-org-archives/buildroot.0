Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0C7C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADFDE40A09;
	Thu, 17 Jul 2025 20:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wc9FuWPndA8x; Thu, 17 Jul 2025 20:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8F6540E79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8F6540E79;
	Thu, 17 Jul 2025 20:09:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 048D8DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFFE5606E3
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlSG1FVe4qRZ for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:08:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E93F0606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E93F0606D6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E93F0606D6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:08:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 57A1CB977AA4; Thu, 17 Jul 2025 22:08:55 +0200 (CEST)
Message-ID: <260128f5-5ac5-41d7-9491-bd55c9cb6219@rnout.be>
Date: Thu, 17 Jul 2025 22:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tim Soubry <tim.soubry@mind.be>, buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20250709151542.2605609-1-tim.soubry@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250709151542.2605609-1-tim.soubry@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=EmP9U0j97vnipsQ/YOU8y7cuuPPDKRkNbkrBZrwtIMU=;
 b=WHwWBPHfkxDxc2vKQzIAGu2aBHxRyzdB0npWFqBBEjOVOAfs6T75PnzqAwaoWWXwUC+laV
 Zi5Q+4xDNHDNl6vi9E53I7QXY5uB0EyRcnJO5R4yNr2lx+/MpJwj5uxZ0lSEo93YY3YHM/
 iKjz0RxdoTUkjH5VcI760YdRAJ6W1jQtDR+k7uCClwdynk/jfwc7cV5on3UFqblhXeI8/G
 vR/CZTKGmiL41Jj36BaKLXmUbisD3ymmQauO+bnnLfsVb4ht42GiBgWwtSYseZe+m6Z5Dp
 nPV0xbQybQK7635+GCTbh0lkFPhasZHalQ9u2+iQzNn/5dBspZB333h4x1rkLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WHwWBPHf
Subject: Re: [Buildroot] [PATCH 1/3] package/libxml2: add patch for
 CVE-2025-6021
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



On 09/07/2025 17:15, Tim Soubry via buildroot wrote:
> This fixes an integer overflow vulnerability [1], in libxml2 version
> 2.13 by backporting the commit [2] from libxml2 2.14. This commit uses
> the SIZE_MAX macro, for which stdint.h was included in tree.c, as done in [3].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-6021
> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/ad346c9a249c4b380bf73c460ad3e81135c5d781
> [3] https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>

  Applied all three to 2025.02.x and 2025.05.x, thanks.

  BTW, it would have been OK to put all three in a single commit.

  Regards,
  Arnout

> ---
>   ...ix-integer-overflow-in-xmlBuildQName.patch | 59 +++++++++++++++++++
>   package/libxml2/libxml2.mk                    |  3 +
>   2 files changed, 62 insertions(+)
>   create mode 100644 package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
> 
> diff --git a/package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch b/package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
> new file mode 100644
> index 0000000000..962e1e091f
> --- /dev/null
> +++ b/package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
> @@ -0,0 +1,59 @@
> +From 719cfb3f3893c7f8fada2ad71fabb68c5fe953bf Mon Sep 17 00:00:00 2001
> +From: Nick Wellnhofer <wellnhofer@aevum.de>
> +Date: Tue, 27 May 2025 12:53:17 +0200
> +Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
> +
> +This issue affects memory safety and might receive a CVE ID later.
> +
> +Fixes #926.
> +
> +Signed-off-by: Tim Soubry <tim.soubry@mind.be>
> +Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/ad346c9a249c4b380bf73c460ad3e81135c5d781
> +CVE: CVE-2025-6021
> +[tim: include needed stdint header]
> +---
> + tree.c | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/tree.c b/tree.c
> +index f097cf87..53385568 100644
> +--- a/tree.c
> ++++ b/tree.c
> +@@ -23,6 +23,7 @@
> + #include <limits.h>
> + #include <ctype.h>
> + #include <stdlib.h>
> ++#include <stdint.h>
> +
> + #ifdef LIBXML_ZLIB_ENABLED
> + #include <zlib.h>
> +@@ -167,10 +168,10 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
> + xmlChar *
> + xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
> + 	      xmlChar *memory, int len) {
> +-    int lenn, lenp;
> ++    size_t lenn, lenp;
> +     xmlChar *ret;
> +
> +-    if (ncname == NULL) return(NULL);
> ++    if ((ncname == NULL) || (len < 0)) return(NULL);
> +     if (prefix == NULL) return((xmlChar *) ncname);
> +
> + #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
> +@@ -181,9 +182,11 @@ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
> +
> +     lenn = strlen((char *) ncname);
> +     lenp = strlen((char *) prefix);
> ++    if (lenn >= SIZE_MAX - lenp - 1)
> ++        return(NULL);
> +
> +-    if ((memory == NULL) || (len < lenn + lenp + 2)) {
> +-	ret = (xmlChar *) xmlMallocAtomic(lenn + lenp + 2);
> ++    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
> ++	ret = xmlMalloc(lenn + lenp + 2);
> + 	if (ret == NULL)
> + 	    return(NULL);
> +     } else {
> +--
> +2.39.5
> +
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 789c6a297e..f8651e726b 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -15,6 +15,9 @@ LIBXML2_LICENSE_FILES = Copyright
>   LIBXML2_CPE_ID_VENDOR = xmlsoft
>   LIBXML2_CONFIG_SCRIPTS = xml2-config
>   
> +#0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
> +LIBXML2_IGNORE_CVES += CVE-2025-6021
> +
>   # relocation truncated to fit: R_68K_GOT16O
>   ifeq ($(BR2_m68k_cf),y)
>   LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
