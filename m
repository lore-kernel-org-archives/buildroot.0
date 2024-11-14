Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1B1D65C7E
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 11:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6952D60BB0;
	Thu, 14 Nov 2024 11:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIBtt-pL-9v4; Thu, 14 Nov 2024 11:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5934260BB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5934260BB1;
	Thu, 14 Nov 2024 11:50:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D20A0BF
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 11:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C056660BB2
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 11:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBxgJlv2NmPn for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 11:50:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3902F60BB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3902F60BB0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3902F60BB0
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 11:50:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.123.212]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmjw-1tN0Oh1JwQ-00ORPv; Thu, 14
 Nov 2024 12:50:17 +0100
Message-ID: <b25d0a28-cc5c-451a-a719-e932f1fa1aaa@gmx.de>
Date: Thu, 14 Nov 2024 12:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>,
 Buildroot ML <buildroot@buildroot.org>
References: <1af29766-5cfd-47a5-adb5-d90ff42dd095@gmx.de>
 <e3e6612f-a9dd-45a6-89eb-9165788c5b8b@green-communications.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <e3e6612f-a9dd-45a6-89eb-9165788c5b8b@green-communications.fr>
X-Provags-ID: V03:K1:jFX6l49If2et2KqueTlVblghbxYXKXGdPy2A++Wmbmffpbt/brc
 WFvWq+kEyWbjz6SCzQrSjWB8gsGNNvbO5EQthB/a2x+YzYv5VGlvTyJvwTg3L87WAX0WgUD
 CtJftSRv8xAD7598R6sUaL4pNBPcYTSuhdV7Rd5lAaitLdCS7mC7R5JzQlDkdu8EidAcubI
 wCj7Qx39/o++dQgUXv3uA==
UI-OutboundReport: notjunk:1;M01:P0:794g6jPylhM=;zunlPxs5pdx0QYLubeeZ23dDc4B
 zGl90y3zDNI+0uBt5CJone+U2dDzRhs8zjHbjQpW1TGcqzkqv3pwsA1c2ccVhaC1+kbwAioPS
 A/YWGbEKF3Q77ppk3laCbYDcFQMTdWWhTnxS9nvhXFyi0SLchvXteP83f2Ia94VWZiiC91615
 SOZlsfTWsQHCAY2KBLg1x0YZTwhdwcdmc55qEGsv3BLEK1L/J5LgdI1UIt0SNSrWcJddnd8Lf
 HrB7dCnQFKNYa1VFRo1oi4Lp7ppR6JCdxATadNUXr3ZTD+ORrLcO7PNTNPE2IsT6DR5/Ee+FD
 V/p85lJN/7oxecJcAfXWJg70gMrGw9RzooxE29mzY+2mHXhws9pFTd4Xuy9oeoJTx5bW3iSle
 nkHoTZpgR9VeOeizXdq29B6Y3KniOXYN0IhuhmM9tqF9SVHno6NlfidC+/KXub11+aMHjhj7z
 GWO1QVT9ed4YgaDuy4EteUUQ8qk/v+yR+bOaonbB0+IfECGfzwYgwcK+lZmvv0UH8rYKp4p1x
 UQ/QvB4PXqu4SPMYjZ8cKeGFkOu5Wpr8n3kzvFtxAsLy/6oUaxlPxPKZrMGzu54Y2ZcR9A2Ht
 x+Q3ffSgzGtHEUP6ANav98YkWwcqz6KCemISqJDz37NeFmKRrYKrwJEPh7tX44ycRkNriI7Bt
 ktemWSypq2O4/1XBybBk06+uiP21/DliuhSqjH7SZiXIa8pbhsKrigVrOc4i9tZwYErrXbf+6
 E/fBOefUjOQSEtr50d3uu9onOCuhAVhG/7QQ1Qfvy0J+4vNz63IqhbEUTmht56Lxu4MNhPLb0
 rlGgBm+J9039FMbLEqzdg1ARPhW6kTNQCjGb5uN5vPWcvp6v6DExIrjynof31mbJH6BvzipY0
 Du5mah39wsuM/BUThUuWkK91+A0MjssVRpwguZL1xvN50i3TXKFwbtvsP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1731585017; x=1732189817; i=fiona.klute@gmx.de;
 bh=AJ3KNHfrwMb+T8GFc1KfdBCILJD5tY+Z0PL6yucj2VQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Db7rezvqg/4EuhKqO3Ehqv8pfFL9sJ/mshpy/HzaETamADlaPfzpwdiyORB+I2h9
 /Jr/CuwGX6bqyYkAXheTtCJ/U66/m3wxj7KP4GCpHVlDtzRzWr9KLNYKDTcCi+8F1
 FbJmY4Kad9ZFP/3Q3otT8Hy5NcjOUpXtq+i7BTqjznoh2AJJ9EoSzCrNPhD0Jkk92
 2rYFAp8V8nHmgVRIQw5KxVvSu7VO/5ef4VSyctZ2ter69VG3JCk0kuufazUE7N9oT
 PcIjIUcvJTBDzKGAWfrWaKhVKTkhUOhrX3VWUMJyzUgTVdH1sTd9IzEVqvMJfpdk7
 ohK7eLlq98Y6UcDQVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Db7rezvq
Subject: Re: [Buildroot] Consistency check for UID/GID tables
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 14.11.24 um 09:35 schrieb Nicolas Cavallari:
> On 13/11/2024 11:54, Fiona Klute via buildroot wrote:
>> Hi everyone,
>>
>> as pointed out in the documentation [1] autogenerated UIDs/GIDs might
>> cause issues if they change during updates, so one should set stable
>> UIDs/GIDs for users/groups owning files.
>>
>> I'd like to create a consistency check, to make sure that any files in
>> the generated image will be owned by users/groups with fixed UIDs/GIDs.
>
> Isn't fixing the UID/GID of users enough ? Since Buildroot typically
> uses usernames to define permissions, making sure users never change
> their ids is enough, as long as user names don't change. If the username
> changes, we can probably assume that it is intentional.

By "consistency check" I mean to verify that exactly the expected
users/groups exist, with the expected UIDs/GIDs as applicable, and that
there are no files owned by an undefined user. I want to do this
automatically (as part of the build) to ensure that nothing is missed,
including on updates or changes to the config.

My system uses a squashfs image that's updated as a whole, with an
overlay for /etc. /etc/passwd and /etc/group will be changed, at the
very least to create an individual user account. So any changes to
defined system users/groups need to be recreated as a system is updated
in the field. This includes users/groups that don't own files, if e.g. a
service added in an update tries to switch to a user that doesn't exist
that'd cause errors.

In short: I want to be automatically notified by the build if my
BR2_ROOTFS_USERS_TABLES needs to be adjusted to ensure stable UIDs/GIDs,
as well as users/groups on existing systems on update (before actually
rolling it out).

> The only problem with this is that makeusers is fairly limited. We
> cannot specify "set the uid of this existing user" or "add this existing
> user to a new group" without overriding all other fields for that user.
> I have a local patch to work around that, but it's incomplete and I
> don't think upstream is interested.
>
> It would also help to be able to forbid the automatic UID generation and
> fail the build when it would be required. But the last patch submission
> that could do this was rejected.

A patch to makeusers, or to Buildroot?

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
