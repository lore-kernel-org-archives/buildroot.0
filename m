Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC044C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 883B984074;
	Sun, 18 Sep 2022 12:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 883B984074
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G76bgHE0Ov6l; Sun, 18 Sep 2022 12:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8960C84026;
	Sun, 18 Sep 2022 12:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8960C84026
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67B951BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5066E4097F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5066E4097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89XD_FcHLhem for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:50:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 389D140111
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 389D140111
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:50:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2a18:6673:cb9f:3864])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5EE6213F88A;
 Sun, 18 Sep 2022 14:50:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Sep 2022 14:50:20 +0200
Date: Sun, 18 Sep 2022 14:50:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220918125020.GG1419013@scaer>
References: <20220918102314.177485-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918102314.177485-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663505422;
 bh=aXiJvEQWLS1/r0yeq6iKXf5Vyvf8cYjPe9kQW6+agxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UaK5CTQN/ey1V7Efv3lBaICkfaD8//wsTkzyLBPceKM9gUtbkG0uGXaMRjclRQ+Vy
 m9849CGXwKdPXAkiKOQxlAeNtF+d8+/xh89yT7dsCGptp+ocs5cl8fqkj6oRpzUW3u
 EG/1r74fmaGZ22KMDFpGBTnNAhPOzU1m+0gt9dQoQGZbu1B9ljeQhTP5Xu2Z0ORa9S
 JnGZwcxsTX+LZXNx5NeHQV28HuZsNwL/RgwEQQw72VHqZP48aevsPDRTpo2XkAcGE6
 Ep8VEhL/4ZI7iRXajzHa1+jsG32la69bgmbeYgOgNqiHVR/KNomgBotq2y2Ly44CK3
 7n2MbGtEaW1Pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UaK5CTQN
Subject: Re: [Buildroot] [PATCH v2,1/1] package/expat: fix CVE-2022-40674
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-09-18 12:23 +0200, Fabrice Fontaine spake thusly:
> libexpat before 2.4.9 has a use-after-free in the doContent function in
  ^^^^^^^^^^^^^^^^^^^^^

So I was wondering why we did not simply update to use 2.4.9.

That's because it is not yet released, so the sentence is confusing.
I've added a little blurb to make it obvious.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> xmlparse.c.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix path in patch
> 
>  ...re-safe-exiting-internalEntityParser.patch | 53 +++++++++++++++++++
>  package/expat/expat.mk                        |  3 ++
>  2 files changed, 56 insertions(+)
>  create mode 100644 package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
> 
> diff --git a/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch b/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
> new file mode 100644
> index 0000000000..ca86e85115
> --- /dev/null
> +++ b/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
> @@ -0,0 +1,53 @@
> +From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 2001
> +From: Rhodri James <rhodri@wildebeest.org.uk>
> +Date: Wed, 17 Aug 2022 18:26:18 +0100
> +Subject: [PATCH] Ensure raw tagnames are safe exiting internalEntityParser
> +
> +It is possible to concoct a situation in which parsing is
> +suspended while substituting in an internal entity, so that
> +XML_ResumeParser directly uses internalEntityProcessor as
> +its processor.  If the subsequent parse includes some unclosed
> +tags, this will return without calling storeRawNames to ensure
> +that the raw versions of the tag names are stored in memory other
> +than the parse buffer itself.  If the parse buffer is then changed
> +or reallocated (for example if processing a file line by line),
> +badness will ensue.
> +
> +This patch ensures storeRawNames is always called when needed
> +after calling doContent.  The earlier call do doContent does
> +not need the same protection; it only deals with entity
> +substitution, which cannot leave unbalanced tags, and in any
> +case the raw names will be pointing into the stored entity
> +value not the parse buffer.
> +
> +[Retrieved from:
> +https://github.com/libexpat/libexpat/commit/4a32da87e931ba54393d465bb77c40b5c33d343b]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + expat/lib/xmlparse.c | 13 +++++++++----
> + 1 file changed, 9 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 7bcabf7f4..d73f419cf 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5826,10 +5826,15 @@ internalEntityProcessor(XML_Parser parser, const char *s, const char *end,
> +   {
> +     parser->m_processor = contentProcessor;
> +     /* see externalEntityContentProcessor vs contentProcessor */
> +-    return doContent(parser, parser->m_parentParser ? 1 : 0, parser->m_encoding,
> +-                     s, end, nextPtr,
> +-                     (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> +-                     XML_ACCOUNT_DIRECT);
> ++    result = doContent(parser, parser->m_parentParser ? 1 : 0,
> ++                       parser->m_encoding, s, end, nextPtr,
> ++                       (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> ++                       XML_ACCOUNT_DIRECT);
> ++    if (result == XML_ERROR_NONE) {
> ++      if (! storeRawNames(parser))
> ++        return XML_ERROR_NO_MEMORY;
> ++    }
> ++    return result;
> +   }
> + }
> + 
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index e89de81da7..61735a5fdb 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -13,6 +13,9 @@ EXPAT_LICENSE_FILES = COPYING
>  EXPAT_CPE_ID_VENDOR = libexpat_project
>  EXPAT_CPE_ID_PRODUCT = libexpat
>  
> +# 0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
> +EXPAT_IGNORE_CVES += CVE-2022-40674
> +
>  EXPAT_CONF_OPTS = \
>  	--without-docbook --without-examples --without-tests --without-xmlwf
>  HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests
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
