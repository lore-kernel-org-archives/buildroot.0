Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46471D6EBF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 09:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C97966075F;
	Fri, 29 Nov 2024 09:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INpT2mC2TNMb; Fri, 29 Nov 2024 09:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBABB6074C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBABB6074C;
	Fri, 29 Nov 2024 09:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EB86A6A
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C85D81068
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0VxsD78ULX2 for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 09:11:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.171;
 helo=mout-p-201.mailbox.org; envelope-from=j+buildroot-list@maschinengott.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3529C81013
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3529C81013
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3529C81013
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 09:11:44 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Y06qt2GNhz9stK
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 10:11:38 +0100 (CET)
Message-ID: <b57fbc12-ea8d-4ecf-8e8b-a78f61c4d4f9@maschinengott.de>
Date: Fri, 29 Nov 2024 10:11:33 +0100
MIME-Version: 1.0
From: j+buildroot-list@maschinengott.de
To: buildroot@buildroot.org
References: <20241122223158.5315-1-j+buildroot-list@maschinengott.de>
Content-Language: en-US
In-Reply-To: <20241122223158.5315-1-j+buildroot-list@maschinengott.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maschinengott.de; 
 s=MBO0001; t=1732871498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxAVoE3Ieqkyd5ERGbhSQu7RzaTuJFrHxw2BiKxrvzs=;
 b=v/jbg1KezPl6yqZEmB8P3jk4diCuqJhsMzUekOzUQCQ9+BWsrgW78uA9pOOH324XIW/M3P
 LW4SLd2Mdnw/bJFn1BT/A3AqEQCIOVqwiYoi534t7i3znCh4zyv4CJRqgyoE3EOpkYMrTZ
 lDfIsmp57GQfTe5JTxzmi/fc3lwT7tLjGF74yaufEF1rvQAUMMqNKEa1sFSobWRu/6D9eG
 lqeZoqJ5fyRAamtju51WZ2dRZHV5TPS3r2tilL90sSalGnycgmWNInQKW2rsbQaLG375Zv
 JmxDO2AwNPKNjp+6+pjC7tHvMy+t8NibTa5JawE2k0m7gshtRpyp97CDO+4FrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maschinengott.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maschinengott.de header.i=@maschinengott.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=v/jbg1Ke
Subject: Re: [Buildroot] [PATCH] Documentation patch with some small things
 that threw me off as a newcomer to the project.
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

Could somebody take a look at this? It might not be much, but I think 
it's still a big improvement for newcomers to the project. (Especially 
the change in quickstart.adoc.)

On 22.11.24 23:31, j12i wrote:
> From: j12i <j+buildroot@maschinengott.de>
> 
> This is my first contribution to this project and at the same time my first time using git send-email. Please tell me if I'm doing it wrong, but don't get angry at me.
> 
> This results from a conversation I had on IRC today with xogium.
> 
> The change in docs/manual/getting.adoc is in reference to the following section in docs/manual/contribute.adoc:
> 
>> Refer to Chapter 3, Getting Buildroot for more information on obtaining a Buildroot git tree.
> ---
>   README                       |  2 ++
>   docs/manual/getting.adoc     |  2 ++
>   docs/manual/quickstart.adoc  | 11 +++++++++++
>   docs/website/contribute.html |  2 ++
>   4 files changed, 17 insertions(+)
> 
> diff --git a/README b/README
> index 008e996f5f..2fa1905f6b 100644
> --- a/README
> +++ b/README
> @@ -7,6 +7,8 @@ Online documentation can be found at http://buildroot.org/docs.html
>   
>   To build and use the buildroot stuff, do the following:
>   
> +0) (if you want to build an image for a specific board, run
> +   'make <whatever_board>_defconfig' to have starting point)
>   1) run 'make menuconfig'
>   2) select the target architecture and the packages you wish to compile
>   3) run 'make'
> diff --git a/docs/manual/getting.adoc b/docs/manual/getting.adoc
> index 51c97d5793..f338fef2d6 100644
> --- a/docs/manual/getting.adoc
> +++ b/docs/manual/getting.adoc
> @@ -10,6 +10,8 @@ November. Release numbers are in the format YYYY.MM, so for example
>   
>   Release tarballs are available at http://buildroot.org/downloads/[].
>   
> +https://gitlab.com/buildroot.org/buildroot[The git repo is on Gitlab].
> +
>   For your convenience, a https://www.vagrantup.com/[Vagrantfile] is
>   available in `support/misc/Vagrantfile` in the Buildroot source tree
>   to quickly set up a virtual machine with the needed dependencies to
> diff --git a/docs/manual/quickstart.adoc b/docs/manual/quickstart.adoc
> index 605031037f..42cd72a88b 100644
> --- a/docs/manual/quickstart.adoc
> +++ b/docs/manual/quickstart.adoc
> @@ -8,6 +8,17 @@ is no need to be root to configure and use Buildroot. By running all
>   commands as a regular user, you protect your system against packages
>   behaving badly during compilation and installation.
>   
> +[NOTE]
> +====
> +This chapter just gives a general outline of the process to build an image. To build an image for a specific board, run
> +
> +----
> + $ make <whatever_board>_defconfig
> +----
> +
> +first to base your work upon.
> +====
> +
>   The first step when using Buildroot is to create a configuration.
>   Buildroot has a nice configuration tool similar to the one you can
>   find in the http://www.kernel.org/[Linux kernel] or in
> diff --git a/docs/website/contribute.html b/docs/website/contribute.html
> index 52c30d60d3..4155fb96da 100644
> --- a/docs/website/contribute.html
> +++ b/docs/website/contribute.html
> @@ -26,6 +26,8 @@
>   	  your own patches</a> through the
>   	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
>   	</a></li>
> +	<li><a href="https://gitlab.com/buildroot.org/buildroot">The git repo of buildroot's source code is on gitlab
> +	</a></li>
>         </ul>
>   
>         <p>For more details on these topics, check out the

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
