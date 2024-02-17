Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902A6C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60D1C81F36;
	Sat, 17 Feb 2024 16:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heqRBTEMJkjL; Sat, 17 Feb 2024 16:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F03081F3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F03081F3C;
	Sat, 17 Feb 2024 16:05:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC3E41BF3E0
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8ADB81F3C
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjRQZMgecTI7 for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:05:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79BEE81F36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79BEE81F36
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79BEE81F36
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:05:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1D42313F838;
 Sat, 17 Feb 2024 17:05:15 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50858])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 Feb 2024 17:05:15 +0100
MIME-Version: 1.0
Date: Sat, 17 Feb 2024 17:05:15 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
In-Reply-To: <20240215142413.451505-2-gilles.talis@gmail.com>
References: <20240215142413.451505-1-gilles.talis@gmail.com>
 <20240215142413.451505-2-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.5
Message-ID: <e4dae4ed19e6a3baffd62ff5a9c4f3a3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708185916;
 bh=97N1/PbmSP7BhRaDYFDENLA7uDS9SmOWdqdx7BRzJ7M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YJFwiB9bBaGOgP7eYY0ROYxDa1JVu+qWti7YyCgLysk2kkV3r/EDyJQlpR/xsF4vH
 KUBO1qrtl8GU/+X55mTS5raP3sQBux/tF9VKrBT9Fvb6JFO+xXYmUcS8VQWjVOHVxa
 V7PwYyLXYI0UWpChcQoBtBmKhwfEL9fRHbPAu3K1zIqzxY8QkimWtxe0vCs9hs5KXs
 1U15r1DVwJqwY7f127VNWFxi15Yt0LFRISSwRY5+rMWjiINHbhkIAwK61wRTArDTq5
 ak49MuN7hz6cSqoUlQsCZTcjzyRO0YEuYzTfCptrgD+1SvzLdasufu7xqkmPKnCxvj
 iLtGDdLD+hrEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YJFwiB9b
Subject: Re: [Buildroot] [PATCH] package/iozone: bump to version 3.506
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Gilles, All,

Thanks for the patch!

I have few comments:

Could you add a reference in commit log to the upstream change log?
For example:
"""
For change log, see end of file:
https://www.iozone.org/src/current/Changes.txt
"""
This helps a lot for later analyses/debugging.

Also, the upstream archive of this new version seems to include
the license file. So the comment can be removed, and the license
file added (see later).

Finally, could you add a comment in the commit log that:
The upstream archive format changed from tgz to tar.
(just to record this is not an arbitrary change).

On 15/02/2024 15:24, Gilles Talis wrote:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  package/iozone/iozone.hash | 2 +-
>  package/iozone/iozone.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
> index 9ecf1d1af8..c506b41db2 100644
> --- a/package/iozone/iozone.hash
> +++ b/package/iozone/iozone.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  
> 5a52f5017e022e737f5b55f320cc6ada0f2a8c831a5f996cce2a44e03e91c038  
> iozone3_493.tgz
> +sha256  
> 114ce5c071873b9a2c7ba6e73d05d5ef7e66564392acbfcdc0b3261db10fcbe7  
> iozone3_506.tar

The license file hash can be added here:
sha256  bff7909fd698708d15613a4fb977a193cff98f44ef170c2dc1dd502974df75b2 
  docs/License.txt

> diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
> index 2df4a2aa84..7cce15c53d 100644
> --- a/package/iozone/iozone.mk
> +++ b/package/iozone/iozone.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -IOZONE_VERSION = 3.493
> -IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
> +IOZONE_VERSION = 3.506
> +IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
>  IOZONE_SITE = http://www.iozone.org/src/current
>  IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
>  # IOzone license details can be found at:

The license comment can be removed here, and the license file added:
IOZONE_LICENSE_FILES = docs/License.txt

> --
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
