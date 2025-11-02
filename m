Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB06CCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 19:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A12384E26;
	Sun,  2 Nov 2025 19:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJrhHH39A-Yq; Sun,  2 Nov 2025 19:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E25E84DFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E25E84DFA;
	Sun,  2 Nov 2025 19:40:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E6B52A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9058E608DA
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3A_AptdKO1S for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 19:40:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08FDA608D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08FDA608D8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08FDA608D8
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:40:33 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 912168715; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 02 Nov 2025 19:40:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vFdwA-000txk-0s;
 Sun, 02 Nov 2025 20:40:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251030202646.1825077-1-bernd@kuhls.net>
 <20251030202646.1825077-2-bernd@kuhls.net>
Date: Sun, 02 Nov 2025 20:40:26 +0100
In-Reply-To: <20251030202646.1825077-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 30 Oct 2025 21:26:43 +0100")
Message-ID: <87seew9qad.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=USYgUnbDFuIjCunqMroxUs936JgWh6DFVFWsYKlwHDBCK3LNO5nzPtcaF7efIqAcYHaE1egwFYk0snH6B5KFI6LsC4Wx3JoFpIPAvGu9IVBUFtS9xhMKahZ2vaToOuxIvBZ2ct37na3/CN8hijYRDzGKxqxwoK34S3nW3E4rP336SQ/LiRuV6EM5j4plW+LA1Jsqm6/Kvz0/LmLFUMQS0bolI70Jc8K2yuKGhy6oNogl+LktGzTDQ8pbo0hAMeVy0gpAaKFTcsyKMksxVzK+lwXvLYsrIXERpcHEjKRfYj0Ah8CFlcxhfAo6UjezlunZfzwXbBQRh6OvSXHjneczNQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=H+frv+xeGnu+tz4BFMo9J6WGQ2VRZsnVQMtjgY9Pafs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=USYgUnbD
Subject: Re: [Buildroot] [PATCH 1/4] package/ramspeed: remove package
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > The download location is gone and even though the package is available
 > on a Github repository [0], it has not been updated for 7 years now.
 > Drop the package.

 > [0] https://github.com/cruvolo/ramspeed

 > See buildroot commit 0951e3fc24492267675f2bb81f65cd0ff5bb758e for the
 > removal of the ramsmp package which is the SMP version of ramspeed.

 > Fixes:
 > https://autobuild.buildroot.net/results/d40/d404da1c3a7cd8628d2b2e9e519d629626d28593/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
