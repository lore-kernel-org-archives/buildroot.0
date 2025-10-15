Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8513CCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6963D410EE;
	Wed, 15 Oct 2025 07:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbLzvv1feyDX; Wed, 15 Oct 2025 07:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0721410C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0721410C4;
	Wed, 15 Oct 2025 07:06:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62D254C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 490B7410C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLDqW5ZrODEE for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:06:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47258410BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47258410BD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47258410BD
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:06:55 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1629409824; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Oct 2025 07:06:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v8vb1-003aTc-2n;
 Wed, 15 Oct 2025 09:06:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
References: <20251014185910.677375-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 15 Oct 2025 09:06:51 +0200
In-Reply-To: <20251014185910.677375-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Tue, 14 Oct 2025 20:59:10 +0200")
Message-ID: <87tt00skxg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=DW7yb0bsvYKN8YsKW7E6DHivmT6bgrOLHLra2QiLszD1hWi0vLWxbPLx93t5vz6qNc5J+/ZoduoJGqXCNqzKthbZlTYknMRhp65UPfI78tSaAnUD2uCR+EFocJz/CVEc4qBWN/UWvx0ZXPjRg2BhEWcE2kqgnnPLXqAeHlgfWpnaXBlOEuL49j70lV9vOs6vugAZ0HIdnm3NcsnBlnmRMLCxY9m5Nktj1ctm0o8bewAJ+AD/RI+eHhXM0y+UXKvGneJZ3Ad8U4Oh0gl0Y7WsK7wYQ8B3Uizv0y9sMojr6BQu4Pg7AsZVB6Rdj9yVzrY7qFEzHcappu2NywuKZ9nSaA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=8IzCNfayXZpDdLvorD74JyX1pAqyC3U5UHs1hX+P/+8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=DW7yb0bs
Subject: Re: [Buildroot] [PATCH 1/1] package/iw: bump to version 6.17
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

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
