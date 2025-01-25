Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DF8C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 22:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB24B817FF;
	Sat, 25 Jan 2025 22:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxCHxzP4vUr0; Sat, 25 Jan 2025 22:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E23438188D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E23438188D;
	Sat, 25 Jan 2025 22:45:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD058A6A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B992E6061E
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5d4yppv90lz for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 22:45:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2860E60615
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2860E60615
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2860E60615
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 22:45:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.60]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUGi9-1u2OLW3K8x-00Hqeu; Sat, 25
 Jan 2025 23:45:25 +0100
Message-ID: <e4fb9b34-7b26-459d-b2db-7a82fd3b02f0@gmx.de>
Date: Sat, 25 Jan 2025 23:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250123144032.1429434-1-fiona.klute@gmx.de>
 <e194f1d1813c5be0c9d4a4e95076c0f1@free.fr>
 <e3929210-5754-4794-93b7-262539f36552@gmx.de>
 <09c86a1a2555b414b4a168ec288354a1@free.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <09c86a1a2555b414b4a168ec288354a1@free.fr>
X-Provags-ID: V03:K1:gsQX1eA7pvlFb2tm6tHdH+L5Hn7H/8yv5UtnyvMvVbOd/aIFphc
 CecbbyG9Sf7CWAN72RItfKewrFMKBmATgLjRal9nEZkFDF03ybxFvKeaSymJebdJpHW4WSh
 1jeQVMd7ZuHcc/Sfk71fChc0qELITeDlwmVn1JT/7GcMBUcTjT8YbDPIFpxnbXUuxJC2lrH
 yZsVIWTDWKD+fG3S9Yz5w==
UI-OutboundReport: notjunk:1;M01:P0:zDaT5jbYYys=;H57WmZbRhYiI8Ghzajz5chxyrKW
 2wdEtM35iTFqxEId+Fl2uruSSjrT+z6Mm3qHWC0AwpDuMRB22yugBxUtyBhWr+3TXFj2iHz6Q
 Fr8+22d+MoLi2fxPdqMJInBaQWtRMe7i4G80HEl1bfbfQofI1pcm8tIqRS9Ghmo+u21Mq6xdu
 mPdVsddznSHZkzlFB3877OTp/9wqwoxFG3GKfCA5U5dSkvfXeoK73abb3AF27JlyTBQNMSrfI
 JiHeW/VaONSUID/8yoYv3BXv5pT/zgREYCY0s7hRBfsgJaGZFJoWvmy/k9g7YCHPc+J6LDvOf
 4JkOOH+L8N7zOjCu4/FPSD2mP6Vl8PZePGrWWpuVHBLKoFaXCphiKFHxjU21Qdn+U3lqZVTDz
 CYA3aBiEnDW8ZbRON1/h/YS7H3KJJPySJBzFfaUpdjLL0LTEdCRRpq+W2YUouTaW/+adFRv3v
 RS1bnAIkbQ2Mi163OmctX2lhUCptCzLJKxsqmEH/A+ITnQF1IjoQteGFCmb0RuVX4VG4MOWGs
 ytt0CBWcmj8w1XrT+EfkolSSaEgmCdHP84GgiZzLfkGISVzICl7QJfvXuAnBcsHpspy4BYJRe
 o5aSctHAHNVzTbBHbYih7/k9XF/Mdgq6Oc4YXxDzHq0RqMvwQZRQpsdi5T/1IdHa6oY6XMehO
 mt5Ingl/Qk/IOlhBZ6hsLHapP+afD3na17HY+41626qw5ahx3MRKi5xmtMsa0dhYDgeF5HNfg
 ZKSvClZ93P6W8Ko0fI+w7ZTZnV1u6seDyJ9LSMjyOQjyDZxgIzWz031OtFYZ2vksaWVJ+4JzW
 iBu2ouJTbOyr34y7Sbwe9j3/XU0c30XoGF7+Pvcq3aKqjcv1sm/ega7P4xWYBCagC4wyq3Z3v
 D86w99K4adif/egL+oBTCEs86/NX5EUHoHeETbNzn3ZVtbGZCBBSvdSkXvMT7DGucMD6TE2h/
 5ns02i+OBG3IxRJpdq1/t9COpATVV8HPUp3Il0yNPN/7K49eLPD947ejIW23Ela72foiMxEMS
 6q196tr70hDJiBaLEPI/PvI/vYRMipwIbPGbbdfvkp5f5/pVO8VF7UCzDuchUKENLpEL+WST8
 Or5yEet9yCUrCJBQdL/iddgjSMGxbIqsZ7ZQIgWeSHyoggWWg/knc8xMTehmadzTqMz4bIA6t
 4RRPCVvc4ThivqWKgYszZxh4kUaHl4HOHn73BKp1CwNhc0vQGUvwqveHauqT691tsYJ897R5i
 tm3oAoNzSNxQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737845126; x=1738449926; i=fiona.klute@gmx.de;
 bh=yQu6y/Z7l940DEY91PVu9HbkdOMTNRvkUNe9qNTozCQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=J1cHTcHeWdUdd3tQdZ0C0KfTUJuCeT8yOYDpAJ0sIjF8easSmsaXK/rXFTDPGMNz
 4C97J/wBllxCLUQMXFfFPTNlHExDc6BaAHkGN8MyyB/gIOArCXZQNyoWfQA37OOPF
 NR+2wzj4lHTKhLvlYLVEiaV0+VQ72PY8W7o23GbdmQoWS9h55U6cA5tkNMXI2IdgL
 dqtt3R63AaRv15QYU4/44zaB+Cl31EVsRN56+cyWh+oncu467vwaAcfnyh0voFGA2
 BsiAJJs3hMr7PeP8MqQW7/KxIASMtHHjzXbWeiBuz/XhepQy5HvXIk4MzbEfwGRRG
 XvDXalREaT5/Y1VXkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=J1cHTcHe
