Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055D2C001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 12:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65DC482157;
	Fri, 28 Jul 2023 12:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65DC482157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rX6TbNIfOMcE; Fri, 28 Jul 2023 12:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA008204D;
	Fri, 28 Jul 2023 12:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA008204D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5A21BF302
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 12:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB1E8420A6
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 12:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB1E8420A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nAyLIbwkuVWk for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 12:23:51 +0000 (UTC)
Received: from server1.sm-technologies.co.uk (server1.sm-technologies.co.uk
 [109.74.199.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A118420AA
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 12:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A118420AA
Received: from localhost (localhost [127.0.0.1])
 by server1.sm-technologies.co.uk (Postfix) with ESMTP id ED1DC9A2F2;
 Fri, 28 Jul 2023 13:23:48 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at server1.sm-technologies.co.uk
Received: from server1.sm-technologies.co.uk ([127.0.0.1])
 by localhost (server1.sm-technologies.co.uk [127.0.0.1]) (amavisd-new,
 port 10026)
 with LMTP id 5E7lFd-wkjNH; Fri, 28 Jul 2023 13:23:46 +0100 (BST)
Received: from [192.168.0.200] (139.171.6.51.dyn.plus.net [51.6.171.139])
 (Authenticated sender: danny@rotronics.co.uk)
 by server1.sm-technologies.co.uk (Postfix) with ESMTPSA id 957819A2EB;
 Fri, 28 Jul 2023 13:23:46 +0100 (BST)
Content-Type: multipart/mixed; boundary="------------4QhjvS0kV3B0uwRfLGvfVW9D"
Message-ID: <32ea713a-e571-4f83-c0a4-a9b4995db5ba@rotronics.co.uk>
Date: Fri, 28 Jul 2023 13:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230728101140.10998-1-danny@rotronics.co.uk>
 <20230728121819.73bd742d@windsurf>
From: Danny Wood <danny@rotronics.co.uk>
In-Reply-To: <20230728121819.73bd742d@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=rotronics.co.uk; s=mail; t=1690547028;
 bh=BWotpjolpwZtoTD4dDwEFvxUmv27j6xRt2kBlZ6Ej3E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Pk21KdMNwJVEjF3C7pgTQ6NCTXMX1RNr7G4UcP8E/mwkvJjN09zqGa1+7tWkPW4Ss
 24g1apfgBQV1I2XFT+vgubeXmQlPrvsZ7fCbBmKzuik9vGxwSl5Zcn4rltAj+0BBA3
 SO8aR+22DjwxydAFQZQrhXEx9fZw3OeIP4BpsPc8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=rotronics.co.uk; s=mail; t=1690547026;
 bh=BWotpjolpwZtoTD4dDwEFvxUmv27j6xRt2kBlZ6Ej3E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xgdhGkeHGl0sqqgCSDpNtfsCrUQrZLm2fk/8PxMOEqRe7dawOpVkdVYg1Csayr6Kv
 zGDFkndbIXr4CWrPUKNuRqDn8JjCblE9AJk9blEAC3B5Mba/fK0lhhE8rpGPrlnlGk
 UK4itAQ7nhaIZezWFAA2q+8icfGDf2fP7haVfsJA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=rotronics.co.uk header.i=@rotronics.co.uk
 header.a=rsa-sha256 header.s=mail header.b=Pk21KdMN; 
 dkim=pass (1024-bit key) header.d=rotronics.co.uk header.i=@rotronics.co.uk
 header.a=rsa-sha256 header.s=mail header.b=xgdhGkeH
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: add optional systemd
 dependency
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------4QhjvS0kV3B0uwRfLGvfVW9D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2023 11:18, Thomas Petazzoni wrote:
> Hello Danny,
>
> On Fri, 28 Jul 2023 11:11:40 +0100
> Danny Wood <danny@rotronics.co.uk> wrote:
>
>> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>> +MARIADB_DEPENDENCIES += systemd
>> +endif
> Thanks for the patch. Is there some CMake option to explicitly
> enable/disable systemd support in mariadb? If yes, we will want to use
> them.
>
> Thanks!
>
> Thomas
Yes there is.

I have updated my patch which is attached.

Thanks,
Danny
--------------4QhjvS0kV3B0uwRfLGvfVW9D
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-package-mariadb-add-optional-systemd-dependency.patch"
Content-Disposition: attachment;
 filename*0="0001-package-mariadb-add-optional-systemd-dependency.patch"
Content-Transfer-Encoding: base64

RnJvbSBkMDA4MTMzYjliZjdmZDIzN2ZmYjAxZmY4NDA0ZDk0ODgyZjY1NTRlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBEYW5ueSBXb29kIDxkYW5ueUByb3Ryb25pY3MuY28u
dWs+CkRhdGU6IFRodSwgMjcgSnVsIDIwMjMgMTY6NTI6NTQgKzAxMDAKU3ViamVjdDogW1BB
VENIIDEvMV0gcGFja2FnZS9tYXJpYWRiOiBhZGQgb3B0aW9uYWwgc3lzdGVtZCBkZXBlbmRl
bmN5CgpJZiBzeXN0ZW1kIGlzIHVzZWQgd2Ugc2hvdWxkIGVuYWJsZSBzdXBwb3J0IGluIG1h
cmlhZGIgYW5kIGVuYWJsZQoiVHlwZT1ub3RpZnkiIGluIHRoZSBteXNxbGQuc2VydmljZSB1
bml0IGZpbGUKCiJUeXBlPW5vdGlmeSIgc3RvcHMgc3lzdGVtZCBmcm9tIHN0YXJ0aW5nIHNl
cnZpY2VzIHdoaWNoIGRlcGVuZCBvbiBtYXJpYWRiCnVudGlsIGl0IGhhcyBub3RpZmllZCBz
eXN0ZW1kIHRoYXQgaXQgaGFzIGZpbmlzaGVkIHN0YXJ0aW5nIHVwLCB0aGlzIGhlbHBzCmF2
b2lkIHN0YXJ0dXAgcmFjZSBjb25kaXRpb25zCgpTaWduZWQtb2ZmLWJ5OiBEYW5ueSBXb29k
IDxkYW5ueUByb3Ryb25pY3MuY28udWs+Ci0tLQogcGFja2FnZS9tYXJpYWRiL21hcmlhZGIu
bWsgICAgIHwgNyArKysrKysrCiBwYWNrYWdlL21hcmlhZGIvbXlzcWxkLnNlcnZpY2UgfCAy
ICsrCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbWFyaWFkYi9tYXJpYWRiLm1rIGIvcGFja2FnZS9tYXJpYWRiL21hcmlhZGIubWsK
aW5kZXggYTI3MDE2NDNlMS4uNzhlNDcwM2VlZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9tYXJp
YWRiL21hcmlhZGIubWsKKysrIGIvcGFja2FnZS9tYXJpYWRiL21hcmlhZGIubWsKQEAgLTcy
LDYgKzcyLDEzIEBAIE1BUklBREJfQ09ORl9PUFRTICs9IFwKIAktRExJQlJFU1NMX1JFU1VM
VF9fVFJZUlVOX09VVFBVVD0iTGlicmVTU0wgJChMSUJSRVNTTF9WRVJTSU9OKSIKIGVuZGlm
CiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfU1lTVEVNRCkseSkKK01BUklBREJfREVQRU5ERU5D
SUVTICs9IHN5c3RlbWQKK01BUklBREJfQ09ORl9PUFRTICs9IC1EV0lUSF9TWVNURU1EPXll
cworZWxzZQorTUFSSUFEQl9DT05GX09QVFMgKz0gLURXSVRIX1NZU1RFTUQ9bm8KK2VuZGlm
CisKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTUFSSUFEQl9TRVJWRVIpLHkpCiBpZmVxICgkKEJS
Ml9QQUNLQUdFX01BUklBREJfU0VSVkVSX0VNQkVEREVEKSx5KQogTUFSSUFEQl9DT05GX09Q
VFMgKz0gLURXSVRIX0VNQkVEREVEX1NFUlZFUj1PTgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9t
YXJpYWRiL215c3FsZC5zZXJ2aWNlIGIvcGFja2FnZS9tYXJpYWRiL215c3FsZC5zZXJ2aWNl
CmluZGV4IDUzNzQzMGU5YTIuLjk0MzNlMTQ2MzAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWFy
aWFkYi9teXNxbGQuc2VydmljZQorKysgYi9wYWNrYWdlL21hcmlhZGIvbXlzcWxkLnNlcnZp
Y2UKQEAgLTksNiArOSw4IEBAIFJlc3RhcnQ9YWx3YXlzCiBVc2VyPW15c3FsCiBSdW50aW1l
RGlyZWN0b3J5PW15c3FsCiBSdW50aW1lRGlyZWN0b3J5TW9kZT0wNzU1CitUeXBlPW5vdGlm
eQorTm90aWZ5QWNjZXNzPWFsbAogCiBbSW5zdGFsbF0KIFdhbnRlZEJ5PW11bHRpLXVzZXIu
dGFyZ2V0Ci0tIAoyLjQxLjAKCg==

--------------4QhjvS0kV3B0uwRfLGvfVW9D
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------4QhjvS0kV3B0uwRfLGvfVW9D--
