Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3633FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 12:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBA2409E8;
	Sun, 19 Jun 2022 12:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADBA2409E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vOspbIjgV1v; Sun, 19 Jun 2022 12:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54927409A7;
	Sun, 19 Jun 2022 12:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54927409A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE8D1BF2E4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28C8581460
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28C8581460
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMz96VdIbXY6 for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 12:32:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0431581453
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0431581453
 for <buildroot@busybox.net>; Sun, 19 Jun 2022 12:32:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AEFD01BF204;
 Sun, 19 Jun 2022 12:32:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o2u6X-006ERZ-AQ; Sun, 19 Jun 2022 14:32:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
References: <Yq2BgE6StduAjH5Z@einstein.dilieto.eu>
Date: Sun, 19 Jun 2022 14:32:37 +0200
In-Reply-To: <Yq2BgE6StduAjH5Z@einstein.dilieto.eu> (Nicola Di Lieto's message
 of "Sat, 18 Jun 2022 09:40:48 +0200")
Message-ID: <87pmj4u93u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uacme: allow ualpn with mbedTLS
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Nicola" == Nicola Di Lieto <nicola.dilieto@gmail.com> writes:

 > Following the update to mbedTLS 2.28.0 in commit 0f8aab08, ualpn can
 > work with mbedTLS without restrictions.

 > References
 > https://git.buildroot.net/buildroot/commit?id=96c3b52132b41716ca445b4c73a1a8886c26e5ee
 > https://github.com/ndilieto/uacme/issues/23#issuecomment-1043409796
 > https://github.com/ndilieto/uacme/commit/bbee626cf5f60908f064c123f7a9622639348c3d
 > https://github.com/Mbed-TLS/mbedtls/pull/3243

 > Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
 > ---
 >   package/uacme/Config.in | 4 ----
 >   1 file changed, 4 deletions(-)

 > diff --git a/package/uacme/Config.in b/package/uacme/Config.in
 > index d693436115..58b7c534e7 100644
 > --- a/package/uacme/Config.in
 > +++ b/package/uacme/Config.in
 > @@ -19,7 +19,6 @@ if BR2_PACKAGE_UACME
 >   config BR2_PACKAGE_UACME_UALPN
 >   	bool "enable ualpn"
 >   	depends on BR2_TOOLCHAIN_HAS_THREADS
 > -	depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS
 >   	select BR2_PACKAGE_LIBEV
 >   	help
 >   	  Build and install ualpn, the transparent proxying tls-alpn-01

Strangely enough your patch is white space damaged by an extra space in
column 2 inside each hunk, so I had to manually fix that up to be able
to apply the patch.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
