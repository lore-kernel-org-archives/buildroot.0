Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4B7C7115C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 13:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285A040757;
	Wed, 25 Jun 2025 13:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCeQagTPm_-j; Wed, 25 Jun 2025 13:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B5C44072B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B5C44072B;
	Wed, 25 Jun 2025 13:55:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B3CC154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 184136150A
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIN4JwRm_J2U for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 13:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1CED61473
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1CED61473
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1CED61473
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:55:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2137360548; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 25 Jun 2025 13:55:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uUQal-000VWk-0J;
 Wed, 25 Jun 2025 15:55:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>, linux-amarula@amarulasolutions.com
References: <20250625063302.3663685-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Jun 2025 15:55:11 +0200
In-Reply-To: <20250625063302.3663685-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Wed, 25 Jun 2025 08:33:02 +0200")
Message-ID: <877c10rkn4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LLuDiVJThN5iAIGPJtnLItZnf62zmW1ub6jkitwNky/oMAi4ldDorVM1TJQ3RAtJ/KJEFeAeKiwSBKhiyV1OFtSAso3mo7fXV7Tw63Dbs78sHeTXc36MMN5rXv47lVXZu0ln9+QtrKdytPqYUIrbAqEQZ/6WXA4V3/MoRr29gz9T4bTdmjBClVO5TUSLld2zU4LJkuqsb8C3IlOuzxbROko3pRrfAmbtoH+WKZ8NtZ0+7cQj/JoQQfsIGoI6U9nMDL4hmWtTfE1sQ1EmoOF5cBDsTZo+ML0JtHHDWDd+qCLUyLokLgd/0QvxirdYIFsHgf6+nmArF4HviIptQP3ftA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=jAMtw9bfOg01QV1kk4Oh4vr5YUY7BEHbjpUY6FhwTm8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LLuDiVJT
Subject: Re: [Buildroot] [PATCH 1/1] package/mmc-utils: bump version to 1.0
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > This is the first tagged version of the package, so replace commit SHA
 > with version tag.

 > Change log since last version bump:

 >   d8a8358a7207 mmc-utils: Pass key_mac buffer to rpmb_get_key()
 >   a23ad7875b89 mmc-utils: Start to use the generic print_usage function
 >   e769d44ecb77 mmc-utils: Introduce a generic print_usage function
 >   6586fa5535dc mmc-utils: Simplify and streamline print_help function
 >   ec75d4b3b671 mmc-utils: Remove unused adv_help member from struct Command

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
