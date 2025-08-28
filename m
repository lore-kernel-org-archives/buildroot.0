Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D164C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 20:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2DE81210;
	Thu, 28 Aug 2025 20:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwy4Z4Yznbhu; Thu, 28 Aug 2025 20:25:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F02F83D36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F02F83D36;
	Thu, 28 Aug 2025 20:25:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C865092D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8B0383D36
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWZT7nAsyhsL for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 20:25:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E9AC83D32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E9AC83D32
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E9AC83D32
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:25:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 70CF1B978306; Thu, 28 Aug 2025 22:25:19 +0200 (CEST)
Message-ID: <6fab0491-d2d7-470c-99e2-45e663204310@rnout.be>
Date: Thu, 28 Aug 2025 22:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250822212816.15241-1-fl@n621.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250822212816.15241-1-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756412721; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Y69M0NaXkulwoCVzxpVkVMX9MFeE3EyJPuNODmkl5Aw=;
 b=Hzn+bJXr6mUCOigt284V/X+EVN2+HAHNg35IZn3MMBL2xm3ulwTavY5kOM52EO9EP1e67w
 abT45ZA3Iwlyu1IP96/kT/855fIwX6zGj/yeCr+r08fAom5S1VVaDxiPhU6qBe1E4+J1+S
 KKayohtsfpmmvq211e23hQ9EzZrwOFO1AUDM5RnXuIUdFtCK+bKZFxSwlgGycnB7baJlsh
 YNrvmKstdcbaaealIdj72s2EWsQ5xcvfyCFXcttl2+wtfO1G5R7d4l/wlQ9KIwzqBh39QQ
 ec9UwzFCdX6keNqO53e31EGT039hs7tsTs0QOihzRbP8sJCqPIxBvZZXejLW1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Hzn+bJXr
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: mention checkpackageignore
 file
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/08/2025 23:27, Florian Larysch wrote:
> Currently, the manual doesn't mention the checkpackageignore file at
> all, leaving the user under the assumption that running "make
> check-package" and running utils/check-package directly on the package
> they have touched would be equivalent, when the former evaluates the
> checkpackageignore file while the latter does not. This could cause them
> to forget to remove stale entries from that file.
> 
> Point out this difference in behavior.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

  Applied to master, thanks.

  I've added one more line: "If this is the case, make sure to remove those 
lines from +.checkpackageignore+ as well."

  Regards,
  Arnout

> ---
>   docs/manual/contribute.adoc | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
> index ffaff6f857..b484f8b524 100644
> --- a/docs/manual/contribute.adoc
> +++ b/docs/manual/contribute.adoc
> @@ -321,9 +321,11 @@ Now check the coding style for the changes you committed:
>   $ utils/docker-run make check-package
>   ----
>   
> -Now, you are ready to generate then submit your patch set.
> +This command (unlike calling +utils/check-package+ directly) will also warn
> +about any stale entries in the +.checkpackageignore+ file that your patches
> +might have resolved.
>   
> -To generate it, run:
> +Now, you are ready to generate then submit your patch set. To generate it, run:
>   
>   ----
>   $ git format-patch -M -n -s -o outgoing origin/master

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
