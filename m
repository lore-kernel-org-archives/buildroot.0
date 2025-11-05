Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75CDCCFA05
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 11:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8022883C59;
	Wed,  5 Nov 2025 11:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmAYTfR0NY9L; Wed,  5 Nov 2025 11:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27F4683F88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27F4683F88;
	Wed,  5 Nov 2025 11:35:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDB304C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 11:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C424440F02
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 11:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZZE6OlBrW4R for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 11:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EC2240378
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EC2240378
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EC2240378
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 11:35:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.21.139]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ykg-1vLXDI2qgg-00Frfs; Wed, 05
 Nov 2025 12:35:46 +0100
Message-ID: <c81bf292-22be-4bae-9ab0-8b38481463eb@gmx.de>
Date: Wed, 5 Nov 2025 12:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Perale <thomas.perale@mind.be>
References: <20250830131036.1295970-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250830131036.1295970-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:02IV06NBvBKZ8sqJzPEUIYBOLUE+lbUtjZeRLm4S+a7H/N5TuLH
 4zogW4kXKyRnp/tjxnNF86WXuXdU6eauPVn+61ddZtakdf8HNjEpWYlLZZlQhcYQjIK7wbm
 obuL6aWi+xKAjj+cMwdtO/AjtirVm6LBKEvinUmJL0eeptBwYqFzCvnvyV0Uk5jnEePBFeu
 ClIb4VQ5sAi/Tt5u+W28A==
