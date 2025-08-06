Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14DDC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 13:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5083041A79;
	Wed,  6 Aug 2025 13:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HuTHnKJOb_Y; Wed,  6 Aug 2025 13:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E55C41AAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E55C41AAE;
	Wed,  6 Aug 2025 13:22:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5314E233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39A7641A79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZtvVinmdDCt for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 13:22:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 943BB41A53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 943BB41A53
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 943BB41A53
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:22:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1341767802; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 13:22:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uje5w-00GiqN-1U;
 Wed, 06 Aug 2025 15:22:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Aaron Sierra <aaron@bubbl-tek.com>
Cc: buildroot@buildroot.org
References: <20250716185626.365031-1-aaron@bubbl-tek.com>
Date: Wed, 06 Aug 2025 15:22:16 +0200
In-Reply-To: <20250716185626.365031-1-aaron@bubbl-tek.com> (Aaron Sierra's
 message of "Wed, 16 Jul 2025 13:56:25 -0500")
Message-ID: <871ppok2k7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TMcQ6E7BKp30Z1RVzDxnVq2m1ATv7dzVcITU9iYjjQcvQGbF705AipUPQm+mJ5y3wS9jgYMAjqbaAjLnOoZjDHB0f6mWXCwiQ3tVIiEvwJNyWUMFWJTEw62nbx1o11lUdwdnSz9DDmMHNOBbI37TjvOVhUK3sp+QyICHHwAKqPiRY6z1it1voXeVK9jkuxQBpr6KzFiNIu+FY+XieUZ/SSMZEhHRROqomL1rcjlXKhtXqo3/iue+M+d16eo4SOrT4UfHnNDzKtAe7/TxdJHKkxVKEfV1asKL4nlt2r0yvbUwwlrRKZJpKZWrBa00qHrTM6OzJSsAQh/r8sw+RLp0bA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=d4k/jluF5J9PYcbaRuHK/rtrlFlQyZLpAZ/rx+QyhCM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TMcQ6E7B
Subject: Re: [Buildroot] [PATCH] package/xinetd: fix build with musl
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

>>>>> "Aaron" == Aaron Sierra <aaron@bubbl-tek.com> writes:

 > The ecvt(), fcvt(), and gcvt() functions from stdlib.h, used by the SIO
 > library packaged with the xinetd sources, are masked by _GNU_SOURCE in
 > musl libc.

 > Signed-off-by: Aaron Sierra <aaron@bubbl-tek.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
