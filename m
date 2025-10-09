Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF52DCCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 18:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A522961371;
	Thu,  9 Oct 2025 18:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4lduB52mcSQ6; Thu,  9 Oct 2025 18:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2562D6134D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2562D6134D;
	Thu,  9 Oct 2025 18:21:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 461CE226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 18:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A589840B7
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 18:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyYf0W7Fiqg4 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 18:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07446840B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07446840B5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07446840B5
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 18:21:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1334819034; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Oct 2025 18:21:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v6vGq-007zqD-1G;
 Thu, 09 Oct 2025 20:21:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <20250929085404.918021-1-peter@korsgaard.com>
 <20251009145438.482069-1-thomas.perale@mind.be>
Date: Thu, 09 Oct 2025 20:21:44 +0200
In-Reply-To: <20251009145438.482069-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Thu, 9 Oct 2025 16:54:38 +0200")
Message-ID: <87a520x7ev.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=gF34BcI64r14P3WZ7rRklciy87zCJL7m4tc8aqDQRX4F7XuF3oiAwUY7w+tiQ8GOjqSTtnsICPQix7MAAnorTuZiMU+uCgS0XxWbF8UDI5VI8WPda5ynfhcCFv6eUX+0AcJsDgCN+y6O8BsIMVI49HH7eCmEkrPk/mYy8pUldKUQUXONuSRlPpEsacdEC4ePTMGa7ZP4HrKGkad9tJAF/JwQBuEUtol+PIOuD8jg0G12Ct0fKqRo9D5z1hHAiriA+XBmWwz5IkLFq7s8PNvR8bbCR+eWqs3C/XvUqs2UitBSPBkNRQv+ye7/KMPat3Xv3xHs4+3pglgvMiek9A+ArA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=oBTQ+Tpl+bX0dI5AweeOFNWHpzMAO+5OZQLd5MbinwE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=gF34BcI6
Subject: Re: [Buildroot] [PATCH] configs/roseapplepi: remove defconfig,
 broken
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

>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:

 > In reply of:
 >> The roseapplepi defconfig fails to build u-boot since the move to GCC 15.x:
 >> 
 >> https://gitlab.com/buildroot.org/buildroot/-/jobs/11501385206
 >> 
 >> The issues are mainly related to missing includes, but given that the build
 >> has been broken for a while, there is no mainline u-boot support for the
 >> platform and the minimal kernel support has not seen any updates since it
 >> was added for v5.15, just drop the defconfig.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

Ups, I see I wrote GCC 15.x above, but it should naturally be 14.x. As
for the beagleboneai commits, we did not truly need to remove it from
2025.02.x / 2025.05.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
