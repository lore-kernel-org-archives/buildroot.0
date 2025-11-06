Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781A5CCF9F8
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 15:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D1B041194;
	Thu,  6 Nov 2025 15:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyvEf5eY2pvl; Thu,  6 Nov 2025 15:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37FB44117D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37FB44117D;
	Thu,  6 Nov 2025 15:57:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C17721CD
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 15:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A721A6135E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 15:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSIP8sbErTr8 for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 15:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38EA8612B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38EA8612B1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38EA8612B1
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 15:57:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -991839049; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 06 Nov 2025 15:57:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vH2MN-0075Xd-1z;
 Thu, 06 Nov 2025 16:57:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
References: <20250823103847.3888908-1-angelo.compagnucci@gmail.com>
Date: Thu, 06 Nov 2025 16:57:15 +0100
In-Reply-To: <20250823103847.3888908-1-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Sat, 23 Aug 2025 12:38:47 +0200")
Message-ID: <87o6pf40is.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=gguzYRJruRbc8n53eeYTm+UAPSCvx65z64uDho46A3EorDjMrXkPZpsH0SCmtDAg6V2E+Q2nIYhVEHSbauWX0259lWxZnIRDjA7NSmANBV8jkNvpxPk+AUm0w7GRlp8FwJRz87E97EvfKTRTmX4xfqgMP1R5Miu01243pu8wXhrPyNAqFv9qhDpjBfPkD/9EkeMWmeB+T44bSamBG5RzaedZ83xHo6QKWcq5GzCKLGcwWeVK5wkKZvxAWIsK+zqCsesBMLtNccn71hDSdhfH2WPTjxXqYPrwmTbvug/cw7AX+OQ5TNHfV1SoaQwQT+E9KZlA8gXKkRfdbn3KKwNO1A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=cnEnXgslTFEW7VWpIlQyCF4jo+R4MRgaqVYlDEOmJS8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=gguzYRJr
Subject: Re: [Buildroot] [PATCH v3] package/wcurl: new package
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

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > wcurl is a command line tool which lets you download URLs without having to
 > remember any parameters.

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

wcurl is bundled with libcurl since version 8.14.0, and it automatically
gets installed so I have marked this as superseeded.

https://curl.se/wcurl/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
