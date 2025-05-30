Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BB1C5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 22:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6234760FF4;
	Fri, 30 May 2025 22:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hp5h1qpeNBo; Fri, 30 May 2025 22:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70BE560FDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70BE560FDA;
	Fri, 30 May 2025 22:11:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CEA4234
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F24B9400F4
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZftc4qaGNAJ for <buildroot@buildroot.org>;
 Fri, 30 May 2025 22:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B63E40054
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B63E40054
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B63E40054
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:11:39 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 9D080E0023B; Sat, 31 May 2025 00:11:36 +0200 (CEST)
Date: Sat, 31 May 2025 00:11:36 +0200
From: Florian Larysch <fl@n621.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <20250530221136.jnf4d76j4fidh6aw@n621.de>
References: <20250527152342.4288-1-fl@n621.de>
 <20250530220125.3b1c7c5f@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530220125.3b1c7c5f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748643096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TMS20T1FbadFhNdrrRjnMelYkxpHc5nkqvO1DfAjTlU=;
 b=LYOQnaQ15LM0HzKEKJehIeQE2AXnxzG4Pg+yw9a6FpJOg+vbHsSs4YKh63HZRJ/CtW3FD/
 YCQbwkyrXG97oE9K+LewkLXm+YI4GtwJqKFmc0IGdkcsKi0tkZ699mgmWwinYoXe+itKkY
 q5AO4nDB9frG131yVwIGyakvsE5Jrlw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=LYOQnaQ1
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: make
 cryptography library optional
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

Hi Thomas,

thank you for your comments!

On Fri, May 30, 2025 at 10:01:25PM +0200, Thomas Petazzoni wrote:
> Indeed, we have two conflicting goals:
> (1) Not break backward compatibility. [...] 
> (2) Have minimal dependencies by default [...]
> And I think my preference goes to (2) in this situation.

Okay great, I think that's the preferable option too if breaking
compatibility is fine. I'll send a new version of the patch.

Is there a list of breaking changes I should add to?

> We might discuss whether gnutls should take priority on libnss if both
> are available. Maybe NM documents that one is "better" over the other?

I haven't found any explicit statements to either effect. Support for
both libraries has been present from day one back in 2007.

Data points in favor of libnss:

 - It's the default value in the NM build system, so it would be the
   preferred backend if both are available

 - It's probably the more mature of the two, given that it's being used
   in Mozilla products

Data points in favor of gnutls:

 - While both backends seem feature-equivalent, the
   _nm_crypto_verify_pkcs8 function is stubbed out in the libnss code[1]

 - Both Debian and Fedora explicitly select gnutls in their packages. I
   can't find the reasoning for Debian but at least for Fedora it seems
   to have been a conscious choice[2].

Given what it's actually used for in the code base, I don't think the
choice really matters much when both options are available. I'd slightly
lean towards gnutls just because it's marginally more feature-complete.
How do you feel about this?

Florian

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/36f8de25c487fe1570a19fe917c85ec065b0339e/src/libnm-crypto/nm-crypto-nss.c#L523-540
[2] https://src.fedoraproject.org/rpms/NetworkManager/c/29a9c41beafb5e549c10bfb50ee23ee47bdbc42f?branch=rawhide
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
