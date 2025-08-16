Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8506CA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C4F61540;
	Sat, 16 Aug 2025 20:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vhEA1E6-UFG; Sat, 16 Aug 2025 20:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57B5361533
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57B5361533;
	Sat, 16 Aug 2025 20:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3671196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9A0D414B5
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJC95TIKRWLx for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:43:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E80CE4149F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E80CE4149F
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E80CE4149F
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:43:56 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id A0A03E00304; Sat, 16 Aug 2025 22:43:54 +0200 (CEST)
Date: Sat, 16 Aug 2025 22:43:54 +0200
From: Florian Larysch <fl@n621.de>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <20250816204354.sdds7hpjzb5n7bkx@n621.de>
References: <20250816195542.3748-1-fl@n621.de>
 <87bjofm36c.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bjofm36c.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1755377034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bwv45kHp+s6eQmOi0oUDCVGyDJoQXNHsGi28xLSfRYQ=;
 b=bvHgPIZfi1GamKaon4maY9cN7zc7KkQOx3Iz9PuZ6aa8jtOT6+9Fbw1eyeHAvURVZ7NTc9
 HsTFbmolBAiKtAei/cqSScM+3Xnl7w9Ylr2Acgz2DOR/L2aCWdsEnCienDxOzOMMA8y3kY
 vKIUFzMpLULyP2VLnK0Pmjk1skV/37s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=bvHgPIZf
Subject: Re: [Buildroot] [PATCH 1/1] package/libjwt: require openssl
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

On Sat, Aug 16, 2025 at 10:17:47PM +0200, Peter Korsgaard wrote:
> While it can work with the combination gnutls + libopenssl, would there
> be any advantage over just using openssl for everything?

I've been wondering about this as well. It seems that applications using
libjwt can select between backends using an API call[1]. There don't
seem to be any feature differences between gnutls and openssl in my
cursory reading of the code. Furthermore, I could find no public use of
the backend switching API beyond libjwt's own test cases.

There seem to have been differences in feature completeness in the past
though[2][3], so it's possible that this is vestigial and/or the author
doesn't want to break existing applications more than necessary.

We could remove it from Buildroot entirely (though libjwt will still
automatically link to it when it detects gnutls in its sysroot via
pkg-config[4]), but it also doesn't hurt much as it doesn't enable the
gnutls dependency itself, so the overhead just is linking another object
file into the library

Florian

[1] https://github.com/benmcollins/libjwt/blob/7363e617457f83d46186b3ae56407aa7ca1a02e5/include/jwt.h#L1693-L1703
[2] https://github.com/benmcollins/libjwt/blob/0f2f95310232a290c7672cdaf0d8003533013b5c/libjwt/jwt-gnutls.c#L160
[3] https://github.com/benmcollins/libjwt/blob/0f2f95310232a290c7672cdaf0d8003533013b5c/libjwt/jwt-openssl.c#L452
[4] https://github.com/benmcollins/libjwt/blob/7363e617457f83d46186b3ae56407aa7ca1a02e5/CMakeLists.txt#L37
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
