Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98287CEBF61
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40C33402CC;
	Sun, 16 Nov 2025 21:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMKw0aXq1yAb; Sun, 16 Nov 2025 21:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63039402D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63039402D8;
	Sun, 16 Nov 2025 21:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA95BD5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 913B28220A
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1k8HDuMvlxhS for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 21:42:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8243182208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8243182208
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8243182208
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:42:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 92192258;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Nov 2025 21:42:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vKkWF-000000014oo-27uQ;
 Sun, 16 Nov 2025 22:42:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251115113347.183802-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 15 Nov 2025 12:33:47 +0100")
References: <20251115113347.183802-1-bernd@kuhls.net>
Date: Sun, 16 Nov 2025 22:42:47 +0100
Message-ID: <87zf8lvelk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TCeAdmKdXsAi+lR+HJ5PZ9fhAP1MTtlrJTBOo0apU3MOvGvoipfOTGjeV6j3WF659sswVGVfLo5EevPucv/JFNapyw3hTo9gupib8a053jmlMw8en9iPJVvCc8vlJOIvVlvZilgKcmCivmmHD9dKcmksQE/NXKF881BbMb1cglXAPAzfdLfWbpE2WllMLMJfR2rS6KK0onXNgUiM3MYSuHm2SoKV3qZRkGCYDxCm0GXIz7FXpeOCjKApJfwz5cvLqAeTimEWJU3NfmVxvEoFcn29xFc1zjLscltUNhfCGy5i7VrGEcPk12Wpzeok91wdTWmSOXSxcIGzzzYRgwtUNw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=sLLu7jUbtqQo67sp8Rxq2KAKjc2P5aV4X4GDeOVm2pg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=TCeAdmKd
Subject: Re: [Buildroot] [PATCH 1/1] package/libroxml: fix musl build errors
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

 > Fixes:
 > https://autobuild.buildroot.net/results/0ff/0ff4394319d2014884328c347ef495da327a562e/

 > Added Upstream tag to patch 0001.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
