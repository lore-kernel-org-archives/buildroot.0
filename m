Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B557CC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84C0540784;
	Fri,  2 May 2025 10:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2w9xX6iy8XM1; Fri,  2 May 2025 10:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA32C407BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA32C407BB;
	Fri,  2 May 2025 10:52:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A556AEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97208420F6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJhSqcFHWt9n for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:52:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 418D540E21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 418D540E21
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 418D540E21
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D6AB81C0D57; Fri,  2 May 2025 12:52:05 +0200 (CEST)
Message-ID: <4276f356-52b2-460d-83c0-a70bde9e47aa@rnout.be>
Date: Fri, 2 May 2025 12:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20250418143730.23712-2-dalang@gmx.at>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250418143730.23712-2-dalang@gmx.at>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183126; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ku/gpJK+OK545J9GLG2PLwdUwyhDa4oDzn7fW5fuczY=;
 b=ZdcyP7hPIAOieqa97k34jT43ZuQu5FHNZD1y4xZ6KLXenV81grE3OusitrlRw1jbr5WytM
 kBnD4llD6zk6QOAaTQVS48rO1SDTUIlFyIU35Eti93L2i+hkfAL7D0m7+6neoTqByZp+HT
 +mRVhEZ7gnm+adDJWNkZYFa50G6AMzaa9HWdLm2i0aT74SueguWRLLkqZ39oLXoAZyEt1f
 6vyKT5PaMgSQSxgoAvfvkfjj4olHt/V4BzTuqyckLv5pdOdB/4U5yeoHL4E2I5+DrhxPi5
 AXxBA64jSaNW1pmF7sUwn1h856bif6LQN+6Bjzb9KcXGfwu7U9f7+p7fjC5w+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ZdcyP7hP
Subject: Re: [Buildroot] [PATCH] package/dbus-cxx: bump to version 2.5.2
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



On 18/04/2025 16:37, Daniel Lang via buildroot wrote:
> https://github.com/dbus-cxx/dbus-cxx/releases/tag/2.5.2
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/dbus-cxx/dbus-cxx.hash | 2 +-
>   package/dbus-cxx/dbus-cxx.mk   | 9 ++++++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
> index 4ed9d73bac..56dfcbae82 100644
> --- a/package/dbus-cxx/dbus-cxx.hash
> +++ b/package/dbus-cxx/dbus-cxx.hash
> @@ -1,5 +1,5 @@
>   # Locally computed:
> -sha256  c38456ed70023d93e6e689087e4bbe030f1650bbda9de7c035d6f4ebac788379  dbus-cxx-2.4.0.tar.gz
> +sha256  a739a29efc9ad42ba6518b38e13bb44c12947d4f7503d211c12823233e277987  dbus-cxx-2.5.2.tar.gz
>   sha256  99e5d0ad951d96567a6f9a17f3f17ac000c0582f53357c7f3601851c2dcbb786  COPYING
>   sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
>   sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
> diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
> index 8e2b4f70fa..e6aae036bb 100644
> --- a/package/dbus-cxx/dbus-cxx.mk
> +++ b/package/dbus-cxx/dbus-cxx.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DBUS_CXX_VERSION = 2.4.0
> +DBUS_CXX_VERSION = 2.5.2
>   DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
>   DBUS_CXX_LICENSE = LGPL-3.0+ or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
>   DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
> @@ -25,4 +25,11 @@ else
>   DBUS_CXX_CONF_OPTS += -DENABLE_GLIB_SUPPORT=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBUV),y)
> +DBUS_CXX_CONF_OPTS += -DENABLE_UV_SUPPORT=ON
> +DBUS_CXX_DEPENDENCIES += libuv
> +else
> +DBUS_CXX_CONF_OPTS += -DENABLE_UV_SUPPORT=OFF
> +endif
> +
>   $(eval $(cmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
