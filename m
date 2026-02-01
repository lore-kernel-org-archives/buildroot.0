Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E95CD172A6
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 22:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 710A88231B;
	Sun,  1 Feb 2026 22:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYG9CtRr1LUb; Sun,  1 Feb 2026 22:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34766822BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769984650;
	bh=JIITkoSOF04YX5TjTINWf2f1sNT4PAi4PUxS9ceYjlI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fWSYXYm5M0TqdU5Edv0cmvH/bg9CeydbV1KALJ3FSWNHubOaq/wpJ7HYwYqQsSYqe
	 how/9JPva2WPel+cI7M7Y+GP3LrqhKad46ADtGJDMDhJiRD2KAZqMybCeaPzJkg83Z
	 fjADI43EgyNM7n+FYXLtS0QH2+SjplZG6tDh+/Nnji+TI7vnLA06eAuWOKKNPYhyfT
	 GPs85d1aW8R1NL01RyR3GcgVL6q8vf2bge+T7w5N2trjqC/W2dS+tTVmOz6kzDno9S
	 r9E/Mf5BrmrFSaQ4gunGGNf1wcgN7GMC88DQY1ZK3nCFK01yW9iRHohC/Ch8s/zo3L
	 G/HZm22sqbDKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34766822BA;
	Sun,  1 Feb 2026 22:24:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 035CD1E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 22:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4731822BA
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 22:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAHyripyz6E2 for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 22:24:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8272982323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8272982323
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8272982323
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 22:24:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6AD2B19F576;
 Sun,  1 Feb 2026 23:24:04 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:60733])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Feb 2026 23:24:04 +0100
MIME-Version: 1.0
Date: Sun, 01 Feb 2026 23:24:04 +0100
To: Jimmy Durand Wesolowski <jimmy.durand.wesolowski@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260119144010.1646792-1-jimmy.durand.wesolowski@gmail.com>
References: <20260119144010.1646792-1-jimmy.durand.wesolowski@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <cab399943152e1fe7da1e755e8b87b85@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769984645;
 bh=bsC7NoTqT2gKC1IuDbh+eUQtSqGeKotxZhr1T64qBuo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mFLikZecXKequYE+PglT01SQSGeQ4Q/Vm8GGLkSL+YMGOOiu3DPUmGzkQ1Ny6cyJM
 ixkz5EAiHp8b/fYu8HSnKGM+fHKVwiJOnZgJl0vZwMCjUcxqlKi95xWlaakCRPMuhe
 ods5bs0WDC6SEeFYIrOzqEzJheIyqO8HWCpX8bpfBZ9qjQxVqNMif5rIsnf5VGdzx7
 Lf22hFM11XHOD5wmpg1Itwie8z8+N9kb/FAZX9melg8napOfd0ro7vDwhiwrx+YiGs
 s2e9LfN6suJ/URedisCX+ArgVhapwpq7TALo1H6ESrpY8X/rawwAX6GFUbpfg83NW0
 luGm4OFZRP6kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mFLikZec
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/run-tests: specify
 multiprocessing method
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jimmy,

Thanks for the patch!

On 19/01/2026 15:40, Jimmy Durand Wesolowski wrote:
> Since Python 3.14, the multiprocessing library API has changed:
>> On POSIX platforms the default start method was changed from fork to
>> forkserver to retain the performance but avoid common multithreaded
>> process incompatibilities.
> https://docs.python.org/3/library/multiprocessing.html

This link could be refined for Python 3.14 specifically, and also 
pointing
directly to the relevant section:
https://docs.python.org/3.14/library/multiprocessing.html#contexts-and-start-methods

> 
> Until this is not yet fixed in the nose2 library (see
> https://github.com/nose-devs/nose2/pull/644), we need to fix it in
> run-tests.
> 
> Signed-off-by: Jimmy Durand Wesolowski 
> <jimmy.durand.wesolowski@gmail.com>
> ---
>  support/testing/run-tests | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/support/testing/run-tests b/support/testing/run-tests
> index 2f670c03b8..18a6e1dd91 100755
> --- a/support/testing/run-tests
> +++ b/support/testing/run-tests
> @@ -10,6 +10,8 @@ from infra.basetest import BRConfigTest
> 
>  import infra
> 
> +multiprocessing.set_start_method("fork")

According to:
https://docs.python.org/3.14/library/multiprocessing.html#multiprocessing.set_start_method
This set_start_method() call should be moved inside the "if __name__ == 
'__main__'".

> 
>  def main():
>      parser = argparse.ArgumentParser(description='Run Buildroot 
> tests')
> --
> 2.44.0

Could you send an updated patch including those minor changes, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
