Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF543CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 987C7842B3;
	Fri, 29 May 2026 09:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WLpmXaCuH4V; Fri, 29 May 2026 09:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8CDA842C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047825;
	bh=3qOuljeAGXDBWmlMBWoh660ZedzGASLkU71uuUrSx5g=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nkYB/4ugJoe7PArakwzL39WcBj4PeWErYmjBe42vpSqWtVstg6KUTpUVkeoNoDAKv
	 8yKcni6Bu+t6bKXzbuLp9OXuJX3rjWG5dxn54Ed/+y3Y2vMJ5hUjedP0HCORxvWMGH
	 EZ2Ymh5SlKkBZDF7Ywpre+6Wnj82Z0DlXSm2JynZBbV2faXHqlkluFQsU0X1Oa0s8g
	 Pvxq7Ztckt5bUXy/SU1faQqq26HDUsn11scRCUjsR+FFFcKxo8j5TrzZo9yMsCQyv9
	 6w0eAUhaxu4AgAlwgctr8qd/4CMY7c/QuAYZqOxkN5w/dGLzFrAnCaEw+vNrG3BPbx
	 psS+G1cJTzYqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8CDA842C8;
	Fri, 29 May 2026 09:43:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CCA68F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE0FF61392
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0s0_6gf8Wh9 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 136F461306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136F461306
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 136F461306
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:43:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 439945430; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 09:43:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wStkg-00000001eAo-37Hj;
 Fri, 29 May 2026 11:43:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260502180555.2769589-1-chakrabortyshubham66@gmail.com>
 (Shubham Chakraborty's message of "Sat, 2 May 2026 23:35:54 +0530")
References: <20260502180555.2769589-1-chakrabortyshubham66@gmail.com>
Date: Fri, 29 May 2026 11:43:38 +0200
Message-ID: <874ijqk0tx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Qfi3c0uMU5C6OJxPVlBDydjRxYmdgFQcXJcSdWCXK8PJiOBud+3FNg3ASJTU+Te/jQ4iJmQHZXwOIXqA8oLuP82iyteWYwHw9wccYg8BjatME/EGPAM4Uq79onpY3ibwCdjB8sjL59bB4BjgIAbMLeO+SXOYU7N2aOtKOO4UswyOZIRh04uaWIY7wEazL0q4YD1zP4+I5oTYJiw9tvIuky2RwXX5frcKRA5HQZvY1qBL+TXAbgII9IMXxb7kDcl+wlGuqE/BkOYsHpd6hQz0dLJ5OUUuAehfuDyQqNJyZgZDVgfEpYKzkHSUsnBtt0zyQ5lNYuDWlJCxTaWUSx0VrA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=WvJbqD5f7tJwP7BJ5YRpJC9PO1JWviLGTKCpRwCrong=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Qfi3c0uM
Subject: Re: [Buildroot] [PATCH] package/unrar: bump to version 7.2.6
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

>>>>> "Shubham" == Shubham Chakraborty <chakrabortyshubham66@gmail.com> writes:

 > - Performance improvements for solid RAR archives
 > - Enhanced TAR extraction speed
 > - New archive naming and date handling features
 > - Various bug fixes and improvements

 > https://www.rarlab.com/rar_add.htm

 > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Committed to next, thanks.

There is no unrar entry in DEVELOPERS. As you presumably use it, can you
send a patch adding unrar for yourself please?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
