Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84FAC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 996FA6072E;
	Sat, 31 May 2025 16:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-fyTipNzmjo; Sat, 31 May 2025 16:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E530D60751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E530D60751;
	Sat, 31 May 2025 16:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C776235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 699C883B5D
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h84RZLdgdWoU for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF37483B62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF37483B62
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF37483B62
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:50:16 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id A7345E0049C; Sat, 31 May 2025 18:50:14 +0200 (CEST)
Date: Sat, 31 May 2025 18:50:14 +0200
From: Florian Larysch <fl@n621.de>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org,
 Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20250531165014.2npnkjv763aecffp@n621.de>
References: <20250404182407.45244-1-christian@aperture.us>
 <00fa5a92-a754-45a2-926d-e01cdabfe4cc@rnout.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00fa5a92-a754-45a2-926d-e01cdabfe4cc@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748710214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eqUGiyrYBu+PE6gEl3f0ynYizkKTAxG3hU246IL9V14=;
 b=RD9ilnc/k7fd7h8eXoqyGLe4gFls37/cLLIP/Y3lBM8F6rSHlxAGUUvWTNwJflMIDwrynZ
 glC6nzIbcmvgnkMeL52sfNksFdh5uLWBMxLqWKp8V7nScCl3vuEUUF29FadoMIBwOpYt4K
 eyMi7CwY9GlPJkP//+jpqwJpVmpoRkc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=RD9ilnc/
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-cmake.mk: force config
 version >=3.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/04/2025 20:24, Christian Stewart via buildroot wrote:
>    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

I've only noticed this patch just now. Doesn't this have the potential
to silently alter the behavior of packages since it effectively will
flip a bunch of CMake policies without anybody having reviewed the
specific CMakeLists.txt? This seems quite dangerous.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
