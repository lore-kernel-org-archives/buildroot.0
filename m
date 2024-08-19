Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122A5C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 07:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C3B600CD;
	Mon, 19 Aug 2024 07:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRDyrYSip1UB; Mon, 19 Aug 2024 07:11:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 518A6605CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 518A6605CF;
	Mon, 19 Aug 2024 07:11:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B79531BF3EB
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 07:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4B9C401AF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 07:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buLCiR6D-xIf for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 07:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAB504016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAB504016B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAB504016B
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 07:11:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03105C0006;
 Mon, 19 Aug 2024 07:11:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sfwYH-009Zbs-0v;
 Mon, 19 Aug 2024 09:11:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Markus Mayer <mmayer@broadcom.com>
References: <20240817000027.654079-1-mmayer@broadcom.com>
 <20240817121031.55afa6c1@windsurf> <87le0th808.fsf@dell.be.48ers.dk>
 <CAGt4E5t-csHham0e-xuhhXj-sq8fn6qd3ZbOyrutf3uNHgqKKA@mail.gmail.com>
Date: Mon, 19 Aug 2024 09:11:41 +0200
In-Reply-To: <CAGt4E5t-csHham0e-xuhhXj-sq8fn6qd3ZbOyrutf3uNHgqKKA@mail.gmail.com>
 (Markus Mayer's message of "Sun, 18 Aug 2024 15:31:42 -0700")
Message-ID: <87h6bhgf6a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/dropbear: provide config option to
 turn off SHA1 for RSA
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Markus Mayer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Markus" == Markus Mayer <mmayer@broadcom.com> writes:

Hi,

 >> I think it makes most sense to do it like you suggest, but drop the
 >> default y so it behaves similar to BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO.

 > Hm. What about backward compatibility regarding _RSA_SHA1? Our default
 > would change while dropbear's default hasn't changed (yet).

I don't think this is a big concern. Like you say, any update of
Buildroot could bring different behaviour of a package (caused by an
upstream change or by us), and as dropbear has stated that they will
disable RSA_SHA1 by default in a future release it would be odd for us
to have the opposite behaviour (on by default).


 > Also consider the following discrepancy. The legacy crypto features
 > are disabled by default in dropbear and a user has to turn them on
 > manually. _LEGACY_CRYPTO matches this behaviour (off by default, needs
 > to be enabled manually), so it all makes logical sense and works well.
 > Whether someone builds dropbear with Buildroot or without, the legacy
 > crypto functions have to be turned on manually.

 > However, the situation with _RSA_SHA1 is reversed. The feature is
 > enabled by default in dropbear and a user has to manually turn it off.
 > If we model _RSA_SHA1 after _LEGACY_CRYPTO, on the one hand it is nice
 > and consistent on the Buildroot side. On the other hand, it behaves
 > opposite to what dropbear is doing. Buildroot would require the user
 > to take action to receive the default dropbear behaviour (_RSA_SHA1
 > would need to be enabled explicitly because it would default to
 > "unset"). This is the opposite experience than someone building
 > dropbear without Buildroot.

True. It also somewhat depends on how fine grained configuration options
we want, E.G. we could also simply handle the RSA_SHA1 option under the
LEGACY_CRYPTO option WHEN upstream disables it by default, but then we
have to wait for that.

Looking elsewhere, I see that openwrt handles it with a "modern only"
option to only enable modern/secure options, maybe that is a way to go?

https://github.com/openwrt/openwrt/commit/bf900e02c7102601be2e9280231711e70f065877

Related to RSA_SHA1, I believe the original reason for you sending this
patch was to disable everything related to SHA1, but SHA1 is also used
for HMAC and key exchange, so we should consider disabling those as
well:

https://github.com/openwrt/openwrt/commit/2d9a0be307b534ceb717267c95402d1d707cd2c3

What do you say?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
