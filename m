Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AB5C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96328407D0;
	Fri, 16 May 2025 17:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81YM1TQd6Pzu; Fri, 16 May 2025 17:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C87ED4179E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87ED4179E;
	Fri, 16 May 2025 17:59:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E95C2185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA5C2612A5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hoINaC88gHa for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 090FA612FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 090FA612FC
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 090FA612FC
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E931E1C1104; Fri, 16 May 2025 19:59:31 +0200 (CEST)
Message-ID: <2e0a1a9d-4779-474f-a622-e97417fa9339@rnout.be>
Date: Fri, 16 May 2025 16:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20250108105155.147046-1-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250108105155.147046-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418372; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Xhiz9ww1CMlIyt+fNwm9uEpef2atQexAaurniXjhxNw=;
 b=m3Q+AfDp0mhm9m1PWKRvn8pIMcXHAQnH3qRUII4nF3nlGJ02/TBEZYvjA6xjH54pXzgDyL
 dhHcejefWqbGNMNLDIRYryeiro4ZYc9ufkAEu6GrluHKG9WSxf+1LexVisXLG0kP+0laki
 Td2WupJyUs8wgb7ejgoonHW2VU2hTHVBF7+6ZZztKe+BovDr1Aw03J4ON2vtl4MLyVcHyH
 Ii4+zHXoL93dFPuSMbt1Lbs0w8frGSP5oZqq2+s+mDca1TSd2XCUrRtDh6xzbfuontWg0O
 kKnIGxQ5idjVSFfw1trP/CP/MXNMm3iiWr1sQW/1e3yEXDI9N39Glx1IUI/BtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=m3Q+AfDp
Subject: Re: [Buildroot] [PATCH] docs/manual/adding-packages-python.doc:
 clarify how _BUILD_OPTS work
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



On 08/01/2025 11:51, Marcus Hoffmann via buildroot wrote:
> PYTHON_FOO_BUILD_OPTS are passed to the build module call of the package
> build, this allows passing options to the python build *backend* by
> using the --config-setting= option. setup.py is no longer involved since
> even the setuptools backend now used the pep517 build method.
> 
> The note about the options being passed to
> support/scripts/pyinstaller.py seems to be no longer accurate.

  Your SoB is missing. I added it, you already made plenty of other 
contributions with SoB that suggest you actually did mean to add it. Please 
confirm by replying with your SoB (so that it is tracked correctly in the 
mailing list archive and in patchwork).

> ---
>   docs/manual/adding-packages-python.adoc | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
> index b42c06e54c..43cf0baed4 100644
> --- a/docs/manual/adding-packages-python.adoc
> +++ b/docs/manual/adding-packages-python.adoc
> @@ -128,10 +128,8 @@ therefore only use a few of them, or none.
>     and +HOST_PKG_PYTHON_PEP517_ENV+ (for flit/pep517 host packages).
>   
>   * +PYTHON_FOO_BUILD_OPTS+, to specify additional options to pass to
> -  the Python +setup.py+ script during the build step, this generally
> -  only makes sense to use for setuptools based packages as flit/pep517
> -  based packages do not pass these options to a +setup.py+ script but
> -  instead pass them to +support/scripts/pyinstaller.py+.
> +  the Python +python -m build+ call. To pass additional options to the
> +  build backend use the +--config-setting=+ flag of the +build+ module.

  I also mentioned -C as suggested by James.

  Applied to master, thanks.

  Regards,
  Arnout

>   
>   * +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
>     +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