Subject: Re: [Buildroot] [PATCH 1/1] package/panel-mipi-dbi-firmware: new
 package
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

Am 25.01.25 um 12:49 schrieb Julien Olivain:
> Hi Fiona,
>
> On 24/01/2025 22:03, Fiona Klute wrote:
>> Hi Julien!
>>
>> Am 24.01.25 um 21:05 schrieb Julien Olivain:
>>> Hi Fiona,
>>>
>>> Thanks for the patch!
>>>
>>> On 23/01/2025 15:40, Fiona Klute via buildroot wrote:
>>> [...]
>>>> diff --git a/package/panel-mipi-dbi-firmware/panel-mipi-dbi-
>>>> firmware.mk b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-
>>>> firmware.mk
>>>> new file mode 100644
>>>> index 0000000000..c3a9fa7afc
>>>> --- /dev/null
>>>> +++ b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
>>>> @@ -0,0 +1,35 @@
>>>> +################################################################################
>>>> +#
>>>> +# panel-mipi-dbi-firmware
>>>> +#
>>>> +################################################################################
>>>> +
>>>> +PANEL_MIPI_DBI_FIRMWARE_VERSION =
>>>> 1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e
>>>> +PANEL_MIPI_DBI_FIRMWARE_SITE = https://github.com/notro/panel-mipi-
>>>> dbi.git
>>>> +PANEL_MIPI_DBI_FIRMWARE_SITE_METHOD = git
>>>> +PANEL_MIPI_DBI_FIRMWARE_LICENSE = CC0-1.0
>>>> +# license info is directly in the only source file
>>>> +PANEL_MIPI_DBI_FIRMWARE_LICENSE_FILES = mipi-dbi-cmd
>>>> +
>>>> +PANEL_MIPI_DBI_FIRMWARE_DEPENDENCIES = host-python3
>>>
>>> The script mipi-dbi-cmd does not seem to depend on extra host python
>>> modules. See:
>>> https://github.com/notro/panel-mipi-dbi/blob/main/mipi-dbi-cmd#L15
>>>
>>> Do you think we could use BR2_PYTHON3_HOST_DEPENDENCY instead? See:
>>> https://gitlab.com/buildroot.org/buildroot/-/commit/
>>> b98062f7301bc72d2a59cca733f36525405d3bb9
>>>
>>> This could save the time of the host-python compilation, in some
>>> situation.
>>>
>>> What do you think?
>> In principle that should work, but as far as I can see I'd have to add
>> some logic to search the Python interpreter in that case:
>> $(HOST_DIR)/bin/python, python3, or python?
>>
>> I suppose the elegant solution would be to store the detected
>> interpreter in a make variable from
>> support/dependencies/check-host-python3.mk, and the host-python3 one
>> otherwise. I can add a patch to do that, but the naming scheme varies
>> between the other check-host-* files. Would PYTHON3 be acceptable, or
>> should I use BR2_PYTHON3? Something else?
>>
>> Or would it be acceptable to just use "python3" and break in the (likely
>> rare) case someone only has "python"? I don't really like that option.
>
> My understanding of PEP 394:
> https://peps.python.org/pep-0394/
> is that a system with the "python" binary alone could only be a old
> Python 2 interpreter (which would not be sufficient and would build
> a host-python3).
Thanks, I wasn't aware that's an actual standard, not just common
practice. In that case it's indeed simple, I've just sent the patch. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
