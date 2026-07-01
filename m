Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0711FC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 17:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADFC982B69;
	Wed,  1 Jul 2026 17:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZOWBtGMuOeo; Wed,  1 Jul 2026 17:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5074882B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782928790;
	bh=SmvpYry8K2z4DeHwUDn2Buh/42P1Raf9dtgC5OS6aJE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZJJ898+R3ez2wNawPOd7j7297UjOFn7UFeL/R5qhDGMRrYaOh9voU/qkR8K7yNffx
	 P2QGpG5Oy2OXYJXkd9DYf+cHRhXuGsAW4eFGOBk5W7Uznmj8Be/9XRA+bihQLzOocr
	 7y7DakzEqOa7WW+TamZhGtN0JFro0AN/9oftVzNNul7QiuAKDyIUBlCpmNFuXygReM
	 nxbKDVRNJa42SH9tejbDAPiolODlp3BRM+a3LEd2F6Il9kquZPo08kt70btwmZU3Oz
	 CBGZOfJzwPvowevw173vXoKZYDboHUFefY3xDEpwdJ8zUlStDqI79EncQecQI6JKEa
	 pGnXfhXiFgInw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5074882B21;
	Wed,  1 Jul 2026 17:59:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A348D316
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 17:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94F1682B21
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 17:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85qHY6YWwHD3 for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 17:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A03C82B1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A03C82B1E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A03C82B1E
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 17:59:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bX1-1x5lQ33x0F-011lYL; Wed, 01
 Jul 2026 19:59:45 +0200
Message-ID: <193cd268-b895-4ee4-aab0-df26283f651b@gmx.de>
Date: Wed, 1 Jul 2026 19:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dowan Gullient <dowan.gullient@smile.fr>, buildroot@buildroot.org
Cc: thomas.perale@mind.be
References: <20260701125741.4064511-1-dowan.gullient@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260701125741.4064511-1-dowan.gullient@smile.fr>
X-Provags-ID: V03:K1:wIfVY5c/ZbXacthaR03L/PORcziPxEiK2GUULD9W0n2pnpC0esK
 NuG89PTN022xevl6rBUdma+x1rwryTOj3B6dlx/a/lB08cSZQmCwJvKNh7JNIQMt+qzVNJT
 s7TQun1qzSeO+c/mjPg7tGRez5wosOhuMUxIWjQMb0oEJ8Vhzj8FvOQYe5gxr3DnETSf+j3
 yq9gLXARSaDDPWtvKz+2Q==
UI-OutboundReport: notjunk:1;M01:P0:PZmGhPzPtmc=;SsuuqPW0y+rYXussW5Ignszmk+T
 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
 vZyq3tb/rmudaXm7BM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782928785; x=1783533585; i=fiona.klute@gmx.de;
 bh=IDCDUgHjyeDgnYhLSAaJV9DVEWQHxbpWWG9igxAVJOk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=igJLT1Zh/tWT4JeGh6e2azyaqxEuriF1hFuAgpQo5017c7C3dqoUSpIOpC8yvdrI
 6sQK3bNl8KAiBbdf5ZfDItzpuWqkz0XUEHQw5pWqj53eVgFhJbxTvjH3PBoejl2ae
 nrguy6tvgT7DM70/y6/06PCuTifdIk1k8vDoZ8059eTl2mIcAj1vYFU32D1JVvdqr
 UxNHLgLbSrIIzyZCQlCx3bGU5Y/R6+sZIyURWt/5kT2igqbOQ2zAmsUFXEcmhPTfU
 4K049VZJm+sU+Gs/bkSmLdCaMal08ht80DCAXxX+xjzXiGACWjFO7RxtGX7zHDoa7
 ue3fHP35MLJhm2x9ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=igJLT1Zh
Subject: Re: [Buildroot] [PATCH] [PATCH v2 1/1] support/testing :
 test_gnupg2 : fix runtime failure
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

Am 01.07.26 um 14:57 schrieb Dowan Gullient via buildroot:
> In the precedent patch "support/testing: test_gnupg2.py: use assertRunNotOk()" [1]
> a small typo (OK instead of Ok) was introduced in the test_gnupg2.py file,
> which caused a runtime failure.
> 
> This patch simply replace "self.assertRunNotOK(cmd)" with
> "self.assertRunNotOk(cmd)" to correct this typo.
> 
> [1] cb791850ada782beca4b03e26356fd8506912d52
> 
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

There were a few formatting issues in the commit message (space before 
colons in the subject, lines in first paragraph too long). Applied to 
master with that fixed (see cfd7483a26e17ca4ea95793ea7a618c6cc1b1b78), 
thank you!

Best regards,
Fiona

> ---
>   support/testing/tests/package/test_gnupg2.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
> index 6f862c31ce..c8fb029c95 100644
> --- a/support/testing/tests/package/test_gnupg2.py
> +++ b/support/testing/tests/package/test_gnupg2.py
> @@ -108,4 +108,4 @@ class TestGnupg2(infra.basetest.BRTest):
>           self.assertRunNotOk(cmd)
>   
>           cmd = "gpg --armor --verify {}".format(asc_file)
> -        self.assertRunNotOK(cmd)
> +        self.assertRunNotOk(cmd)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
