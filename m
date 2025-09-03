Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEDBCA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B33361652;
	Wed,  3 Sep 2025 16:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okaKwxTA7QFw; Wed,  3 Sep 2025 16:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0CF46F37B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0CF46F37B;
	Wed,  3 Sep 2025 16:19:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FAE910E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B44840CF7
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9M2azcp9orq for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:19:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79FC7418A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79FC7418A6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79FC7418A6
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:19:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1911275862
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:19:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utqCR-0010Ey-0e
 for buildroot@buildroot.org; Wed, 03 Sep 2025 18:19:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250901154711.719109-1-peter@korsgaard.com>
Date: Wed, 03 Sep 2025 18:19:07 +0200
In-Reply-To: <20250901154711.719109-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 1 Sep 2025 17:47:10 +0200")
Message-ID: <87h5xjmrus.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ddK7JMuspIHkx4z+RbS4ScVjpUFXHq1k0VqP8YnI+yI06MMz6wEaF29OH1EvtzGozzsJqiaQcOEZqR3LwP8G4casFsOoneK0aPr5vjo9n8gAxubYMPSwrzii+gK0rHfejpWwsecOzIoCip7di8lAxLEURBEC+rmsBTP1ki5PQEDX4zbhgEsbi4lgcz3vtB88qwqfQyO6EC7UTjrz+L1akzmD5uKeTtgzBGcZPvONtcvSBDBT4xKJQkRxXMv7/osk+UDOgsgEbobUl/zSZFN9D937JRWXtViGmTYNyK+/qBv4kOu5t0Ka/FyenDBEXYKOMXuEzTgUz3QKwVK7bqm3Ug==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=AGDXOdeTxHLn7GCuTuMwgT148K31Cqjh4bOmgSuxz5Q=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ddK7JMus
Subject: Re: [Buildroot] [PATCH] package/input-event-daemon: fix build w/
 gcc-15
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes https://autobuild.buildroot.net/results/7c3556ec16c28b61bda62156a3bee858cf80cd1c/
 > The source code uses empty argument prototypes, which changed behaviour in
 > C23 (default in gcc-15):

 > https://gcc.gnu.org/gcc-15/porting_to.html#c23-fn-decls-without-parameters

 > Causing build issues.  Latest upstream release is from 2010, so work around
 > it by forcing gnu99 mode instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
