Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F738CDE001
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 17:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D1380539;
	Thu, 25 Jun 2026 17:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9RpR0A62kPJ; Thu, 25 Jun 2026 17:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 524B18302F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782410234;
	bh=AcLZB7YqdViteTXCBo+2Ku5kBmYXH9xct9I5WvogFfY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VmylXaI28ar+065UV6rBM8i3J5twfXQESBZGjbMXLReVeokshXbq4OOOrMgSRsCHH
	 QOMZt21VMEw9FElf+JWD7pSg8dKxyNtRu9+RthYAKwcBDx0CsRKQajNAkjZJtD5GEA
	 eoos7/SHHGd76LEKfP0Kt7/EE5l2pSUcABTFdVPcTh6eHaxsCcuo/06TWz9SAXxzB7
	 PzS8Cjv80AGw+SRNG39c9am6unvspS0M2RWS4xrnPKll8FE1WoRgwzSWmtg8QKl2ab
	 VILRw1de6Nj1TXytsGp3kowklcwxZcy4jSxoA/1KZX11ilzD+sQBBo5f+Yc6U8rnhY
	 UC0xrV4+T0cOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 524B18302F;
	Thu, 25 Jun 2026 17:57:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C235B254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C958302F
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdY0CuHIRkCz for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 17:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FC3C80539
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC3C80539
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FC3C80539
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:57:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD2Y-1x8JK91jWc-00fPNH; Thu, 25
 Jun 2026 19:57:03 +0200
Message-ID: <8665ae8f-2f4b-4eb7-bc84-ba684bfa403e@gmx.de>
Date: Thu, 25 Jun 2026 19:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260624140645.185318-1-thomas.perale@mind.be>
 <20260624140645.185318-9-thomas.perale@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260624140645.185318-9-thomas.perale@mind.be>
X-Provags-ID: V03:K1:WusjeQLwRDtqzBXD9gFG/gytdbqr1IdWNSnNh/UXISTvhzWvwTd
 BVTMNS7LQnz6UB4DDFUr+ykP70j3oW6nm8kLVixSPxjg1YPwpx31scitsB+zxxgL1cQOVc3
 74u3MYQranuNrEU1NObsIx40U9HgAIuH9FHne6G2mB6awUcL5HUKyAElvM6RRYA8atGSy42
 iJocqFW93bIjCkZlDrePA==
UI-OutboundReport: notjunk:1;M01:P0:eTFhj8TKSP0=;vSHCst22zW7CTFb6l/+L2Wxj2yW
 +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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782410223; x=1783015023; i=fiona.klute@gmx.de;
 bh=zYbddYmOwio5zdpkJfSAQByPRe2RHoqjRTdEzqjwVrk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=t9nzC9VCzZcqyhPjtqJ5mjB6U3TGF0Do2aFrmVbbP9xv9GKJUfom3EcW5IXJgLFi
 aR4JRWAyGkdOVxI1qbod5i0ltizYvnR4QXpCGjvvd08RtxnkX8CjpHNlp6C+dn1+G
 sKeQbs+kcopz+42oj19Jkp+xNcLk23lOGMm4fbDkxYXw/YuW3ESaMHWJ+KN7l3fhc
 SN9YFx9ztr2++ZZP/NBHmW7A4gir5AgDqdImRdUAjqeea52/Dvc5kr5ErrzUA8SDa
 V3i/bRNNl4B0LJg1fVHe228qL2/Kk17KyyQFEaSACR8rFrZUO71+AMwbt5mz2R8rT
 9AvlnYcHfZ5UtHplNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=t9nzC9VC
Subject: Re: [Buildroot] [RFC PATCH 08/14] package/python-pip: add detail to
 vulnerability
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

Hi Thomas!

Am 24.06.26 um 16:06 schrieb Thomas Perale via buildroot:
> The vulnerability is marked as fixed as it work as expected according to
> the upstream project.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   package/python-pip/python-pip.mk | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
> index d12bea3225..ae9a4225eb 100644
> --- a/package/python-pip/python-pip.mk
> +++ b/package/python-pip/python-pip.mk
> @@ -12,9 +12,10 @@ PYTHON_PIP_LICENSE = MIT
>   PYTHON_PIP_LICENSE_FILES = LICENSE.txt
>   PYTHON_PIP_CPE_ID_VENDOR = pypa
>   PYTHON_PIP_CPE_ID_PRODUCT = pip
> -# Disputed CVE: things work as designed, and only affects the
> -# --extra-index-url option. This CVE will never be fixed.
> +
>   PYTHON_PIP_IGNORE_CVES += CVE-2018-20225
> +PYTHON_PIP_CVE-2018-20225_STATUS = fixed
> +PYTHON_PIP_CVE-2018-20225_DETAIL = Disputed CVE: things work as designed, and only affects the --extra-index-url option. This CVE will never be fixed.

I don't like using "fixed" for "upstream maintainers don't see this as a 
problem". Nothing was fixed, the dispute is whether anything needs fixing.

Looking at the OpenVEX status labels "not_affected" or 
"under_investigation" seem to fit better (depending on whether we agree 
with upstream or not, I guess if we don't adding to IGNORE_CVES would be 
questionable), but I don't see any way to clearly express "disputed" 
among those options.

Best regards,
Fiona

>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
