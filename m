Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11078D10F58
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 14:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C383160A82;
	Wed, 26 Nov 2025 14:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Obul0HUjajS; Wed, 26 Nov 2025 14:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F223D61488
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F223D61488;
	Wed, 26 Nov 2025 14:58:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B848335E
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E3716146C
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrSUwHgp6dNy for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 14:58:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 944F261478
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 944F261478
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 944F261478
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:58:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 14BB61A1D7D
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 14:58:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DFBB960721;
 Wed, 26 Nov 2025 14:58:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 38ABD102F0DB1; Wed, 26 Nov 2025 15:58:23 +0100 (CET)
Message-ID: <5aea32f6-f00c-465c-bb07-b03816c726a2@bootlin.com>
Date: Wed, 26 Nov 2025 15:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
References: <20251126-rasdaemon-v1-0-38c590f3e591@bootlin.com>
 <20251126-rasdaemon-v1-2-38c590f3e591@bootlin.com>
 <20251126120055.6dd94e90@windsurf>
Content-Language: en-US
In-Reply-To: <20251126120055.6dd94e90@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764169103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=EBMVFNS1Q8pAcXGiYqXcW8AAK/crUsZpxliNJSLcim0=;
 b=m0tpzAIWJBltQiavb7e05AC7I/Zq6W6HOldB9vuAxZPKIAIE0KoJnUngwkMdHXun9MMFaO
 2WCnBSNTIgSjfJwqZwhtoqfK9vyVdqjQJ1Dniya3QTJAAemQyn32P8NhylgpVfK2kK2t1d
 6rYY/tcMigKetor78szuKeLwXSjihWRyU5L2U9XOtYunfvXb6u504UM2a3hXdvHeCdqkRr
 o3ZG5YvAwqpf23DGYnxVUsnH7sqrSz8X4SOBdUZe+Ym0CvXp2mwQk4DKFDzd5lhOQNyb0I
 bUrXW2pAFX0ZFDjX9crj9oyYgcy0dxLFfjpyb83E1PLxT8Okg8YTWwPeM1i2Dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=m0tpzAIW
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: add rasdaemon tests
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 11/26/25 12:00 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 26 Nov 2025 11:20:10 +0100
> Bastien Curutchet <bastien.curutchet@bootlin.com> wrote:
> 
>> +class TestRasdaemon(infra.basetest.BRTest):
>> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>> +        """
>> +        BR2_PACKAGE_RASDAEMON=y
>> +        BR2_PACKAGE_RASDAEMON_AER=y
>> +        BR2_PACKAGE_LIBTRACEEVENT=y
>> +        BR2_PACKAGE_SQLITE=y
>> +        BR2_PACKAGE_PCIUTILS=y
>> +        BR2_TARGET_ROOTFS_CPIO=y
>> +        # BR2_TARGET_ROOTFS_TAR is not set
>> +        """
>> +
>> +    def test_run(self):
>> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
>> +        self.emulator.boot(arch="armv7",
>> +                           kernel="builtin",
>> +                           options=["-initrd", cpio_file])
>> +        self.emulator.login()
>> +
>> +        self.assertRunOk("/usr/sbin/rasdaemon --version")
> 
> 
> Since it installs an init script, what about checking that the daemon
> is actually running?
> 
> Bonus point if you're actually able to inject an error, and verify that
> rasdaemon reacts to it by running some arbitrary action :-)
> 

I'll do my best to get that bonus point :)


Best regards,
Bastien
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
