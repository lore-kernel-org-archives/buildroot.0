Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E6FD41C35
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 10:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A7E380DC7;
	Wed, 13 Nov 2024 10:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-Z7Hy-iC3nn; Wed, 13 Nov 2024 10:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B01D780F69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B01D780F69;
	Wed, 13 Nov 2024 10:54:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA2E4E2E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 10:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5C26404FE
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 10:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbfyjLWW7ZgK for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 10:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1071640471
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1071640471
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1071640471
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 10:54:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.140]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTABT-1tM0dc1PbT-00TEb7 for
 <buildroot@buildroot.org>; Wed, 13 Nov 2024 11:54:15 +0100
Message-ID: <1af29766-5cfd-47a5-adb5-d90ff42dd095@gmx.de>
Date: Wed, 13 Nov 2024 11:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE-1901, de-DE
To: Buildroot ML <buildroot@buildroot.org>
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
X-Provags-ID: V03:K1:rwjvADuCFaq4Ur82X4Xd5AVCpqaZr+q322DFuPEA7H3kDhVajTQ
 /Krl1EOBEoWwUp06KISdjk8UF+7niijv9KUpQsJaygIwDSALrcq/pkBQLnnRSOlmUYFhHOb
 4IJZFuOZc+FGwYxfW9b+V318XrEtC0GjiIpSDNpE2THPS23C8wI2waD3LvQOX1XIQSZgv0s
 0JSguyBJtUGn8x/NRoJTg==
UI-OutboundReport: notjunk:1;M01:P0:kTefLoHuUUw=;jYJlvNrb0UIVC5zp5YRuozSx+4U
 C/nyLZogom5iEFB5ZXKI3JiLMKGv7e8qfgX2rByVki2EINAJfST9VJINpOTg18kW6JKyxNcW2
 wZdnsihgE574XaFek6hYl7zuY38zzzSl9suIVXYpq9V6jMHqdzb5AJxWic5oGT8fMj4OfGTba
 LtGWGyoKEVM46172iAIAqNqoN4uOSYOmQoB7EPyvp/9DjPD0f6W8uIm5GHV3VU06+qnV/wc84
 jzIDxKrTZncQvfxLmwwaE7Ednj0eiuG2/FfwUv7BnryxWGr7S2dEMd2Al6pUFLuEn0wnA1p8V
 U8ubHsRIOUedLPI6TrlTTdBmRyZTKpnAqYZylNeAdvdXvjmf7/M8MSlX862Jc2G20FaEt6ISE
 fKVUYZ2KreZulgJeBaSJj77R4XUAUnuoFrYtHCF1ASizfcgbIT1LGdxEtUTZd8JctgBGK6XWq
 gPqCSDtO/fzcEQ/gnUuk8jAUxP3ohpRmNpUvzN7ez/HDhcqGwPSTiHT/5sib1ZlOkilau9HG0
 ZwBjIU04MREDZdFVTz3v11ADd29+WfiT+cMMprxB5qJgRgQZNGA+uk2TZvm30tJH67icmi7zI
 6zruKyxALj8jq+y3b8tehYFJv0MkmI/cB2Jl9uoYBIIpBSU5CKP8fcYfg9abeieFBMsg92Q3n
 am9UHYgdM+aLmw4GKCTVgUDMUeJA6pwRupEBivf1kBi4+p9AiIm4vVB7/FbRUiHPQ/2+Hbqfo
 J+70lW+m80DXWNlt0oXjSSeiuou8VLzzodRBZFQGuEeLMrQEn/qrv5wtiQH2ogK2oxLr1LmN9
 LWJZjqQEjgIzHkEMs1qMezWHMDwC/doaJf81zJaLtyLlaBjG8x0IThR0c9i5HXAVDNAtNXhsn
 U3elFrt3uRuT/J4KIXVYtnYQglGPqHGVMlC0N0O+IsClxxe/hSnbzXb73
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1731495255; x=1732100055; i=fiona.klute@gmx.de;
 bh=vabtQ+HJVkqM26q7AhFcZFp/8YhwwnV4MMDWWLk/8Jk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
 Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PIEt5dTdzHlYX/sQFdOEMsSyhj2shXoL32v+2CoqeqndsDVxwKjDRt1rIMPeMVYd
 /7p1bPMVW+tvtMjnlEED42pSoVW6i3pWa/mPhxrsSavc338zHKIUklSNTX4RLlc36
 D2HjMoLMfL0ZHb57YZ4A4YCUnSHVuT7tvTLftpXCxWMHEwEsxb7VnQL2eTdHWzgVk
 AHN08f9rn45OlC6calH7LeVGffP+/x68IuMTtM5e6TV+JRDDx23NfEQzUwULj+I9S
 gdIMfpB9D7Vex5+WuwqFPIILMUlYGlqtNhZ4nsXqmlxLrASqeB0jijXyc8BMQGvm9
 FJ44IHrRRDhP2g5/6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=PIEt5dTd
Subject: [Buildroot] Consistency check for UID/GID tables
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

Hi everyone,

as pointed out in the documentation [1] autogenerated UIDs/GIDs might
cause issues if they change during updates, so one should set stable
UIDs/GIDs for users/groups owning files.

I'd like to create a consistency check, to make sure that any files in
the generated image will be owned by users/groups with fixed UIDs/GIDs.

Am I right that the following files in the output dir would be the ones
to consider, or am I missing something?

build/buildroot-fs/full_users_table.txt
build/buildroot-fs/full_devices_table.txt
target/etc/passwd
target/etc/group

The target passwd/group files are on the list because /var/www is set to
be owned by 33:33 (www-data:www-data), which is defined in the skeleton
passwd/group files and not using makeusers.

Of course I'll want to supplement that with a runtime check, but the
image should be consistent to start with.

Finally, would such a check script/target be interesting for Buildroot
in general?

Best regards,
Fiona


[1] https://nightly.buildroot.org/#_caveat_with_automatic_uids_and_gids

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
