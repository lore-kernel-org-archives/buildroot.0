Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC70C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 12:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC6981426;
	Mon, 19 May 2025 12:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnRr_mFM7Zgg; Mon, 19 May 2025 12:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52DB2813EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52DB2813EA;
	Mon, 19 May 2025 12:24:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB7B2193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD2FD60FBA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TH8kBpiSiqx for <buildroot@buildroot.org>;
 Mon, 19 May 2025 12:24:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A319660F8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A319660F8E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A319660F8E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:24:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.126.193]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1v2kbS18OB-012aHP; Mon, 19
 May 2025 14:23:53 +0200
Message-ID: <edfdcc44-495f-445c-b48b-11f281cf2cd1@gmx.de>
Date: Mon, 19 May 2025 14:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
 <20250516133236.16e5aa23@windsurf>
 <4f3b7a04-418b-4563-b556-60c5d6f2c34b@gmx.de>
 <20250516165051.3f20224d@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250516165051.3f20224d@windsurf>
X-Provags-ID: V03:K1:GeP8hkXLXsiHRs0BDjgAXqX0F4uxxMjLBp6RYKQITYjA8OtJXtK
 HeKiWiGAkUjbZtwHIYpTiYA0/wdcHrw+5NFcIv9VEHhd0pG9vJ5ubhInuCr5zpMZkNhSe9P
 DZx4raQWuxafXdgP3Pm2RJF4qZB5aXHLx2FgDwnhgUCEqoWos1ud9sDh7M0USQhFJXB5La+
 DfdG494m3IINEXaTUtq5g==
