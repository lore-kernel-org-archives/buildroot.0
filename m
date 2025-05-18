Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AE7C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 846A880C7F;
	Sun, 18 May 2025 14:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgO_iDSx1HKG; Sun, 18 May 2025 14:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96AA3811CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96AA3811CA;
	Sun, 18 May 2025 14:45:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FA58DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BECF4092D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meZVPVV0GfWW for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:45:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 753284092B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 753284092B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 753284092B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:45:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87A611C1001; Sun, 18 May 2025 16:45:29 +0200 (CEST)
Message-ID: <80c46ae9-db37-4f9f-bc61-505563d34ccf@rnout.be>
Date: Sun, 18 May 2025 16:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250517102328.D506586E80@busybox.osuosl.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250517102328.D506586E80@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579529; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qQSHZw4kcVbjxJbyQBGHWiy26ERjT21mDu1Vfw30DaQ=;
 b=obX2j/x2/RUu0ehCLLjWpSjh07jXX8PDJLZxecwh+gefx7h8zSi3I/9I9J/yWHRZJPWSwd
 k9Hr6a9iwUzBnwKgMffWwOhxM4AtiaHMgRTclXAkGnLfpTuMdmhsU5jxxXkUDEm3iZDq3S
 XmZzIPFMaqc/Bl3twgb3evspx2frwzHa4KPjrOANRiZtQxJnhgRhnhEm2k5B+Sgxjpqn2/
 sJbd/ByGKXKbLWsOIuBZxtev/j0Q/1I6EHcNlDMglxIlFsrZdXyywdEJ/aTBjm2dDIhqoL
 cLhWJOX0+r3qc0cIsATwz3w+TYRlUG3o6RiRkDzjIXL7gM0dzPAskXUAnAs5LQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=obX2j/x2
Subject: Re: [Buildroot] [git commit] package/nodejs: add
 BR2_PACKAGE_HAS_NODEJS
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



On 17/05/2025 12:22, Thomas Petazzoni via buildroot wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=0bae9b29cd2a6008c5945747a45dfe8af54fae35
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Commit ccf3536fcbfb2f3744ef7ccf1ed1b75d6d1f22ac ("package/nodejs: make
> target nodejs package virtual") forgot to introduce the
> BR2_PACKAGE_HAS_<foo> boolean option matching the newly introduced
> virtual package, causing check package warnings.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/nodejs/Config.in            | 3 +++
>   package/nodejs/nodejs-src/Config.in | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 2a0074b5a4..4048e18bd4 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -87,6 +87,9 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
>   
>   endif
>   
> +config BR2_PACKAGE_HAS_NODEJS
> +	bool
> +
>   config BR2_PACKAGE_PROVIDES_NODEJS
>   	string
>   	default "nodejs-src"
> diff --git a/package/nodejs/nodejs-src/Config.in b/package/nodejs/nodejs-src/Config.in
> index 90b061f616..0428fe1f8a 100644
> --- a/package/nodejs/nodejs-src/Config.in
> +++ b/package/nodejs/nodejs-src/Config.in
> @@ -1,2 +1,3 @@
>   config BR2_PACKAGE_NODEJS_SRC
>   	bool
> +	select BR2_PACKAGE_HAS_NODEJS
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
