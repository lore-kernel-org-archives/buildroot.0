Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A400CD98F0
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 21:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47EE08489A;
	Thu, 18 Jun 2026 21:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id naU5iYTBMb8V; Thu, 18 Jun 2026 21:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B292D84893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781817819;
	bh=FtfDFNvxpiB0N/6rJJDIfCSGHvLk2rOLlByX/Y7IAaw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fSh0C8WefkKVvghS80y4IoKzxqz5DPfU4/FqdGjJr71PysCGHxfkcGsp0MHL8w3np
	 5Rak9ySbA0dPDPl/Tb7QChZEc4Nwq+qJfGy1HpUAwNPmDn0gMlckCeL91BEQM5Wcyb
	 Ta6a0AgVT0pWH8OTnfqGyEJa/izPpk62cijbakAjzYtLbTtjXvauAFBasAiGYtubAs
	 mJu3JVxXaVSfEdQZmhT5vxde2FUzy12QNoKxipFI2aHMGnBnNcU7BQNPPXVizjOK3F
	 7ST8H2NlnSDve+oK7al+hxMkNxzknz+x+zsfd3ijvKQVl2x9oKgD6FHU1zz3nYSWZL
	 FiDksgnysBiEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B292D84893;
	Thu, 18 Jun 2026 21:23:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B0E22D7
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 21:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08E0784892
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 21:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0EKsgBurk0n for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 21:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E28684893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E28684893
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E28684893
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 21:23:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiaYJ-1x50WV3hjT-00q5nZ; Thu, 18
 Jun 2026 23:23:28 +0200
Message-ID: <52a521df-fd4d-449a-9e1e-55bc73cf28fe@gmx.de>
Date: Thu, 18 Jun 2026 23:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260618124835.2935850-1-peter@korsgaard.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
X-Provags-ID: V03:K1:jxSARw8jPrRlp9oPQTFZTcSq/iGXU8Ogud/fhrA8DjK1GQVYywj
 FZhZe17mi7FZGrjcB4TffEG9Wxc2x/ooBYUr2pM2iXmImTOiroGoGEl1kau/8BbCxtDthR5
 aEF5oUMVbuCdIz+S/FWc6jwGNen25MUpweNfR8Pk3MLuAkz8hGXuM7monsWBi4krfXu8qnJ
 OQm5eIwvP+5oM0Szxuatg==
UI-OutboundReport: notjunk:1;M01:P0:NJ5/bSSc0Zs=;aPMPGVCBdW6139xOBt7gnED2DSN
 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
 AiOgdgCcwwiGbF64JY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781817809; x=1782422609; i=fiona.klute@gmx.de;
 bh=j1qn1Yq8D4yEEdhrsURsj1IXR9oHRZBiNVwkou9YPN4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=YFCiEXdoy3JijJ24pumLOqa3DhdhB7hiKTfCIWVheOx1rEhZnM8UdHC8JVCw3SjI
 kS72k3L3DLC1ZR4nJpBiQm4wK/JdSOGdopEV5y6B1gNGRaOwsonTS1wV7xqJqI8+q
 R4eus46+Z16REGNHshHEG0Viu5tlcDBQEDJzcnbKvh7skx/AXvp2A8v40YNwxbd6V
 xWPAAOnta5tz4oZrodibrxbqriAj15jaqGZhG8nyuXol/bB2+WUkAaJb6+4E6EyxM
 xORy/FbX1T876WZYif8+i8xW5tmbevIAgLkP0Nm4jw9Hq07TUnyhfu9faMmtZZ2nz
 mQqbmCGv7UxdbAxz9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=YFCiEXdo
Subject: Re: [Buildroot] [PATCH 01/29] support/testing: infra: add
 assertRunNotOk()
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

Am 18.06.26 um 14:47 schrieb Peter Korsgaard:
> There are a number of runtime tests that checks that a command fails as
> expected, so add an assertRunNotOk() similar to the existing assertRunOk()
> to handle that instead of open coding it everywhere.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Looks good to me!

Reviewed-by: Fiona Klute <fiona.klute@gmx.de>

> ---
>   support/testing/infra/basetest.py | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 5fa902a77f..9b3eef6fa8 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -150,3 +150,14 @@ class BRTest(BRConfigTest):
>               0,
>               "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
>           )
> +
> +    # Run the given 'cmd' with a 'timeout' on the target and
> +    # assert that the command fails; on success, print the
> +    # faulty command and its output
> +    def assertRunNotOk(self, cmd, timeout=-1):
> +        out, exit_code = self.emulator.run(cmd, timeout)
> +        self.assertNotEqual(
> +            exit_code,
> +            0,
> +            "\nUnexpected success: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
> +        )

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
