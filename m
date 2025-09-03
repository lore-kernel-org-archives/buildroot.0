Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1815ECA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 19:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF540414BA;
	Wed,  3 Sep 2025 19:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMPY2sMZFRfz; Wed,  3 Sep 2025 19:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01ED7413EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01ED7413EC;
	Wed,  3 Sep 2025 19:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48C65111
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39E3F844FF
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAes15JF7rGE for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 19:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A38CE844F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A38CE844F0
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A38CE844F0
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:21:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2E2A9C8EC7C
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:21:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 25968606C3;
 Wed,  3 Sep 2025 19:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 614251C22DC75; 
 Wed,  3 Sep 2025 21:21:21 +0200 (CEST)
Date: Wed, 3 Sep 2025 21:21:21 +0200
To: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>, David Pierret
 <david.pierret@smile.fr>
Message-ID: <20250903212121.5fa1d5f3@windsurf>
In-Reply-To: <20250902134250.622347-1-elmehdi.younes@smile.fr>
References: <20250902134250.622347-1-elmehdi.younes@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756927301; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=J2VGjaL1p8XReBjcyIuoxIpCIUUNS2aCLYO6d3gLSqc=;
 b=lzxdZls23exWYmXLy1XAgshRBv5F/zQ9ByF8Cl7wHIs4zoTOlhHl0Iju7y2gIeNAGaW2Q3
 X1jykkrrp7c6PC1pwG2LPwRO/9BcV28pBHvTeoVLt97X4QJsAwomqv0ts7eXTNFwqUv0t4
 uGJs/IoU4cvGW+Xlgdrw4P5wchxjkiVu490pj0lGUy37lODdsGwZcqqMizVinCt5VuLlem
 OB+GiGXB4wRPnKEa7uO/FAIghT9g1Tnnjc0st4FewUGnsh8F1FE6QFa1ioCpTvF5DmWAHp
 26+K3T8ZlyIXPm/cwiDWNDXwXXYMdC4P0S98bNq5TdQ0y9nR14CcDJp8OMn2Dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lzxdZls2
Subject: Re: [Buildroot] [PATCH 1/1] package/bat: fix build with GCC 15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Sep 2025 15:42:50 +0200
El Mehdi YOUNES via buildroot <buildroot@buildroot.org> wrote:

> Bat pulls in the onig crate (version 6.4.0) through syntect with the
> default "regex-onig" feature. This crate depends on the Oniguruma C
> library (via onig_sys), which fails to build with GCC 15 due to C23
> keyword conflicts. Newer versions of onig fix this issue, but bat
> cannot directly update the onig version because it is pinned by syntect.
> 
> To resolve the build failure, apply a patch that replaces the
> "regex-onig" feature with "regex-fancy" in bat's minimal-application
> feature set. This switches bat to use the pure-Rust fancy-regex engine
> instead of Oniguruma, avoiding the problematic onig_sys dependency.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/?reason=bat-%
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> ---
>  ...ig-by-regex-fancy-in-minimal-applica.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch

Tested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

If you fix the autobuild.buildroot.net URL and clarify the "Upstream:
not submitted" tag in the patch, this is good to go for me as it allows
to fix the build issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
