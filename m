Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73DBFA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 765694064A;
	Fri,  2 Jan 2026 22:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwGVzGe6p7zC; Fri,  2 Jan 2026 22:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AACE34056A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391658;
	bh=h0Jxf1b49AXT0a+EYK/LWHm0EBLArS41m+lIArMgCgk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q0ZhCMhdJl1Sv20Oml4MXgo6pfr4/1zKfmEh3Y23o2BWh8I/YvR1egdT5RmHkOU/u
	 +saK0IpScIQVEy+AAx8JGNC2SLPukIeR9GW5WCQ8YSubsoVdF+TU2GH1n5cO3ZZUdt
	 k5UA2p9LQGY6QiA24ru3W5QvvB16aQ+40MVALC9pZoBKmMCBlqvX0yxZcQDrXuyDTZ
	 7swCaogzzkmws+5hDCsv8XCORCzxvxofHg0AS93d2VC4z2GLSC+oULQKwdaBygoRhR
	 2oAG9V1tiQ99KFhSJF00ZR0UZi9RlIznibLpWAvezhvMJWSgpUHyZvvlUwMmKS5SEO
	 whP8bGYZaaYSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AACE34056A;
	Fri,  2 Jan 2026 22:07:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76C85249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69C684056A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkMYMM9S3vnt for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54A86404DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A86404DC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54A86404DC
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:07:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8F9251A25EA
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:07:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 65A5E606C7;
 Fri,  2 Jan 2026 22:07:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF4E8113B023D; Fri,  2 Jan 2026 23:07:33 +0100 (CET)
Date: Fri, 2 Jan 2026 23:07:33 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260102230733.1d93bab2@windsurf>
In-Reply-To: <20260102214310.267633-1-james.hilliard1@gmail.com>
References: <20260102214310.267633-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767391654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BDoTo7eKqiRqp7ADT08M+3kWLBh0CevdKiOZPeTZY9Q=;
 b=W4PoMZLuTH1boEYBsKTG0ds6r1q+85fXxKSBSGPkI8g26ieYSl6BM3RW/GjFuJn894uKif
 H5ModqaBvGLvmD+RnyqEId25UkGqJmDwLc8UbzPETCxgxyULPnQxI37Lvefnvc3MSNzWnc
 qG+FAp4W0UaiBnzWgHuRYAaxYhAImRPAzpvLboIZkFxMs7M4bP5Z9zgHF/ZXbhYNoT8ond
 LXpzFv0LeTk3yAPPKad4wD37c6Zw4qJ3cWUisCmM/RiLKufN3PlJ9T1HWbos4HxQi/slOr
 J1Usz9VXf4EKpZltupJ2g7pikPUCAreMPhI317aWUFSPCmiGaL5kwvevQtDfLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=W4PoMZLu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-libusb1: bump to version
 3.3.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  2 Jan 2026 14:43:10 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-libusb1/python-libusb1.hash | 4 ++--
>  package/python-libusb1/python-libusb1.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
