Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16539C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 10:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85F95402A6;
	Wed, 30 Aug 2023 10:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85F95402A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejDxcvQoTukd; Wed, 30 Aug 2023 10:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9986C40222;
	Wed, 30 Aug 2023 10:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9986C40222
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59A421BF2B1
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 10:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32CDB82284
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 10:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32CDB82284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3-3NEMk6s1x for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 10:38:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 522748227D
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 10:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 522748227D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F9F740008;
 Wed, 30 Aug 2023 10:38:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbIab-0002HB-Il; Wed, 30 Aug 2023 12:38:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20230612165344.3829304-1-giulio.benetti@benettiengineering.com>
Date: Wed, 30 Aug 2023 12:38:21 +0200
In-Reply-To: <20230612165344.3829304-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Mon, 12 Jun 2023 18:53:44 +0200")
Message-ID: <87zg28rf1e.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: en/disable runtime debug
 according to BR2_ENABLE_RUNTIME_DEBUG
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  package/rtl8189fs/rtl8189fs.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
 > index dd35a166e5..6b0585073b 100644
 > --- a/package/rtl8189fs/rtl8189fs.mk
 > +++ b/package/rtl8189fs/rtl8189fs.mk
 > @@ -13,6 +13,10 @@ RTL8189FS_MODULE_MAKE_OPTS = \
 >  	KVER=$(LINUX_VERSION_PROBED) \
 >  	KSRC=$(LINUX_DIR)
 
 > +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
 > +RTL8189FS_MODULE_MAKE_OPTS += CONFIG_RTW_DEBUG=n
 > +endif
 > +

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
