Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACED7C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 15:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3118A4190F;
	Wed, 21 Dec 2022 15:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3118A4190F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sefTP7_0S-r9; Wed, 21 Dec 2022 15:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DC7441908;
	Wed, 21 Dec 2022 15:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC7441908
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DE691BF232
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 15:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7815641908
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 15:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7815641908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZefqhEkVwt_J for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 15:41:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E764D418D9
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E764D418D9
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 15:41:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5288010000D;
 Wed, 21 Dec 2022 15:41:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p81Dw-0025yG-7E; Wed, 21 Dec 2022 16:41:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221208110247.7002c3ca@c3po> <20221211163758.GU1044805@scaer>
Date: Wed, 21 Dec 2022 16:41:40 +0100
In-Reply-To: <20221211163758.GU1044805@scaer> (Yann E. MORIN's message of
 "Sun, 11 Dec 2022 17:37:58 +0100")
Message-ID: <871qosrcgb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: exclude unsupported
 targets
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
Cc: Danilo Bargen <mail@dbrgn.ch>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Danilo, All,
 > On 2022-12-08 11:02 +0100, Danilo Bargen spake thusly:
 >> Not all target architectures are supported by the "ring" dependency.
 >> 
 >> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
 >> ---
 >> package/tealdeer/Config.in | 8 ++++++++
 >> 1 file changed, 8 insertions(+)
 >> 
 >> diff --git a/package/tealdeer/Config.in b/package/tealdeer/Config.in
 >> index 96ed81614b..a61a59f3ee 100644
 >> --- a/package/tealdeer/Config.in
 >> +++ b/package/tealdeer/Config.in
 >> @@ -1,6 +1,14 @@
 >> config BR2_PACKAGE_TEALDEER
 >> bool "tealdeer"
 >> depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 >> +    # Crypto dependency (ring) not available for mips:
 >> https://github.com/briansmith/ring/issues/562
 >> +    depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
 >> +    # Crypto dependency (ring) not available for PowerPC:
 >> https://github.com/briansmith/ring/issues/389
 >> +    depends on !(BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le)
 >> +    # Crypto dependency (ring) not available for Sparc:
 >> https://github.com/briansmith/ring/issues/1512
 >> +    depends on !(BR2_sparc || BR2_sparc64)
 >> +    # Crypto dependency (ring) not available for s390x:
 >> https://github.com/briansmith/ring/commit/4d2e1a8fb80398f7c3c0137ea8fdd512f82d37a0
 >> +    depends on !BR2_s390x

 > As Thomas already noted, this patch is badly broken.

 > I've massaged into back into something that looks nicer, and applied to
 > master, after simplifying the comment and moving the references to the
 > commit log.

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
