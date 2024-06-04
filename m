Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B0C25B7E
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 06:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7B760A7C;
	Tue,  4 Jun 2024 06:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXSLl6PDuM13; Tue,  4 Jun 2024 06:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88EC36101A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88EC36101A;
	Tue,  4 Jun 2024 06:16:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 239FB1BF2FF
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 06:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E777843F1
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 06:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hiun7D-DP2hF for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 06:16:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BC4484406
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BC4484406
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BC4484406
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 06:16:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFB7420007;
 Tue,  4 Jun 2024 06:16:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sENSt-005JSX-11;
 Tue, 04 Jun 2024 08:16:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20240603200025.1246055-1-giulio.benetti@benettiengineering.com>
Date: Tue, 04 Jun 2024 08:16:11 +0200
In-Reply-To: <20240603200025.1246055-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Mon, 3 Jun 2024 22:00:25 +0200")
Message-ID: <87wmn5fd1w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/esp-hosted: fix build failure on
 Linux 6.8.12+
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Add local patch pending upstream to fix build failure due to old Linux
 > Bluetooth API.

 > Fixes:
 > http://autobuild.buildroot.net/results/d64fa083ec27c3684d4186d2b1b05e041ad330f5/
 > http://autobuild.buildroot.net/results/5c4fac191970444e63109a762023c0e60f9693e2/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 V1-> V2:
 > * add missing Upstream tag in local patch
 > ---
 >  ...x-Bluetooth-build-failure-on-Linux-6.patch | 37 +++++++++++++++++++
 >  1 file changed, 37 insertions(+)
 >  create mode 100644 package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch

 > diff --git a/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch b/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
 > new file mode 100644
 > index 0000000000..c701aaa82f
 > --- /dev/null
 > +++ b/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
 > @@ -0,0 +1,37 @@
 > +From f8903bc2be7ae5ac9fb9bbeed8512e974c6e60ec Mon Sep 17 00:00:00 2001
 > +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > +Date: Mon, 3 Jun 2024 21:53:38 +0200
 > +Subject: [PATCH] esp_hosted_ng: Fix Bluetooth build failure on Linux 6.8.11+
 > +
 > +After Linux commit:
 > +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=84a4bb6548a29326564f0e659fb8064503ecc1c7
 > +BT_HS has been removed and consequently AMP controllers can't be created,
 > +so at this point only HCI_PRIMARY has been left as unique controller type
 > +to be created and this became implicit with no need to define if the
 > +controller if HCI_PRIMARY or HCI_AMP. So let's assign HCI_PRIMARY up to
 > +Linux 6.8.11 only preventing build failure.
 > +
 > +Upstream: https://github.com/espressif/esp-hosted/pull/400
 > +
 > +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > +---
 > + esp_hosted_ng/host/esp_bt.c | 2 ++
 > + 1 file changed, 2 insertions(+)
 > +
 > +diff --git a/esp_hosted_ng/host/esp_bt.c b/esp_hosted_ng/host/esp_bt.c
 > +index 3b78c11698..4598ac0e0a 100644
 > +--- a/esp_hosted_ng/host/esp_bt.c
 > ++++ b/esp_hosted_ng/host/esp_bt.c
 > +@@ -240,7 +240,9 @@ int esp_init_bt(struct esp_adapter *adapter)
 > + 	hdev->set_bdaddr = esp_bt_set_bdaddr;
 > + #endif
 > + 
 > ++#if (LINUX_VERSION_CODE <= KERNEL_VERSION(6, 8, 11))
 > + 	hdev->dev_type = HCI_PRIMARY;
 > ++#endif

It would be more robust to make this conditionally on if HCI_PRIMARY is
defined in case this ever gets backported to earlier stable kernels, but
OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
