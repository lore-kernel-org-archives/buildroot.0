Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA10AC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 21:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9DE360B79;
	Tue,  6 Feb 2024 21:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HU3PRsJXeyin; Tue,  6 Feb 2024 21:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D044D60FD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D044D60FD6;
	Tue,  6 Feb 2024 21:07:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08D991BF400
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8CC942064
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ow3DMRdNyyw for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 21:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D4B34206A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4B34206A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D4B34206A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 21:07:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43C4FE0004;
 Tue,  6 Feb 2024 21:07:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXSef-00EEG3-2X;
 Tue, 06 Feb 2024 22:06:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240127223838.274418-1-ju.o@free.fr>
Date: Tue, 06 Feb 2024 22:06:52 +0100
In-Reply-To: <20240127223838.274418-1-ju.o@free.fr> (Julien Olivain's message
 of "Sat, 27 Jan 2024 23:38:38 +0100")
Message-ID: <87zfwd480j.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add mdadm runtime test
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
 >  DEVELOPERS                                    |   2 +
 >  support/testing/tests/package/test_mdadm.py   | 138 ++++++++++++++++++
 >  .../package/test_mdadm/linux-mdadm.fragment   |   3 +
 >  3 files changed, 143 insertions(+)
 >  create mode 100644 support/testing/tests/package/test_mdadm.py
 >  create mode 100644 support/testing/tests/package/test_mdadm/linux-mdadm.fragment

..

 > +
 > +        # We add back this blank drive to the array.
 > +        self.assertRunOk(f"mdadm {md_dev} --add {failing_dev}")
 > +
 > +        # We wait few seconds to let the device rebuild.
 > +        time.sleep(3)
 > +
 > +        # The array should no longer be marked as degraded.
 > +        out, ret = self.emulator.run(monitor_cmd)
 > +        self.assertEqual(ret, 0)
 > +        self.assertNotIn("DegradedArray", "\n".join(out))


That hard coded 3s is likely to cause problems on gitlab as the runners
can be quite slow. How about reworking this to to check every few
seconds for up to E.G. 30s if it has gotten out of the DegradedArray
state?

That can be done later though - So committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