UI-OutboundReport: notjunk:1;M01:P0:JvjBIU3CoYw=;WmCwQVew9ozlHqv4B1qYeMI7yOh
 5VGaYsXgnodPh3xNL4eQIxzDcZAB3JbccM6lzhSnn3dcIEWQHxqBZN5VP0O8KQuRxDoDJxY4x
 JXlCk2ZrLmz0lGHQmWFdInCPFyY7EYP/XDSdQWHpv6kNbKBObc+aYtfdS6im3madWTfCgAKv4
 8/azpXLxnLjA1EWiG7fBCpC2LDjaO5m97LQchpvQp/SsoiQEbBwdNVNaEcWPQLgBQv3dkVPjl
 8/TKHmpkc78mlJuoLUODkDVkZ3kSv4RcZprwDTIY6FuE8RAlefi5PC7nrg/i1O/TWRIKBIhid
 pIPMWBkZCmyXWVHZ2jKxdKSZkqmRAQUwTylwqkSImm+N5LLEfIiC/+M9hXNanm2CLxg9LKuSl
 jynXMWQi9TCCkDZQLmQuQMEkWOPJgMNJ0/q7TT9n2gHPxQDOYNqnus7N6uYPmcmYUefg1RqOk
 szwnfWxDr6mfXRYLOhwwCxh3b90M50w3b/p2LXHxsePhOPZluXd1/23Z20teVezwbMtac8S91
 Sb3DaBba6MrNw6sFKn7phUe1Ya6s5b6Y9kRnvm4pGvg0oq4ZpfHhGJi0ntCA44pJtCn56xyae
 zhYEOhFpys2CS5CJUQgWEzoyk0MX0xcQ0EbOXlOfhItItU7IA0JMsWyz0n3DE1BFbo15tpi3H
 rnj3j8/rY02AwIaHJRN2Vmup3oMQHvQ3IhywGeL5fB9J3cAgidSOfRgKZK//ISqvG6PpZSYKN
 /iGA4EXi3nLGaw7zhKHv9rp35xr43LDsEkaKT2CiFm8Nlzif5ADZoy6rPXgNXTjGzm4jk95Mc
 q4WxLI3Ale5qKY7hvpju1CO98o6bd9Rt0+5jbVIz5rdQeaAHQL9wQhft3IMjUfYpWlXTTW7NA
 Ll+5c8B9TpGuqb7zqU3eQfJQeUTLTvknWUm0nBuMNvhKJplKXVTGn9ZdLfAQOA+JilEt82xaC
 gYEz+AJ2G+T8RYoJAo9U/mcKAXn/NsPj3TnLM67qAqQb6rPvhmxPN+DfIGM1zhOHGG47ArL4p
 KEH1+6lGUxFrXlI6iShJ2YfIRpbnTPSgiuWt/+FW8OEzXtMvIWAfrGpRw327gC0Ud+STCJjxM
 xMEMQ3xbMJE89gk5Knrku6SXe2jbwmwD8NJr9+mXVRTdi7TeOVDvvQzSVJy/linLGBoZaO+iJ
 6X8ZjqSpP2oKgOAJxCqEOzyZr2o1OH3rcqK1K85XA1S25rqek9NlK2IM8NqiQjODGhnlMsqL5
 s5ZsmvDWqybq7qB93FF/Of3YKjO+nCJQZNCswemDQ5Jr3QgJxdjT+R0fhnI3GlVIlHdXM1V8E
 FfmcxBW50BKw0F7S3A0QK2DFIkuDB+ngxLv3eEya3+PL4fAxa+K/HX3DdDNviGZwbF2XkKbDb
 jp/UytqGapbQkmiAOCWHMX1gQq66MwUipzZy/Abyo8Y3ZYTwWuZYv26/mc3VRkGG2/Kk5sT3J
 xluWiYuHcHDizvlr8PRwwwSVCHm3FDyGbYaHXzmF3sMDZB8Y+WtlvM1lSePqFsrtuuM8Z5A4j
 9EZXBk6Bn+pPliZPFVodx09tt8xThXMXVrXT6PKMH/FnuRqimLIVyv8mbeda45dah++aiXI7L
 ZYOin1hlYkfONk6P6eLgvYZl3bxAC5EEVSVqDQK+B0gZN0R5tc5O9k+Z9OTYftLgS87VgQ6Yw
 mgRFcLpeyV9ux7FKv8fFusmuHswuZoJ9jDXZ9ur63adecSei43kcH3DfWkNfnrx1/KZwtuQeL
 Dn/G/t7rKnU5peTy1wHw2mgaPSsdkC/B5ewmcPvuisMlbiauAR8/qlukn1D35bGz1pdE4FhTB
 Zl0Cri78LxbPGDGv6iqRLyho2H0cXqRhA7ZAAUAJdmTOv5dSae7Doxv/bve/iyqVclxx1B68E
 ElwpV4eR3qcaQc8bkj99X9sUh9iYQUI+TJXHDNGgGS/i7ndHqcCeoPBe79YdBjEAAQ0GSyOvi
 V6zrraQr2cZwVPco86QUMUIG+AIOD16VprHoa1diJXrgR4f6fB1pjsk8cpTIPnqy6J3imRq1i
 6G94xm1nS0B24AP+9+SgyHhtKXrNCfNIcw0S05hODZ7GOgSs8EpkfgkBealKOAsWaHiQN/b2G
 KBvgY56aV2j45+5vStYkggv2CbOozAdDuGls3Ks2g01IMmdedmLjmOb6jUkFV1ooMCJVGi38x
 cGF91PaTMv1xCrVqNyCdjMTtTaCfDjxd7bBeDzu3SUPt50XOEPWGmsoj8kC19rwRzw5TVqiuN
 Yl26bcV4C3sOKi6CowQjdpcsQZGK/KaYqUH+/RAZ77SM6H+5AKSfCPq3oMS8Zf+DTmnTW46jp
 j+1s3IQTHSHI+ELLD7IUpAuOgSSSvxnHW9og+2xpDLtChMkzhH9d6o7N3/ANyU1LWIvjhg1Zb
 QdEsqpF0iFW6+tZr+nn6X6DUlqNhFolvh/reUPXrpW+F+rr3jKKBu8lhJEusEv+2QM/YhlzA2
 iUu+p2uEfppjLe9+ByC5+mihXGVWB0EpvXfAEizX1uxu/3HePYNUqaS4kLheHl0o0zTGhIHt/
 kIkKCoek+Km8YFNiFOXgbgGzhvzC0O5KqBTBeTbX9AfY7XJyzy3Enaoz6d0aG+O3sDAFuexhd
 Grdamn97D4hjxDgQUks7J4gJHzXIkktxMuWlUHHQmcR7ISV+VFeefnNU6jtVSACZMa7rucRdU
 vHwmqzuze7KDdgnvrLjcJEaFAnPudWIV1kc7LVcFtj/6aeCYQMaB928Zc5/2SCrdkqD6uHQzb
 JJ+1ACYrlofYkT6H9pwlYc2wJ4vb57VrGG9ZYGR+W690f0uvHjBe8ZEVidC/GXFUgSfW/IKOR
 OJy/OnZNqPRzOK2PZ14ZYaZns4hV05Tk7IVAyi1N0y+XdiB7C/bDDxc6iRClfvZqnrb27b+wz
 faXglre1fCpMzmqkMuTf3Fiofl3J2O1fOqZslo2mYjQ1bKtC3Gw0/lsG9bQWzleI+Kdc19bvI
 ynbIiKycKqW7WiI5D/t4xoYdqlKZ7jiLEKytEPleAgNz715G4bEgG5/7/ePe85lqQXmeCEr9S
 Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747657433; x=1748262233; i=fiona.klute@gmx.de;
 bh=PJh32sItqoZt6jS6sVxInUqFTErAjuZr+eBuLqXI40o=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lUvE/xKKjLxNej/mLVAmCVT1M3zCr33p76xDCbeaKJFTRWbC3ftyU82n43QxYbUe
 HmIOOfCsrfc4gES5UuCw/fxYagGsETQU1iVp4DlUsiG8aAuzvCvNVun+zgxMpUEEK
 fysk3Is7ZKXAY5+oLpOGAV6zjrFHFYrIrWBss8prm340WW6iFSQyXpv/hcF56m9l/
 ljlahWgP6qbnvS84AGHvez0wCOyeqxXKxcYIB3jMAHhA6bwRhhHMh3ePxQOS9ykLG
 VA33uYpPd+2T8ql47/Q3eZyjYi1pjy/E1qXdHQYDPAM2mlYXZO6nLrTU8+1sScoP5
 JD2ChXyTndn6sK0HKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=lUvE/xKK
Subject: Re: [Buildroot] [PATCH 0/4] package/rust: rust upgrade to version
 1.86.0
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

Am 16.05.25 um 16:50 schrieb Thomas Petazzoni:
> On Fri, 16 May 2025 15:40:00 +0200
> Fiona Klute <fiona.klute@gmx.de> wrote:
> 
>> it seems my patch to replace deprecated the .cargo/config [1] that was
>> discussed in that thread [2] has been missed. Is there any chance to
>> still squeeze it in? The problem is that if applied separately it'll
>> need a separate version bump for the generated cargo archives, but I'm
>> not sure if that's avoidable now (as the changes have been pushed
>> already). :-(
> 
> Dang, I missed that! Let's see what we can do about this, I'll discuss
> with the other maintainers.
Thanks for getting that sorted! :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
