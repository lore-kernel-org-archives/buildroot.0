Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A56DC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FC2F81975;
	Sun, 18 May 2025 14:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKMtfqWmnVUu; Sun, 18 May 2025 14:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E0E380C88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E0E380C88;
	Sun, 18 May 2025 14:45:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF25E1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A49E360AB4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suibDllPA43h for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:45:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADA9F60B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADA9F60B93
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADA9F60B93
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:45:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 941D01C102D; Sun, 18 May 2025 16:45:49 +0200 (CEST)
Message-ID: <81840f07-59e9-4eb1-a4ae-dcc525c8399b@rnout.be>
Date: Sun, 18 May 2025 16:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20250508123205.1559-1-br015@umbiko.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250508123205.1559-1-br015@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579549; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qFPSvRKT144F/a2V1TyQKNWyGJ1aD+RG1Re1qD5BmmQ=;
 b=MfQMih7Wigo+so0xpdeoG37CAGhD6lErUql4qsEE0/OZigX6SYW5B5B9xT2q4LYRwgeSdU
 bJoNdB9f3V3HQan3jS9nEnEhBO1UCDE+SeEADsvoTCPf5HB2XdxsWyCGh5Ws7a6kLQG0dW
 qpbBBNs3JIwlh4lk/x3oWui4tcyVgTTYzAlF9KDGQnTjh8fj4Zdr98E1d12yTEk2poO4Xy
 MR0v2qhZpIuvreFT3KRDGk7jpYrZ4O5iKMtx1PiCf8WotLikIfc4iH1W5Zn0dqu90tppDj
 FpUaikyx5ZDWkW3Eam3/W+kJw3UUlDe/1NO34R8Y7PP33QEQKigfOcjkAetQmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MfQMih7W
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update CPE/CVE information
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



On 08/05/2025 14:32, Andreas Ziegler wrote:
> Since 01/2023, MPD has an entry in the NIST database [1].
> 
> Add vendor amd product IDs [2] to mpd.mk and remove the now
> obsolete IGNORE_CVES entry.
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2022-46449
> [2] https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=musicpd
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/mpd/mpd.mk | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 6cae2845e3..35632f97b4 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -11,8 +11,10 @@ MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>   MPD_DEPENDENCIES = host-pkgconf fmt
>   MPD_LICENSE = GPL-2.0+
>   MPD_LICENSE_FILES = COPYING
> -# these refer to the FreeBSD PPP daemon
> -MPD_IGNORE_CVES = CVE-2020-7465 CVE-2020-7466
> +
> +MPD_CPE_ID_VENDOR = musicpd
> +MPD_CPE_ID_PRODUCT = music_player_demon
> +
>   MPD_SELINUX_MODULES = mpd
>   MPD_CONF_OPTS = \
>   	-Daudiofile=disabled \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
