Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0783FC64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 07:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91CFE409AC;
	Tue, 28 Feb 2023 07:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91CFE409AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vfmwQRkYNnX8; Tue, 28 Feb 2023 07:19:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AF10409DD;
	Tue, 28 Feb 2023 07:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AF10409DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75F131BF2F5
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48E2C8143C
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48E2C8143C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNMIdrdJy1Od for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 07:19:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC7E08141E
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC7E08141E
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 07:19:32 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 7ADA65C152A;
 Tue, 28 Feb 2023 08:19:29 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 28 Feb 2023 08:19:28 +0100
From: Stefan Agner <stefan@agner.ch>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230221094329.79cf0b8e@windsurf>
References: <29cebb7af48c3652e440c61cc90fafa4fe3f8046.1676300324.git.stefan@agner.ch>
 <20230221094329.79cf0b8e@windsurf>
Message-ID: <d2a08914978878c0ab118649a4a65715@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1677568769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqE4AJHIagTx9YY2lRDPyBycZo1aqMYNuU3DosTwFzA=;
 b=ipeVWExAgglMdatt9jpAOCn1X6lKh0ekGx+Bw+CsRs3f1r3KEOhHa/NiTng+9914dq+H2C
 LIEgjxVk1KCjH8V45gsP2rDwkdfRBje46h4bkEJt9jt2N1TzB01oc0/HsPKpMtLdBi7Gm5
 wZZFXOD0Dt44x3/re2kf7uOXcL6D1GQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=ipeVWExA
Subject: Re: [Buildroot] [PATCH v2] package/dbus-broker: bump to release 33
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
Cc: Norbert Lange <nolange79@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-02-21 09:43, Thomas Petazzoni wrote:
> Hello Stefan,
> 
> On Mon, 13 Feb 2023 15:58:57 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> This release contains mostly a bugfixes, with some improvements around
>> error handling for unimplemented functionality and resiliency against
>> runtime changes of dbus service-files.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> Thanks a lot for the update. However see below for a comment.
> 
>> ---
>>  package/dbus-broker/dbus-broker.hash | 6 +++---
>>  package/dbus-broker/dbus-broker.mk   | 2 +-
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
>> index f6c2cbe160..06c8f229b7 100644
>> --- a/package/dbus-broker/dbus-broker.hash
>> +++ b/package/dbus-broker/dbus-broker.hash
>> @@ -1,5 +1,5 @@
>>  # Locally calculated
>> -sha256  bea7f653e7251063c5f427e9e3f93562d38a0d8667ae6d49fb56f113605985de  dbus-broker-32.tar.xz
>> +sha256  23713f25624749fdb274907e429080fa2d8f4dbe76acd87bb6d21a3c818c7841  dbus-broker-33.tar.xz
>>  sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
>>  sha256  20ea1f96abc15553695c6725bb3dcabff4b43b85b7ca7d675a2b8860e3b01f87  subprojects/libcdvar-1/AUTHORS
>>  sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md
>> @@ -11,7 +11,7 @@ sha256  23f24eeaaded5fedd6e7840b6f7b73838f9a4e2112ad6a12fe1ef958f73d0214  subpro
>>  sha256  05113a24aca4c537819dd0d91b95b13edb85bea4b6a77a6d9269becb397ed374  subprojects/libcrbtree-3/README.md
>>  sha256  6d63b1fb794d4c02622595ad30357c90398aa883864e5a275479139c8f03208f  subprojects/libcshquote-1/AUTHORS
>>  sha256  cad109dd33062518a437ebee145ba863fe0e047d4e3db9c28b0bf3c6148f10c2  subprojects/libcshquote-1/README.md
>> -sha256  32913ba08dc041f3f4ca361fc0d68014120e1c612772aabbcc901556df499ce5  subprojects/libcstdaux-1/AUTHORS
>> -sha256  7c4b6c325b0bc02150089112f65132ee999b0f44500b73d1fc06d96c93161037  subprojects/libcstdaux-1/README.md
>> +sha256  e796182869fe0892347d069f3f423774124987d6c45d016854fc51530633c177  subprojects/libcstdaux-1/AUTHORS
>> +sha256  92006886d7f28894fef08bf97e35ef52147067bd3c4d4d6381da7c59f9901dae  subprojects/libcstdaux-1/README.md
> 
> When there are changes in the license files, we need to have a short
> explanation in the commit log about these. Indeed, if we simply
> "blindly" update the hashes, then having those hashes in the first
> place is completely useless: the whole point of having hashes for
> license files is to detect changes in the license files, analyze them
> and justify if they require or not a change in how the licensing of the
> package is described in Buildroot.

Sure that makes sense. I checked license and posted a summary in a email
response to v1. I missed adding this to the commit message.

Will do and resend v3.

--
Stefan

> 
> Could you resend with an updated commit message that explain the
> changes in the license files? Even if they are minimal/trivial, having
> this explanation in the commit log will help the reviewers/maintainers
> to make sure the changes in those license files have been verified.
> 
> Thanks a lot!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
