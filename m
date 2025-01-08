Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4765CE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1220D80B29;
	Wed,  8 Jan 2025 21:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dywUrlATR22u; Wed,  8 Jan 2025 21:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DEFF80B28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DEFF80B28;
	Wed,  8 Jan 2025 21:12:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5CFE1FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D486780B28
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1MkVpFGKvk8 for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07B2680B0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07B2680B0F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07B2680B0F
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:12:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -571025575; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:12:31 +0000 (UTC)
Message-ID: <d45c79dd-d470-43c5-8b42-5c7193bfb44a@korsgaard.com>
Date: Wed, 8 Jan 2025 22:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>
References: <20241218-uboot-bump-v2-1-0692ca1c4dcd@ti.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241218-uboot-bump-v2-1-0692ca1c4dcd@ti.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=W09izikF4oLHOKwvq+SuOs6nPHEg1HBzSCfdQqIU0ciHbHiI1kU+7T0uEfCD7fhjXqomz+uM9FzS6KiBbFL2viNJwbAC1YPgUX/u8UVNP6iWAu05x2jY5b28SyRbmuVCr06Jibao59I4aJuKG6vA2E0PGdnQTlRwWDEHhn6YNWgZ4M4bFBguzsY3F17rv99R7KiRG1Yp2ufTKYp7XPtmJNlujyEZH9D4NYrJJ4CkiAznGcdnmsQCzjdeyDdNKvJcmhiBzqf1BRrZ+u2UpnHXbz7Clw0JTmDShh+hEDcEBCwoKLYX/QMyY0caUtCLFY50va0VXybNPxZvVIzV9YJj+w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=qMTFbjhH2ixx4hpKE2Fp1uhkGZ5nGX3BFEwu/E2zg/4=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=W09izikF
Subject: Re: [Buildroot] [PATCH v2] boot/ti-k3-r5-loader: add host-gnutls to
 dependencies
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

On 12/19/24 01:37, Bryan Brattlof via buildroot wrote:
> Newer versions of U-Boot will require the GnuTLS library to be installed
> on the host machine to build the mkeficapsule tool for U-Boot's image
> packaging phase to generate the final capsule for all the boot images
> including the tiboot3.bin image.
> 
> Add host-gnutls to the list of dependencies.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes in v2:
> - elaborated on commit why host-gnutls is required
> - Link to v1: https://lore.kernel.org/r/20241210-uboot-bump-v1-1-baeb59feef61@ti.com

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