UI-OutboundReport: notjunk:1;M01:P0:0zErAKRf1Zk=;ZyyHU/+4zb9LF9nfch33RuBPrh/
 aXGL8isgoFW5hOm3agu3bFLZ7+xKQWAYFr1Zvo71hjCUwunczgAi6ynD1TogTOGfzp+hBfuhM
 h2Qg9+hvfaHEWnwnRyZsC33YG88kZKaLOEqqRo++IgFr3D0icwZqTDsfT8ufPzDJIIUDLkGS9
 nTYu9vABoeADZiK3Vh/6NYTma3Hk7gOtRW77GRFBFMljcmDtyRA1R7MS20EPsIqVQ11W7Pfks
 mEC7WfJ9T8p4fVa7uPlG+g4lmYpZ625U9NvyTLSq7OiSFSHxXlZyOgNv7bH1Dy5yfgHI66dT5
 cdwv6uoOqgFmuwJHcfXh2om47+S4IKZlcWY3f5uI6RgdMtwpbCk6+27olabU8z1k5abtHx62y
 Ns9Xrf3p6ZNibxacaMPllMJ/uD77h3wxS3xbf4PYxSRplfyuMDyeTxEAXurIJtlwjMx4jj+ML
 gYESTnQpcfDEQqJMheS8fMyHwVTCLCj+VaNwObSidxt6PhGqSuCo26BcqRSslzxovsWm6xmyf
 n5ZBUQTLu+aKUw2JfwnLG119YHlcS98AvQIdAaKJbD5D4KoC4Wd3qvz7kF6nAjVfn4yu13Tnf
 P4GRMTS1SRqBub3vU1Y7/v/YjGzxaE2STkZ3wXrahRsEamc+zPIUN89NzGEOlzjQBcJvUMjnz
 6PcDhXmh34lg/FGb3d95roDP2pmbY3wWNkvTIgn8B7fL2kEeDWmEF7Ct9331FuEVSdHFWCgvw
 8cNp3MZO6ta+dsXFcEAG3B9VV+PmYYkl3b3/blaoR1SuPG62Pdx7UdJypriHGD4xn7F6t5jE6
 hCAqvNMVKpZsLDuo9CNpchHjfWfBzvi+ai96JvUmRAyR7KN1zxmTNCNawRgCdbyl0k56QSetl
 NuhRJkIuQd1ouI46cft8Zo6yiATa+lmHdsLYZRjHGeaPP5PLP1cx2PUjq+RY5i0xg3g6QfIHh
 VQXFCewHAQLgq9+2DRMG2ClH5keq79I+Hj4d7Yzmy3qRspzax+7GKRCjGNvp4aHRDqvaNb9dH
 lD/2KXiDzwEBCHbs3fU1RIOWoueVMzM913LH7ZPwUw/YCvi76574zuMJ7YChFOco5WWcp2Lg+
 use+s0fYCzTV0oCN7GQVFGhnFNnaS6d4TaZjNVYLfxiPIaccuxVen+yV3ZBW0Vx7COynsrTKF
 BeLxeK53MA2OPiN87oOAOXqzlH3HfaQwsnnADA2g+zGw3h2GzWXWahvSjIKfaNliyXWYWLOzr
 P37q+uhSwy/nPLpwlTkamhdyijSQ+MB0HrS+a3e21176Zs5hDG/JyEh6/1T7U48uJGvACOkxS
 SVHBm36nRc/99SYcW6JFNQEJns86Fwz9L7ehT2LAsFVsbzo0EC96SeU4UNbe3pWFHbso4RUJP
 8lk98b5+bEKziQvSWltBFHcQ8R3v/SAQul0EaImnxlLlAR0QzCijPCyLcQljpUvVJGrtzcbYh
 zEuLTRNbTg/LUZxGgsyDuI4L58lCuTMZsFUkTEwpCHjnb2y8rLXedoQM9EfaYEBTA2FX3oCZt
 zO3EATpAWaLfbwIv8x8EyPNOq2qx4vzJPOhohWqQX/dlQTMpq0sjO7Rbi9BSPieLDTSyIqBRj
 ZwLqb8uoEWhD4zGvJoJI0My6a8c0TOPzXSuJWgD6ezjQmvRgt80NzcBCowqNp45FSVTsMwR9h
 uAQFiZ17F1/HyWblByXTg+qNKFG4VCXJ+QAN2X0mnhbvVb0YCn8t/5yIi+xckqyTBNlnDdtju
 GkZ0Qy8BskuUDNRIGjf1brIY7PvkjtwdxD4EYUNm9Sq686t1aFJj2cm9HT7j6/qExa/fXNWnb
 f01mMV6KDIDGiVVCkFJYVrFgQsGFCbkh9y5h7DGNv5/ljlsAuzTWsxsMop1H1oH50GSAlBCxZ
 kycrIKq0EbNSHyEBVOe6jzUijqh9YtB3s3FJwu5TtdDGenU0VOxH9uGfgFAVzCzDMhRj+wl/k
 AbUGDrjmT+uqFx3pdS5O1xNRSoA/xfUDOzlqST3m5KzezwI5pMMqtYUZljvjlohDCiDxvc0MC
 5HTxFCdk5pV3kEk8MHZ38ql5G2HECsSl+PnU8ZnFDneZgctmR13DvQ8zFH2Z4WfzykH02E/hA
 m8bNY5QTC7vpih6UdA80Xr/kREAa65e3wFrrBXkNDVABnTXXf5crETTJKZO66nvSE74Y9ymgy
 zdvDTKhlN6RVSQQfWsCeZGmefPEPOEJIxFFnJwByok7zXfpHmzlNfTTQdZv3dooREYRXXYym8
 aNCjDSfYV1RC+dYC1cvylA/b48BOCt/3xEjq//qeLdGimfmTSA1icF55G5KbtGta1FITWWAtp
 OJ7x5cPCxsBe+Y7OTWi84Lm9M0wZloF5LkcgUjNInidFVWGd9iQXHbntewu4K5gSSeGhvGrUG
 LY0swj7EyK1hr+zEncn1UcpiNlcV1SZivwKsZtWrz5Gaf0L+uQbLT11ATy+Uq0px/WFXZ2bsW
 7ipmt3nF6Y2UsxEGX2N0UGwZJl3s2J6TAbAVuSC+rrDCkXtwUI4DEfISLOt1SXHJL4XS1v4Je
 0ZTrdDxWpQfxCopnrb+Lxo8HtXTS3NB44t7mh6VCl0meqt68yrMBQcwyt+dkzSWVqG3FWAmlc
 7VDix7/5yHYfDqo9ndjFMN7EXaAvzIdfZj6wpRR8vwW0ip+7KAM0lMZ9WUPEywIidpYFLst+6
 jTqoNWd38/E3gI5jpP64N7EJWr0Trmu6NamZSMdzjY9A22cf18rQqwyoXYN7eM6jHxjXX720f
 9jGOtDKxY3upYZytMk/hgV/qIlpXswveo1UgtZpF0o4e8bNDhGMcCNqK85MABS1Qik6E6Cih7
 tl/67ylGFTLdOqF33KQk/h8O95XX1ZxHR62sOaVLLldkZOxz7Geb8xCxRGrpv9WE1glq7dXVA
 ewRMJ6hHhsjnx9pdgqaom88/o2cJVMN1md1dABY0fnzk5XdhdmFlPrFhtWxN4RKD+cyPN96He
 eGnh9dIZHnqxojSlDeRjH8fPgQ9BCQkuglrd4rqCOLeIiJQbXj+MPMwSS7M6bFAHpuWceWQiT
 ELzm5ZjRv5q18jEHiA2AmWbMz2MPaCF1/50f8otRrii0tUMWqEvIf+7n7W5QHUkuNAf58YIY/
 /hk89lgaJZLC8/7oLHZHNJ72XZC2hvRE5o9OdcOsbKb/QbdtzfqxXFAEAcWhPqIbbeK1Tyqh0
 pQ9IpwGJZiThVtsO1vNXxDIHiS96d+g5AscV6/ZtIa9daDm9wzTRmCoMFKNyBaqetax1NcUbN
 VjZTQSOiZGufr9ohR3YXGSaDbW5fKiWDwXG122Xs0gqUdp8GxVzWi6nG9sNLL6QSFpc5P51QZ
 XPMziVXgeLp1aM/amN5YiMi8Bkz2kdpBLmz2XhIiKg29ckKQdHStQONdULruK1u3O70iF4ARx
 rLA3ytAiyE1linKvGbAC0NtKYVd/h9/IUjEHAT4QjBHhwU+s7tzFecp1YPuhsyzQnbStrEjPJ
 5U0apzPv/FHAX0CSaYeM2icgJx3ufVHHPJvyJ29BS9+1TqmPdA0XtqteHAvolMJySIBtT+NVz
 Az44i/wI3cDd09XMMiSo4cVDz/5qG7CmNLOaFMGANKp76//N4pkTgVp2wQmyXIu89pBoMHY0Y
 ylrEKMFLHuWb7m/1OBhf6o9FzwdH+BJFTcrm0eF+leP0+jPHNZfyLqSHd0jaOpx3HJoStPTv3
 gnlSASsbdImfd1BoHuSNhULfy19zSfuMl8mrd2AXHlDDDNqFdDYTL2petX0Cczxa9wxWbj7+t
 k9AD9jNFTL4aCkqh7OUmEK3G/N/ALWa9RVesSJkOZ4SqNIwFTVwQcCLm0haPlLaKbBT+tZ7eL
 eTT+jcGCaLUxs/KogTQIktTDFKTyh0EUPv8dnpyvkiUPoui2hUZGzmIyZCf43yjXL44OmNNmp
 EWm9nhR9bARjtvrAESO+AA5XqmpQqR7d8pH4/T3TTBWuRpgdCmJtoU6Mqbe3j/jqW9Lnm5hXc
 ZIhoClRYImi4UXnbiYKsBMmsTjKKA/96GKe9CwssZWaOgoeJFD9ZGS0c4V6qkcPfQEVkqMNWO
 yjS86yCuJgV94a8eQWQdKrRVCl6nkRfZt+WZD9PXcgc76FF1zhCjvCkBS+qdBCIvGZ4GltJgJ
 nktV/RHnervrSTRP6BF2AK3Jjlqb/D/d4UEnBZnzul+cS0rwwcE92mOwrkWjJNhSAro3sDIKD
 WtFxpULZdgkWTwcgErNcXYDZEYJ1744pcfeQYtnmRZM/2CyaykKJ5ijH4msNvOMESjMwSIOx3
 S8rfl7Wui0y5Oq1EPUJfHS1jyHCyGhqFRmuXaozpwH3EGsx643JXyjKMFHBluYrHTxfCiH9ci
 ahJZ1WVHYtq1R8xTP6QqLHihogIInFBAXmKU+EZmJ/QqW3T/5X3RP/dSaa8ZDcEsWPWzzF0kQ
 U3EAjnNwP6mCQGYQpodR1yZKgs7iTW66wH/SSOwGQaSgfdDCmnY3uudv4/OA8962oTn11ms1j
 3FDfGB+80SfQAJT1gbPy2zBKf6R1JMfAG2k2/gZWZDcTGOifwreiiLdjwlDV1X0hG9wFY+dZ3
 AcghsG7TmRvKeJ+oCVD8/ZC8v5Q8NcijfyJuuhm2Hy4RyvyvWCfbFArx/vZBv4CXPnnJ1e7P6
 F2PzzQfBBjkAP8+HKqk0wp4HxnFkMjBgzfpUEzjQMFrcK+J4kYyyWvfzpVkd2tnvMyVIy307C
 LVh3yvlrYTfrpzhzJ0/O7G9byc7Zz4btE+LVdZQ9Rr9NC0ph+q9dWOLddjUzA59QdEMU1oocT
 AVI53vWdfvBNPTEh48XHdgzQnu6Vhz4Bb+3J0peX7mzXGidvRPsf7B81rdIUgCIOiDrimFvkN
 A1OX2KCJFsoPfsTmU9jhIoi0+V1B/RhbE+QZvhKDmrlwqv0h/8mbTwjKEhy3drq8b4TtYn+IU
 x62tB+TDxQRKUQeJPkUISUM3Sxew1rXQ7uY06elqZ5VD5kzBqTTIeaVOFNmiTBesKKiPid7k6
 pMJS+gwwOc8tFXjBAF19BhGTn1KxIL1iljcKyEjwaXVZUBrG2C3tVCRvXV9dXNC9h08SPXCW1
 8jOxcAuoIz9RCGJUtogoX5Q9iJBEy3weI5Y0NENzAKgKuUkn8nd0F2zCBCSn0u1Fh98Z5s7GW
 d06ATwO0wJ79Nqrzs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1762342546; x=1762947346; i=fiona.klute@gmx.de;
 bh=pNKNHYyFMhEAC4VO2V16mml6v4sWvyno7rGsFsvz8tk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=eYKz6j3Or/XmghmW+13C2lUJtvk0b1kv+qLSRZXPphipjYi2WJoocsRlK98C524W
 w5U9P7J3n+I1dVyvZOh3YGZ5ydB77r+LgF+jadxHGa+OIpDrYl1nMOmfqgyOjfxB1
 0h98Q1j4GpOu5W45NAsBBx9LqKYFptkTd/oVb4akC+Y4x3MTVr8b0CwLt5jyh6x8i
 9o+kicq8V10MFjxb7W6V1ioWeEgfRW3G+DVA9/AE35SIF/zXS3aGpbeBf8/wS5gOh
 PF2yaQrvTMZmBNnELiBTnMC9hdo/ThaFh9H4FuHrK1VdCyln6jaUJaLD0lSw+bMah
 qMMcLTKwU/BvP7Evuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=eYKz6j3O
