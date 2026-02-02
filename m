Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6308EE7DF08
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BB6A40BA3;
	Mon,  2 Feb 2026 16:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cju2b9otRPYq; Mon,  2 Feb 2026 16:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D1B840BA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770050685;
	bh=xD9tQgzjdvr9C/fKhSvVFko83u64iWl8hcqYlge1WLw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TOLsZWHapLWXV5TGHXMuPXzWpyJoC58kYh6aGRAcOoLa12r/Sc/DM5hfEUDN0060p
	 kRjNQQOCwyTh+TBAh3u/9SIxuJ0C7rBBGswmeLvUpHhl96uGLdVxavCT9wx5gYxK06
	 1Vy6zhFB9t9EwLtcccFbCGA6R6gkkSOUbLqFnhp+EctgE8ujDkHSVYdBlYm2/uYXy0
	 N4l21dspIcackZRflXmpFHLzlwdCrNhY3ytdPCbgZQ6d5E8Mx62gMRxckFBTbGu0M3
	 FALSjJBibdwTeXZDqzc5MASkKK44T2tQ7wULMWyYQidYguLTxubPImmwn5oEzTMpOP
	 3zsqYkellXXhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D1B840BA5;
	Mon,  2 Feb 2026 16:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4C87149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B22A54032E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVfaDs3sknD3 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF18F401E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF18F401E1
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF18F401E1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:44:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6F0C04E423C1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:44:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 45E1660767;
 Mon,  2 Feb 2026 16:44:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0595C119A8888; Mon,  2 Feb 2026 17:44:36 +0100 (CET)
Date: Mon, 2 Feb 2026 17:44:35 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 Marcus Hoffmann <bubu@bubu1.eu>
Message-ID: <aYDUUf6FTJtgvb3J@windsurf>
References: <20251021120548.1534100-1-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021120548.1534100-1-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770050678; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=/fJPF2gCQ2xxkrme6ULfBhhy08YBjWAA2Nd/+wDCMks=;
 b=DrlDw9ABO7YjOtFNLSusJ/MbtDmnZ6XgIp/CdejkRrcYkEzjs8aixoulXbCiB+y1b5SoJa
 CEccx3DJk4XJRUMfnWTgcXfxE/0XkdELce8nN44N0Rwcz/JXU2JwxpOZFgJ+GbbeZWtzeS
 Xss8lZ0qIHMn8Jcg+22ScdHs1/B6qigZGDYzFsoLlQeWoifhC+JIBaclTVJyKOEvoEE5yl
 cySYDv7xtICtP8+3PS+13jqMjlRKdjvowv+b+UdarCAQ5ZyzrOI6cV2jbyH5GOmzF5hp8A
 G9ZsvWAr3O4ZhqOtov44+qViqxhbKLaW8KuFug5wlvv9QyN7fk7vW4ubvCt4pA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DrlDw9AB
Subject: Re: [Buildroot] [PATCH v5] package/python-diskcache: new package
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

On Tue, Oct 21, 2025 at 02:05:47PM +0200, Marcus Hoffmann via buildroot wrote:
> The package imports itself in setup.py to get the package-name and
> version number. Dping this during the buildroot build would require
> buisling host-python with sqlite support, which we are currently not set
> up for. It also seems wasteful for just extracting the version number
> and package name, so instead we replace the import by using a hardcoded
> package-name and the version number stored in buildroot.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Thanks a lot, applied! I only adjusted indentation in the .mk file and
added a comment above the hook to explain what's going on.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
