Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837F5E83EF7
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C1006077E;
	Wed,  4 Feb 2026 09:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-RPGa1a2yyj; Wed,  4 Feb 2026 09:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A5360A83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770196537;
	bh=N+r26iGUMsekwIMmzeyygVbwxWXKfBNj9qvHwL/nzjQ=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UIlJJjh+OZT2vc8we1bk/IMECqJKN0S9o8yj+VCLlnJn1IXbXoJKzKWMvMtnAoCFS
	 H1qq3M/rfEDgPqXEAdLobab2dfraAYcsXdfaVNyogBo4+vi8Uw4XdIZ8V5/kLsl6wV
	 ZeHK0gssm6JGToxjDkC4cI6gi/xNtd1bIRG38h8U+e5S9MKZ0dbf09Lkpul6c5k8PS
	 lnbyxn82g2kEjb7gQcxzPgQkxpTXWQ3rzUJCU85pxkrqF2HlFuUx/lBUVOe6fozRRl
	 lk9X0Arxl83wY9HfqXd75Kac+Xh++zt2KKNebMDUWto05ChRuHskt6vT0zd+DcSDAa
	 DVG28PZH+BhJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A5360A83;
	Wed,  4 Feb 2026 09:15:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2603F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE6AB40423
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5GbQdvuKYtW for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:15:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4AC24021A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4AC24021A
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4AC24021A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:15:32 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id nYyuvEBEm5StenYyuvqgj7; Wed, 04 Feb 2026 10:15:28 +0100
Message-ID: <eec3c48e-3ac5-482a-a85f-074ccf485fe6@benettiengineering.com>
Date: Wed, 4 Feb 2026 10:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260203110659.2127935-1-giulio.benetti@benettiengineering.com>
 <87ldhahxqv.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <87ldhahxqv.fsf@dell.be.48ers.dk>
X-CMAE-Envelope: MS4xfMOaekVFnEX9R26yMi0BvMLtjHtxs0bZX5Byyv7wtV0wvWYmoNUWd4Y2An1PIvx3Nrkn7444b84ZdklTdN7a+vXaovsuT990/y9VAAcitBnoE7CLPbuK
 JjxtrGJ0xTXv4OqJ8VF1SapMYnlsThfoAKYG1MfRAfWQqbA06By1xgGQ0EAnnXlzLkV3CqFcTfvQ/gn0dxY2mJiXt1BlGZr5ZJq+xbVQnpsxrdVT0CgUcFTU
 pbz/qsJ5UhMt222zZvPNahWqdmhDKiv1UCHZBdGskYEP6RPdCQMEkMxqFPvimha2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770196528; bh=CGZZN18rnfun8hx/h1OkDv7xk/LeiXqv2d5LepOEzrg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=W836FKGbQvaX5mM3tlvBneik2vRAH6CF1wXWd8rX8tuBT1oSUIhO1chzwOyyV/TnC
 H8bISWMxRQ1kg8qZL0NW2WBTXmtZrdWNj7XiHrBrhsuK1p60bb3cE3ZIJU4f3ByQ+Z
 RFZstJI8OmwJ8WlCFSp7rDBE/8/biQvWzItsWzEX/2KSJhVlW98ec4vuN9NYUNLgCg
 YQcEFpKMzZZA+HxT4KolSQ6ThTO+FEyQAzKeooqu71x6Ur8MIkUn64RqOU1O2i/0Yj
 oeCBfi2nLYbwgCSFod/KC46xLCgZ5H34yGQHR3Ju+BjGnUhV9ynfuU40szvUMehRM7
 zUIQsNMeIKFrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=W836FKGb
Subject: Re: [Buildroot] [PATCH v2] package/bind: security bump version to
 9.20.17
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

Hello Peter,

On 2/3/26 12:28, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > Release notes:
>   > https://ftp.isc.org/isc/bind9/9.20.17/doc/arm/html/notes.html
> 
>   > Changelog:
>   > https://ftp.isc.org/isc/bind9/9.20.17/doc/arm/html/changelog.html
> 
> How about instead first bumping to 9.18.44, which also includes security
> fixes and can be backported to 2025.02.x before moving to 9.20.x?
rrrrrrrrrrr>
> https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html#security-fixes

then I'm going to send a patch for this.

> 
>   > Fixes CVE-2025-40775 & CVE-2025-40777.
> 
> Those are both 9.20.x-only issues:
> 
> https://kb.isc.org/docs/cve-2025-40775
> https://kb.isc.org/docs/cve-2025-40777

Yes but comparing version 9.18.41 and version 9.20.17
the only new CVEs were only those 2:

in branch 9.18.x up to version 9.18.41 CVEs are:
https://kb.isc.org/docs/cve-2025-8677
https://kb.isc.org/docs/cve-2025-40778
https://kb.isc.org/docs/cve-2025-40780
https://kb.isc.org/docs/cve-2024-12705
https://kb.isc.org/docs/cve-2024-11187

while in branch 9.20.x up to version 9.20.17 CVEs are:
https://kb.isc.org/docs/cve-2025-8677
https://kb.isc.org/docs/cve-2025-40778
https://kb.isc.org/docs/cve-2025-40780
https://kb.isc.org/docs/cve-2025-40777
https://kb.isc.org/docs/cve-2025-40775
https://kb.isc.org/docs/cve-2024-12705
https://kb.isc.org/docs/cve-2024-11187

That's why I've pointed only those 2 CVEs. Was it correct?
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering
https://www.linkedin.com/company/benetti-engineering/
https://www.linkedin.com/in/giulio-benetti-79975951/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
