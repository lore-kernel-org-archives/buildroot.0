Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BEBCA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 15:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E59080EA7;
	Sun, 31 Aug 2025 15:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrhK1go_C0pX; Sun, 31 Aug 2025 15:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DDDC80CA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DDDC80CA0;
	Sun, 31 Aug 2025 15:00:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2566A278
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1728A80C9D
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTYqM_Fh3h5i for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 15:00:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE47E80C9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE47E80C9A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE47E80C9A
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:00:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1128329956; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 31 Aug 2025 14:59:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1usjWz-00HMxn-2s;
 Sun, 31 Aug 2025 16:59:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250829054937.2540763-1-peter@korsgaard.com>
Date: Sun, 31 Aug 2025 16:59:45 +0200
In-Reply-To: <20250829054937.2540763-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 29 Aug 2025 07:49:36 +0200")
Message-ID: <87seh7fsf2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=tMYE/khuWETUimeEsN1dZwGanzHDvPDeaoERoJRdAwwotI2+NpS1G6q7AZzYPyxMMPqhXv9GxhSgxP+q0aFLjTlEFsqKn4XQx98fRsERE+hggT+t7+ZAY1xkMWABx+rOa6/IvoxAd0ny6lIZ/slPT13mELpw78Q4MsgIQbRvoanK05GUAbXzOTw7YoOVqCgUeQK0HmYdLF6irdbyrhrrAoXNvpWoJvQBM2M4v+TNJUSF6Wse/bOYpuIn+Z0Jznibw0DRBnFqEw1zOLDHdO0IHz+QLZ8cXGThhCX0t8KeUMQqlwhqdjvuDm5aMN79V5Pe6QHXD+Y3Wjkmyx5s/s+bWQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=htiBwr12+cP+qQA1vFcYffAqwVRS/3h5sdx6iPz5Q3Q=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=tMYE/khu
Subject: Re: [Buildroot] [PATCH] package/python-h2: security bump to version
 4.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 > - CVE-2025-57804: HTTP/2 request splitting via CRLF injection

 >   https://github.com/python-hyper/h2/security/advisories/GHSA-847f-9342-265h

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
