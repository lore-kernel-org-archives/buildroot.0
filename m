Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F573CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1CB561643;
	Wed,  3 Sep 2025 16:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3yFjo66lyC6; Wed,  3 Sep 2025 16:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3754B6166E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3754B6166E;
	Wed,  3 Sep 2025 16:16:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8498E10E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 401C940D6E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQV7IZrVO2Dh for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:15:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72711415DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72711415DE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72711415DE
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:15:30 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 437346975; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:15:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utq8r-000zuy-1E;
 Wed, 03 Sep 2025 18:15:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>,  Bernd Kuhls
 <bernd@kuhls.net>
References: <20250903124229.6708-1-titouan.christophe@mind.be>
Date: Wed, 03 Sep 2025 18:15:25 +0200
In-Reply-To: <20250903124229.6708-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Wed, 3 Sep 2025 14:42:29
 +0200")
Message-ID: <87y0qvms0y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=H3HdtZGbtm+iNCmwFQIZy8s48oLI+VcKZox5sENlAoNjmkMe5M87VrBFQZt/q0f/a3UfoqQd4l7+1Zck6mTaM5QWSMmCwkCB2wqoGcGnhfJKYGUUcleQJ9ra/l/zkFf25vmy2oyFEPFLdz4phi4vjKoflP/SRojq3vm3AHzdj1W7cpoOhmCEtd9drlKM4ob5AxUoB6rqmzyzanuC1gYzO2AHA5Yz866sMc/LYXFvT1i7HdfRVmLqIHQP+Y0oV1QdE68KrWuEXpcPzwtonQK3S3tJr/k8c1MJ0wMNu2xrsEddfTn1/wlECw6+RpfEZpwjTvNX3HUQr2Lii0FkV/D68Q==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=L48vMSB+ianzFosXLgmYExvoooxz5xuGlVtCZDEqZUQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=H3HdtZGb
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: add patch for
 CVE-2025-6965
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

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > This fixes the following vulnerability:
 > - CVE-2025-6965:
 >     There exists a vulnerability in SQLite versions before 3.50.2 where
 >     the number of aggregate terms could exceed the number of columns
 >     available. This could lead to a memory corruption issue. We recommend
 >     upgrading to version 3.50.2 or above.
 >     https://www.cve.org/CVERecord?id=CVE-2025-6965

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
