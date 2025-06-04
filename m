Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC3BC5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 13:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB4EC83E6E;
	Wed,  4 Jun 2025 13:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icALyimfdJFe; Wed,  4 Jun 2025 13:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2501283ED6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2501283ED6;
	Wed,  4 Jun 2025 13:33:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C13CBDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 13:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B31C3419CC
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 13:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGfLs5B_d-6T for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 13:33:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A951D4199A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A951D4199A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A951D4199A
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 13:33:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1C31439F7;
 Wed,  4 Jun 2025 13:33:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uMoFO-00GF0d-0b;
 Wed, 04 Jun 2025 15:33:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  linux-amarula@amarulasolutions.com
References: <20250604101253.4177079-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 04 Jun 2025 15:33:38 +0200
In-Reply-To: <20250604101253.4177079-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Wed, 4 Jun 2025 12:12:53 +0200")
Message-ID: <8734cfhbrh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfedvudejheelffduvddvlefftefhkeekjedujeehhfduleekgeeltefgleeftdejnecuffhomhgrihhnpehsohhurhgtvghfohhrghgvrdhnvghtpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegurghrihhordgsihhnrggttghhihesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghmrghruhhlrgesrghmr
 ghruhhlrghsohhluhhtihhonhhsrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 14.4.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > Release notes:
 > https://arma.sourceforge.net/docs.html#changelog

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

> ---
 >  package/armadillo/armadillo.hash | 2 +-
 >  package/armadillo/armadillo.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
 > index 61ed4d85283d..0dff217335dc 100644
 > --- a/package/armadillo/armadillo.hash
 > +++ b/package/armadillo/armadillo.hash
 > @@ -1,4 +1,4 @@
 >  # Locally computed:
 > -sha256  6dfddcfbd91e70679d7c11e94a5963a7efda002fec351e6f4875ac8e245c5117  armadillo-14.4.2.tar.xz
 > +sha256  c3aadd59bdb0ea4339b056f29972f92ee19fdc52f68eb78d32d2e4caf4d80c3a  armadillo-14.4.3.tar.xz
 >  # License files, locally calculated
 >  sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
 > diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
 > index 3ebec29cf3b6..259aff1251ea 100644
 > --- a/package/armadillo/armadillo.mk
 > +++ b/package/armadillo/armadillo.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -ARMADILLO_VERSION = 14.4.2
 > +ARMADILLO_VERSION = 14.4.3
 >  ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 >  ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 >  ARMADILLO_INSTALL_STAGING = YES
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