Subject: Re: [Buildroot] [PATCH v4 0/2] Add external tree information to
 CycloneDX SBOM
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

Hi,

gentle ping about this series. Is there anything I can do to get it moving?

Best regards,
Fiona

Am 30.08.25 um 15:10 schrieb Fiona Klute via buildroot:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Hi everyone,
> 
> this series adds information about external trees that were used in
> the build to utils/generate-cyclonedx output. I think having this
> information is important to accurately interpret SBOM data: External
> trees may add or modify packages, and in that case the Buildroot
> version alone will not be enough to precisely identify the packaging
> that was used. To be able to identify which packages come from
> external trees, it also adds a new package_dir field to per-package
> data in make show-info output, which will be an absolute path for
> packages from external trees.
> 
> One open question regarding CycloneDX properties: I've added a
> BR_EXTERNAL_TREE property to packages from external trees with the
> bom-ref of the external tree, following the pattern of the existing
> BR_TYPE. However, the CycloneDX specification recommends (but does not
> require) registering properties with the CycloneDX property taxonomy
> (see https://github.com/CycloneDX/cyclonedx-property-taxonomy). Is
> that something we should do for Buildroot?
> 
> It would mean registering a "buildroot" namespace for CycloneDX and
> maintaining documentation on supported properties within that
> namespace. As far as I can see, adding a section to the manual or an
> independent file to the repository should work. I'd be happy to add a
> document specifying the current properties (modified for the
> namespace), but I can't speak for the Buildroot project in registering
> a namespace, so I'd want maintainer agreement before working on
> that. Either way it doesn't need to hold up merging, we could always
> add the namespace later.
> 
> Best regards,
> Fiona
> 
> 
> Changes v3 -> v4:
> * Former patch 2 has been merged (commit
>    b10f50399afcdc1cfaed06387b3f51d2dfa27ad0).
> * Add an "external" mapping with external tree name and version to
>    show-info output for packages from external trees (new patch 1).
> * Use that "external" mapping and "package_dir" to derive external
>    tree information. This removes the need for a separate input file
>    with external tree info (patch 2, replacing former patches 1 and 3).
> * @Titouan Christophe: I've dropped your Tested-By due to the major
>    changes, of course you're welcome to re-test. :-)
> 
> Changes v2 -> v3 (in patch 1):
> * Fix merge conflict after reordering of metadata structure in commits
>    6098cc45d64e9e7928f888b7cdf79533813d19c4 and
>    9cbbc477626c433fe78614de9474f8446b7e2389
> 
> Changes v1 -> v2 (all in patch 1):
> * drop unnecessary default=None for "--external-trees" option
> * fix help string for "--external-trees" option ("%" needs to be "%%"
>    so it's not treated as a formatting specifier)
> 
> Fiona Klute (WIWA) (2):
>    package/pkg-utils.mk: include external tree info in show-info output
>    utils/generate-cyclonedx: include external tree information
> 
>   package/pkg-utils.mk     | 12 ++++++
>   utils/generate-cyclonedx | 90 ++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 98 insertions(+), 4 deletions(-)
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
