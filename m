Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F601E9D40F
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F82060ACD;
	Wed,  4 Feb 2026 16:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FD35bgN_TePj; Wed,  4 Feb 2026 16:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7266F60BFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770223288;
	bh=cCMslqjtOlU2Gj2I8XSVgOX27/+aVFZEMe4w2ucqYPI=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Zzzap6h5c43VXR5Bb1omMRmRI/9FCykonKHoOji1WSnkS9cStzs93qXduZqSjhSum
	 N7keEs3a1LQhYyTnp1DgiTg7LVlwKK0CVsYRvrRBDASokF4DlQvkh1gizRSbb7DW75
	 DaloJWUiqKPR7+t4HIVIrUvcoM/HhOyxEzUL0sWXBeJ1NZujPBFp0zs7kXoQYAgI1k
	 Yg3r1sXMXKyx717H7PzGhUebv5/kiLnMZAzggL/79KIoZg79zZ0tE1rAHUWJ3SZnpA
	 gtG//xFZh+S9E7LXSiFqXxzHbgmIILJZC3pbUL/5SW2GY61kNPgYSiWHjczpDLDXIu
	 uaaRgeGCVrZTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7266F60BFD;
	Wed,  4 Feb 2026 16:41:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2317D173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C7B160BFD
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5P12AzMnkT8P for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:41:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7587660ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7587660ACD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7587660ACD
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:41:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 504708842; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Feb 2026 16:41:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnfwO-0000000DVU7-1iIz;
 Wed, 04 Feb 2026 17:41:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
In-Reply-To: <20260204144024.2336976-1-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Wed, 4 Feb 2026 15:40:20 +0100")
References: <20260204144024.2336976-1-buildroot@heine.tech>
Date: Wed, 04 Feb 2026 17:41:20 +0100
Message-ID: <87ecn0folr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=r9xfBu8qiyQBpAypruykUoNr9eGzwdU0EI+/GgYCTJvb4StpKo441BfTDvsoJnIB2UzLtuBw5ReGILEAGWGqmMNQpnlidP9JnzdvU+6JZgUcuysAphp5LXti8Aau8Ox+jK3SCiIM+xuYHpAJ8ljnsMfHi+5Gi1T8A7wrs5O09iPCEQ5kE7yfjJWBNP+HW7jWPW3FdB7Sopv0elupso7CBZsRYgEVyuf+tZoZKHh0zQe6Ru3JTbZvnODtYXhX4LxeQo0deEfyHiq2Yzs73uTdflzWCDt2bfFLEIpi4diEGYRSVHxHyDNKWCw490x7MuaFBLOeCanYXLXt3W/aFHv6Tw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=ditBxGBH4ySXwXqweaa4cRG7FtyTWV8J6kYYvT/WZfI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=r9xfBu8q
Subject: Re: [Buildroot] [PATCH] package/azmq: disable tests,
 drop Boost.System
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
Cc: RJ Ascani <rj.ascani@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@buildroot.org> writes:

 > When bumping to 819b24035cfa5b73081e21f5867445f2344f680d two things
 > were missed:

 > - the parameter to disable tests was renamed to AZMQ_BUILD_TESTS
 > - the commit [0] was included. It removes the need for the Boost.System
 >   library linkage

 > Fixes:
 > https://autobuild.buildroot.org/results/2e7/2e7fe61cc349b843604091190fa7346f95dd0d56/

 > [0] https://github.com/zeromq/azmq/commit/b8b2a1aac47f8da70bc4d2d1c2f5d9a9ceaec748

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed after rewording the commit message a bit, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
