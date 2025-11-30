Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C503CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C420540A54;
	Sun, 30 Nov 2025 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y65tgQLTcKze; Sun, 30 Nov 2025 15:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AE4E40A56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE4E40A56;
	Sun, 30 Nov 2025 15:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03E9A1A9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 15:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA01760679
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 15:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhcAZaKMGIjO for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 15:54:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B116605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B116605EE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B116605EE
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 15:54:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -119889301; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 30 Nov 2025 15:53:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vPjkJ-0000000EDrH-2ur6;
 Sun, 30 Nov 2025 16:53:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251127210248.3344440-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 27 Nov 2025 22:02:48 +0100")
References: <20251127210248.3344440-1-bernd@kuhls.net>
Date: Sun, 30 Nov 2025 16:53:55 +0100
Message-ID: <87o6ojikj0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LhGNfqtu1L0T9giBXN3rfgaVDdSQrPU1cWnaHO/vzMIYuIH8uaAUC0NUg/hqa/gFkSSgCH40/zqr0QJCuMIn8ntIMKPyqrs3T1GkHYPxyGaR7pRNLpOaIuOPgw/cCzErFx0m1RhtGGyH8e79I90ZpjTRHhwpVvIjA3L5vF0amUc1DsZ5QSyuZaOv48cDJJuI/QbjoDJnYUarrDUONpOd5UUeyTtjnbrqYmsDloj4XLS7xtDSuehotJYdgeBJ47stNgT6EAZnzQoN6DIhOSWYhGFkCVgnW9pJE9MmPKMWs23RDOxe+KyrAqzY0krcMUTT2u3PnRdbxWFe8RgdD2fwYw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=vx4UGUl84KFddmNtMsciqV+c8sYAN+zekISa0CcxznE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=LhGNfqtu
Subject: Re: [Buildroot] [PATCH 1/1] package/libargtable2: Remove package
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

 > The last release dates back to 2012[1], no other package depends on
 > libargtable2 and the successor package libargtable3 is not backward-
 > compatible: https://www.argtable.org/

 > Due to build errors with newer gcc

 > /home/autobuild/autobuild/instance-15/output-1/host/microblazeel-buildroot-linux-musl/sysroot/usr/include/unistd.h:127:5:
 >  error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
 >   127 | int getopt(int, char * const [], const char *);

 > we remove the package from buildroot.

 > Fixes:
 > https://autobuild.buildroot.net/results/e6c/e6c039cb92fecbd93a91d2d1dab68e803875e62c/

 > [1] https://sourceforge.net/projects/argtable/files/argtable/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

That issue could probably be fairly easily patched, but there are indeed
no in-tree users and it is ancient.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
