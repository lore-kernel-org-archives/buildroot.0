Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114DECAC5BB
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 06:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE9686143A;
	Fri, 10 Oct 2025 06:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUgxAoxVfx9K; Fri, 10 Oct 2025 06:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E0961436
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7E0961436;
	Fri, 10 Oct 2025 06:04:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC839226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDF2780C86
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WC0qL0BdSbV for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 06:04:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A79180BD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A79180BD5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A79180BD5
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:04:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -922451887; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Oct 2025 06:04:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v76Ex-008l7E-0o;
 Fri, 10 Oct 2025 08:04:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?=
 <flavio.tapajos@newtesc.com.br>
References: <20251009210839.11148-1-ju.o@free.fr>
Date: Fri, 10 Oct 2025 08:04:31 +0200
In-Reply-To: <20251009210839.11148-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Thu, 9 Oct 2025 23:08:39 +0200")
Message-ID: <87qzvbwavk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KNxJIK8nB5XBp1t38GdybjAuYguBwFQbUn3e0puLrNN3Kwll5OVD7+hPWJAI0VaACoWzulCSfhLAYjQTqu2tvl4cxHa2g9p+V6FDn12yAgcLNl/BIgxXXTe/2oVr6tTvqDsNIeJeNS5DimIlaENDnkQ5ZuxmGrRFkp8P2cD1wNIMB8Q3ZfLjOORPg7xNCu/gEKQ0NGhhR5rbLgGI6WkiDIjtUPyY3OJUCwwXFYkhFQ+riWB0jp2M3ASbCLnVzi8/LpOxphNEeTaTNqidU1kJI6wJrT0+PAqa6jSxjDLzunufBLLQ8LVVW2zaApEnKtsSY+ba2otZ6El5xehdTw1YJw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=PTzvZYH5p5jKt+aAK4Xwmih/qnUqjkSMfBSZKTlmDjY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=KNxJIK8n
Subject: Re: [Buildroot] [PATCH 1/1] package/rsyslog: fix hash file
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Commit [1] introduced an extra empty line in the hash file
 > which makes check-package to report the error:

 >     package/rsyslog/rsyslog.hash:4: consecutive empty lines

 > This commit fixes that.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/b39d3d8f62182d734c368e9197e1089792f2f958

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Ups, thanks for fixing it. I do run check-package when applying, but I
must have been tired as I missed the warning:

git pwam 2147788
Applying patch #2147788 using "git am -s"
Description: [1/1] package/rsyslog: bump version to 8.2506.0
Applying: package/rsyslog: bump version to 8.2506.0
package/rsyslog/rsyslog.hash:4: consecutive empty lines
1413 lines processed
1 warnings generated

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
