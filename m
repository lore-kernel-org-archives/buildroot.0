Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E998CA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50D106F47B;
	Wed,  3 Sep 2025 16:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yatM1ziAs9pF; Wed,  3 Sep 2025 16:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91A9D6F490
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A9D6F490;
	Wed,  3 Sep 2025 16:18:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E59A410E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1812422D0
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIDVG4Yh0yTk for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:18:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29CBE4177F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29CBE4177F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29CBE4177F
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:18:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -665860655
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:18:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utqBe-0010Bw-19
 for buildroot@buildroot.org; Wed, 03 Sep 2025 18:18:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250901143252.672903-1-peter@korsgaard.com>
Date: Wed, 03 Sep 2025 18:18:18 +0200
In-Reply-To: <20250901143252.672903-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 1 Sep 2025 16:32:52 +0200")
Message-ID: <87ldmvmrw5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TLhnRsICHgjBVSZfqe0lNlk9DMi1DB8f1EGm9sqdDLbM4DZAouMo3alg1T90embQD9hUrPZNMUqJ+k/XkacMPleQ6GQ4yLtbGB0q/4WEtcGIYtDIhuMbQe/GE+mwArZf5xtUa3rGo6cUEWLYs5ZH8n2zVw5jJaAW7c4X7IN4z+aWfi9tPy/I3W454MrWV6UWRTXQqfUF49BdKKroyD47fZKuHF4OesdbSE/r3W6OZ2l8tfaHjsSYW7TRVmXpRz4CqQfcHvb0yjF58lPnIJ2uTMuvFT9oQ4oL2gp/JLTHZu9vTzNADOaNQUtB+Bame0RXNcf7g+iFlCNIpqpVGNmneA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=tKyiuyyuDaXXJkBXpM4qCeG2Hvkl/nRna1720D3tzks=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=TLhnRsIC
Subject: Re: [Buildroot] [PATCH] package/jose: needs shared libraries
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

 > Fixes https://autobuild.buildroot.net/results/bf23e75461877a4ca3a189626f30cf8cde24de36/
 > Jose unconditionally builds a shared library since v11 with:

 >  commit b72f8cad002edc87286dd1f2331c359158c512e8
 >  Author: Rosen Penev <rosenp@gmail.com>
 >  Date:   Tue May 30 12:18:30 2023 +0300

 >    jose: build library only as shared (#119)

 >    Needed because of constructor usage in library.

 > So add a dependency on BR2_SHARED_LIBS.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
