Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53427C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D028460EA4;
	Mon,  3 Jul 2023 20:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D028460EA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFFbcl6X_0zW; Mon,  3 Jul 2023 20:16:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB2C60E87;
	Mon,  3 Jul 2023 20:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB2C60E87
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBADF1BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B34FE40981
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B34FE40981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4VqPH7MJtcrB for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:16:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89BA3405CE
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89BA3405CE
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:16:15 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.103.145])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GPy0qYTaIDAUdGPy0qxKsa; Mon, 03 Jul 2023 22:16:12 +0200
Message-ID: <4b2a4210-9670-7d31-2ba4-245460f05196@benettiengineering.com>
Date: Mon, 3 Jul 2023 22:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
 <20230703215926.69c0f67e@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230703215926.69c0f67e@windsurf>
X-CMAE-Envelope: MS4xfM0gbGnV+X6JPW3FegIsFcUCGPQyahFJ3LN+RV8oRFb+KcHoAyxYDYId58Vu4TAKsugEhQOnK0Q6w7hc4sdYVA5uP2PFpN/HlP2nVm+InGxJfI3mYyhJ
 gwQgptd3nLY6gLZ8A8Ai7laR5CzmJKm+rUL8cIvTsfa+XmhvxP26KBRKSt9EOx86DLc6Afw0VHE9HNL+15+BIoo5ltclVlTC+aCLYEEuGQEqcuAMVxcNfBsx
 qAvD2kSc+KqMsmckhzV9ZA4/H0T7RFFGZfnHe3xb5EGGxz10Ka7n3viqsT3Xdviy8uaCQmdLjRE7cu5kpfXpcg8B5kHNwbAqG+pdu717NG4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1688415372; bh=cZFhCsjLi00ZubFqvxq1pCVQMs7QOREscPxC/qtyUFA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=KZz/LPiL3ckpS4IoSWuhXTD+MxK1Nh5N/wqZ+qLvfa0yRorOtweWOIWq1e1pxvIfX
 k1WUXtxmCS1JYmP0ErKQ/SYDgQ7rUmDe63I50P5lWW2dkwe12RWBk0mvALZzrRTxKf
 gpNtOXhJF8gPPArkLt/4eMxrWJP0i5/lrMad5seLvnnKhS6P3b7mMHPsYX+jN6IP00
 aqxI1+HSeC2A2RPVeHawvbwLQIvWLTGpTgK+69Ly23utjYw8YAue0K7OtpYZwBGHlL
 svItu4INs5iRoFo4O4LCudKRRwVN5emBzLEYWEvpHzE/s3HxeOWljvfTbtzmtSrjNq
 5XzVZjA2yJSVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=KZz/LPiL
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to version
 2023-06-23
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/07/23 21:59, Thomas Petazzoni wrote:
> On Mon,  3 Jul 2023 21:16:15 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> It now supports building with Linux version > 6.1
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/rtl8192eu/rtl8192eu.hash | 2 +-
>>   package/rtl8192eu/rtl8192eu.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> This patch doesn't apply cleanly on the current master. Are you sure
> it's based on master?

Pardon, there was another patch pending that now I reject and send a V2
of this one.

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
