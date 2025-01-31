Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC5C02194
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 21:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 338C860686;
	Fri, 31 Jan 2025 21:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJOsBTpxWSOc; Fri, 31 Jan 2025 21:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E9F0606BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E9F0606BB;
	Fri, 31 Jan 2025 21:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60B7716E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 21:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D10540F48
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 21:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4OIq7wafBmF for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 21:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C47840F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C47840F34
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C47840F34
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 21:09:13 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id dyGEtPGOzRBkHdyGEtwImZ; Fri, 31 Jan 2025 22:09:10 +0100
Message-ID: <e7cc9e98-e41c-4fe9-9acd-62e284ce8d81@benettiengineering.com>
Date: Fri, 31 Jan 2025 22:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
References: <20250123201858.111999-1-giulio.benetti@benettiengineering.com>
 <877c6a4sri.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <877c6a4sri.fsf@dell.be.48ers.dk>
X-CMAE-Envelope: MS4xfDfkGReB2kZ9flN74s+JmxFGiqchnclUwC7l3HcpyNFpaU0gu2GOTHb7pW4fm+tDVKNVDJaZd8XEqcN5DMkdsPkrQy4IA5NcrZ5k4D6HTh9B4HVeiWZn
 QVQdI8RH03vfTkEHrxf2XwHly3xnzg1QfL7OLuDd2gl9AdPFz08HCsa7SggHJVNr6/PtOoAL0HD6Tf0cfGVPqwwC7GHeFGq4f1A+PiJOWiJuillBwdZN5KzB
 dEWmTuJoP7sUukcRyepwlw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1738357750; bh=li1Kyn5nut1LwFWukY18Zx2e9DM3eERQo88TvyEXMW4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=jQI1KwbOGNu1OE2SpBf7Fqrg6aOCU9CJLxywQSrDRpHIq58hMb1VTs09FSVfGEBwp
 3rZ6PtjtufkExLo9FX/kcFFcqajd3yd+GDppVQblvImd8Qlwt6xTsC8MjKk/s+l5sO
 FzC97Rm2kpG/9gxNMP6cDNp5xP7PWQxtrAT0xPS+g+jVZLzOHzzFbo0ihfpfdtNSfe
 Dv13SY8hhYZ1sfDBh76Fff7vtgjMWrQJWi7n3FK9IoE0YSKsjZvXBP+vDPKb7ESfQD
 +2c7kr69hT3UoaNZjbOJXAq/WKs+q9o6EqWd/XHvWCWmPxiMXDK6tj1gukAJKikxm5
 CWXUIiHd5w4Qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jQI1KwbO
Subject: Re: [Buildroot] [PATCH] package/swupdate: bump to securoty version
 2024.12.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 1/31/25 21:45, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > Fix a high severity bug with the raw handler
>   > For release note, see:
>   > https://github.com/sbabic/swupdate/releases/tag/2024.12.1
> 
> Can you confirm that this was a new issue introduced in 2024.12 and
> E.G. that 2024.11.x / 2024.02.x aren't affected?

I confirm those versions are not affected. Here you can see the only 
commit for version 2024.12.1:
https://github.com/sbabic/swupdate/commits/2024.12.1/

that is:
https://github.com/sbabic/swupdate/commit/434815b94d73c20b5461b954c4e62144ca29aa8f

and in order it Fixes:
https://github.com/sbabic/swupdate/commit/5d57a9c05ec2a4ae422bdb35247a75402f8e0aeb
and:
https://github.com/sbabic/swupdate/commit/aff67cdb2c62003a3be194036b68c62e3064d660
and both have been committed to master and 2024.12 branches
after 2024.05 tag and not in 2024.05.x tags.

So yes I confirm

Best regards
Giulio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
