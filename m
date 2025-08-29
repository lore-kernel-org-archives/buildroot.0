Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF8ECA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 13:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BA1684218;
	Fri, 29 Aug 2025 13:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_1kCl83gFcg; Fri, 29 Aug 2025 13:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF7C88270B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF7C88270B;
	Fri, 29 Aug 2025 13:12:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45D476C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3757A841FB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7tMhasatS0u for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 13:12:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C920841FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C920841FF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C920841FF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:12:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1632349864; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 13:12:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1urytd-00CTZ9-39;
 Fri, 29 Aug 2025 15:12:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250829111125.1668963-1-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 15:12:01 +0200
In-Reply-To: <20250829111125.1668963-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 29 Aug 2025 13:11:24
 +0200")
Message-ID: <87349ajmqm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=CrOQVoE6BhWForat/I+RwF3Bke9DccFdZTBXNvtNipY/m5q6PPQKd/q75xoq73zbQkcriCpaBYxtd2QPni3Z4//IXgASySS61r46p7qSck786hknrbrh6Ov4+El5ay9I4mQxCeQXe+FqhT78Mz5xg16sGPTHRSXe9e2ygdDtbwhJz4Z8Fe3zQDTjyojBQejD+Z9v9cZhOo5oIBrV/56dB7f4e79GoS8AdGDlscye7DJba4KoQnxhPsxFhhGs46uKVD4kjT6k8V4HOOhdBY9FaIrQZO1qeQZTxnYjzJK8aumTSVsEXROltRCMPUgEC2Q59p/qBRZHNr8CAG7nA3vCVA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Qj74UCnm9j0nc/+PJlg0uRwt+AFx557nRwSPkufbqJI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=CrOQVoE6
Subject: Re: [Buildroot] [PATCH v2] package/mariadb: fix sub-option
 indentation
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > The Config.in comment is between the main BR2_PACKAGE_MARIADB option
 > and its sub-options, causing the sub-options to not appear as nicely
 > indented in menuconfig.

 > Before:

 > [ ] mariadb
 > [ ] mariadb server
 >   [ ] mariadb embedded server

 > After:

 > [ ] mariadb
 >   [ ] mariadb server
 >     [ ] mariadb embedded server

 > which is what we want.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > v1 -> v2: my v1 was messed up and contained unrelated changes.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
