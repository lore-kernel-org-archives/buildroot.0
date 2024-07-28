Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C862EC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 07:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88696605A9;
	Sun, 28 Jul 2024 07:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8mrVuRzblPR; Sun, 28 Jul 2024 07:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A16A9605BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A16A9605BA;
	Sun, 28 Jul 2024 07:26:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E93621BF32E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E38EB400E0
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjtzs_YvSlf2 for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 07:26:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1B5E40042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1B5E40042
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1B5E40042
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 07:26:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D4501C0003;
 Sun, 28 Jul 2024 07:26:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sXyIO-0021x6-0S;
 Sun, 28 Jul 2024 09:26:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240624224958.309140-1-ju.o@free.fr>
Date: Sun, 28 Jul 2024 09:26:20 +0200
In-Reply-To: <20240624224958.309140-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 25 Jun 2024 00:49:58 +0200")
Message-ID: <875xsqx9ib.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add kmod runtime test
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 >  DEVELOPERS                                    |  2 +
 >  support/testing/tests/package/test_kmod.py    | 97 +++++++++++++++++++
 >  .../test_kmod/linux-virtio-net.fragment       |  1 +
 >  3 files changed, 100 insertions(+)
 >  create mode 100644 support/testing/tests/package/test_kmod.py
 >  create mode 100644 support/testing/tests/package/test_kmod/linux-virtio-net.fragment

[snip]

 > +
 > +        # Get module info with modinfo.
 > +        out, ret = self.emulator.run("modinfo virtio-net")
 > +        self.assertEqual(ret, 0)
 > +        lsmod_out = "\n".join(out)
 > +        self.assertRegex(lsmod_out, r'name: *virtio_net')
 > +        self.assertRegex(lsmod_out, r'description: *Virtio network driver')

NIT: modinfo_out would probably be a better name.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
