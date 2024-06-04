Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2ECC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 10:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ABFA61204;
	Tue,  4 Jun 2024 10:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBpmYf2oa9q2; Tue,  4 Jun 2024 10:48:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2275F61207
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2275F61207;
	Tue,  4 Jun 2024 10:48:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44AE21BF863
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 10:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCE3140052
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 10:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MT3uFK9fDjqG for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 10:48:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C8D3409E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C8D3409E4
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C8D3409E4
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 10:48:24 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ERiHsPKGy9WDgERiHsefM0; Tue, 04 Jun 2024 12:48:21 +0200
Message-ID: <64d16992-68a4-4781-85e5-28338045b526@benettiengineering.com>
Date: Tue, 4 Jun 2024 12:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
References: <20240603200025.1246055-1-giulio.benetti@benettiengineering.com>
 <87wmn5fd1w.fsf@dell.be.48ers.dk>
Content-Language: it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <87wmn5fd1w.fsf@dell.be.48ers.dk>
X-CMAE-Envelope: MS4xfPXoHg9JgHprk9el2xcNAp4XO+eyp/3hDloSki8BQXrKUP7ISpRF4mGa035RIVET09vTG/9BuACftn1e0kX63ativ2Q17uVgm5gvlM1JSVtku4obtOdw
 B57OcNwY8fjUG+QeTF6A3IzjSEw3bGswvyQouuzA9mYGF37nYK71wfSv3UUU7diBMXFjjgg9pUjt8/k8jbFqisZ1skn9OibSLEcEhmnuewCoCdfjQgnx4E1F
 lhTj5uHiCRF95X27XeQI1g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1717498101; bh=d5JgmWA0ETlyRR0vQ8wlt1s8exjdy7d7RcmrzDYUE1E=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=b8SZS6TTuMJBwNriJEzk5wmswQvDc21h90Z9rRiQ3A3jS39NvXDYDsG7YFk4H8p6e
 1VLW1e8LVOKpbkBQRgnrv8AbTQVWmqhvahH7iHa4fVBfsBzPkBnFtKWiFxB2ZsgcJv
 lAcRM4+Oxc8VnjAIyqgjOZZPB7YNFqrShh2YXasHblAZe4jl6/orQvaAsAur8J1NPQ
 axuQs7icdqsiu9U2XTDK/ycx0oI8KK+GyDxADkoZ3ZVlm1kLjZY5/G/sjuBXSbcTcq
 sw5wGkwDLpePbo9LjL6rQMZe8cC8scR4+AREIEdDaLCc6V6c7R4b5k8sAq5sJRJ5uR
 YUUBDaNqjC16g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=b8SZS6TT
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 04/06/24 08:16, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > Add local patch pending upstream to fix build failure due to old Linux
>   > Bluetooth API.
> 
>   > Fixes:
>   > http://autobuild.buildroot.net/results/d64fa083ec27c3684d4186d2b1b05e041ad330f5/
>   > http://autobuild.buildroot.net/results/5c4fac191970444e63109a762023c0e60f9693e2/
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>   > ---
>   V1-> V2:
>   > * add missing Upstream tag in local patch
>   > ---
>   >  ...x-Bluetooth-build-failure-on-Linux-6.patch | 37 +++++++++++++++++++
>   >  1 file changed, 37 insertions(+)
>   >  create mode 100644 package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
> 
>   > diff --git a/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch b/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
>   > new file mode 100644
>   > index 0000000000..c701aaa82f
>   > --- /dev/null
>   > +++ b/package/esp-hosted/0002-esp_hosted_ng-Fix-Bluetooth-build-failure-on-Linux-6.patch
>   > @@ -0,0 +1,37 @@
>   > +From f8903bc2be7ae5ac9fb9bbeed8512e974c6e60ec Mon Sep 17 00:00:00 2001
>   > +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>   > +Date: Mon, 3 Jun 2024 21:53:38 +0200
>   > +Subject: [PATCH] esp_hosted_ng: Fix Bluetooth build failure on Linux 6.8.11+
>   > +
>   > +After Linux commit:
>   > +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=84a4bb6548a29326564f0e659fb8064503ecc1c7
>   > +BT_HS has been removed and consequently AMP controllers can't be created,
>   > +so at this point only HCI_PRIMARY has been left as unique controller type
>   > +to be created and this became implicit with no need to define if the
>   > +controller if HCI_PRIMARY or HCI_AMP. So let's assign HCI_PRIMARY up to
>   > +Linux 6.8.11 only preventing build failure.
>   > +
>   > +Upstream: https://github.com/espressif/esp-hosted/pull/400
>   > +
>   > +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>   > +---
>   > + esp_hosted_ng/host/esp_bt.c | 2 ++
>   > + 1 file changed, 2 insertions(+)
>   > +
>   > +diff --git a/esp_hosted_ng/host/esp_bt.c b/esp_hosted_ng/host/esp_bt.c
>   > +index 3b78c11698..4598ac0e0a 100644
>   > +--- a/esp_hosted_ng/host/esp_bt.c
>   > ++++ b/esp_hosted_ng/host/esp_bt.c
>   > +@@ -240,7 +240,9 @@ int esp_init_bt(struct esp_adapter *adapter)
>   > + 	hdev->set_bdaddr = esp_bt_set_bdaddr;
>   > + #endif
>   > +
>   > ++#if (LINUX_VERSION_CODE <= KERNEL_VERSION(6, 8, 11))
>   > + 	hdev->dev_type = HCI_PRIMARY;
>   > ++#endif
> 
> It would be more robust to make this conditionally on if HCI_PRIMARY is
> defined in case this ever gets backported to earlier stable kernels,

This is a good idea and upstream still have to merge. I've checked and 
HCI_PRIMARY has been defined during Linux commit 
ca8bee5dde1f02c2dbe8c8453dce27f2dfafb21c as a rename of HCI_BREDR(Linux 
4.8-rc1).
So I should deal with HCI_BREDR too, something like:

#ifdef HCI_PRIMARY
	hdev->dev_type = HCI_PRIMARY;
#endif
#ifdef HCI_BREDR
	hdev->dev_type = HCI_BREDR;
#endif

or even better:
compat.h:
#ifdef HCI_BREDR
#define HCI_PRIMARY HCI_BREDR
#endif

.c:
#ifdef HCI_PRIMARY
	hdev->dev_type = HCI_PRIMARY;
#endif

Yes, this would cover earlier Linux versions and they are interested in 
very early versions as stated here:
https://github.com/espressif/esp-hosted/pull/358#issuecomment-2031117798

So I'm going to rework for upstream, so once merged I bump here in 
Buildroot and drop this local patch.

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
