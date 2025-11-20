Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E2ECF9C56
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 16:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F485806EB;
	Thu, 20 Nov 2025 16:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9vFnvXdbb_i; Thu, 20 Nov 2025 16:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53E4B84805
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E4B84805;
	Thu, 20 Nov 2025 16:59:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 140EF158
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06ADD410D4
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcVWfOmoMb-u for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 16:59:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC717410C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC717410C3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC717410C3
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 16:59:16 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 727942702; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Nov 2025 16:59:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vM801-00000003qRX-3n47;
 Thu, 20 Nov 2025 17:59:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Sen Hastings <sen@hastings.org>
In-Reply-To: <20251119213420.7480-4-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Wed, 19 Nov 2025 22:34:19 +0100")
References: <20251119213420.7480-1-thomas.perale@mind.be>
 <20251119213420.7480-4-thomas.perale@mind.be>
Date: Thu, 20 Nov 2025 17:59:13 +0100
Message-ID: <87wm3kk5cu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=RzqNru5GrJWmH5KF0o12YSmRiXHPjN0mi12305gYFf5w5H8os4lj5uMQMAsUbthcFF68D2+PPXW0HFOZOVHAaB5nq8c1YPj4fLd6rCjCPoVv+J4oFO1GwWiA1U64e069Xkto1ngnUT3wNuTWKeGc8c0MWrbNm7eJA6b5c+hN/83u4bw7RBHxbazK/s/6Hbhnp0YpaDKMRMgf/2f9IpJaLxg8SY8zRhDWbP6GQTZFUT7eLBf0LcRt6XV6lF/fc96TwbuK1fKlKSALjpLjnqebswJrBfOHgzFCGKWxgx7QKB+d/jWHPXwhDKipcmpnJG2fxbdjV0gW0nw7Rl2iLP+AEg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Y2Ht1v8tiM4fg/+a/Bhb8m+nIsg3jQT9rQXUGCSUIX0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=RzqNru5G
Subject: Re: [Buildroot] [PATCH v2 3/4] DEVELOPERS: add Thomas Perale to
 cve-check & cve.py
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
