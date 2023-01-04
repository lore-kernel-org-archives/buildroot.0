Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EA4C53210
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 22:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EF4E40907;
	Wed,  4 Jan 2023 22:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EF4E40907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jz-J3EnBfTh9; Wed,  4 Jan 2023 22:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26914408D5;
	Wed,  4 Jan 2023 22:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26914408D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E69B1BF3A3
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29F014016C
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F014016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9XwiQv0u5Zc6 for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 22:04:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08BD6400C0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08BD6400C0
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 22:04:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C21911C000C;
 Wed,  4 Jan 2023 22:04:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pDBsV-005AzL-N1; Wed, 04 Jan 2023 23:04:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
 <20230101233653.487175-19-ricardo.martincoski@gmail.com>
Date: Wed, 04 Jan 2023 23:04:55 +0100
In-Reply-To: <20230101233653.487175-19-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 1 Jan 2023 20:36:42 -0300")
Message-ID: <87ilhmt0qg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 18/29] package/libtalloc: drop bogus
 LIBTALLOC_{C, LD}FLAGS
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Commit "f0d37e275a package/libtalloc: new package" added these symbols
 > but they are not used in the package and also not recognized by the waf
 > package infra.

 > So drop the ignored symbols.

 > Cc: David GOUARIN <dgouarin@gmail.com>
 > Cc: Matt Weber <matthew.weber@collins.com>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > ---
 > build test:
 > 44 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
 > https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/731863771

 > test-pkg config:
 > BR2_PACKAGE_LIBTIRPC=y
 > BR2_PACKAGE_LIBTALLOC=y
 > ---
 >  package/libtalloc/libtalloc.mk | 2 --
 >  1 file changed, 2 deletions(-)

 > diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
 > index 75d3da263b..ca15180d22 100644
 > --- a/package/libtalloc/libtalloc.mk
 > +++ b/package/libtalloc/libtalloc.mk
 > @@ -31,8 +31,6 @@ LIBTALLOC_CONF_OPTS += --cross-compile \
 >  		--with-libiconv=$(STAGING_DIR)/usr
 
 >  ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 > -LIBTALLOC_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 > -LIBTALLOC_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 >  LIBTALLOC_DEPENDENCIES += libtirpc host-pkgconf

I wonder if host-pkgconf is then needed?

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
