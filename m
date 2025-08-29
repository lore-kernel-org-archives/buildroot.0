Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDFFCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5463061676;
	Fri, 29 Aug 2025 15:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbrIrN9vlPLj; Fri, 29 Aug 2025 15:40:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FA6A6164E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FA6A6164E;
	Fri, 29 Aug 2025 15:40:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 164F16C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F083E41738
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B05FZ2ArGMQB for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:40:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C6D341730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C6D341730
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C6D341730
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:40:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1865904591; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 15:40:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us1Ct-00Cicx-1B;
 Fri, 29 Aug 2025 17:40:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Bernd Kuhls
 <bernd@kuhls.net>,  Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20250828174155.249940-1-thomas.petazzoni@bootlin.com>
 <20250828174155.249940-3-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 17:40:03 +0200
In-Reply-To: <20250828174155.249940-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 28 Aug 2025 19:41:52
 +0200")
Message-ID: <87v7m6gmr0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TzWX6+sa8LZ05GKr7w7wV2idmRRSqiT0s2vI8uU+DUeGbsT1K/zE3nUk/XhyHCIVO93L95s2DUaZy6S8u76aCpLoUusk4lIW9UZnTMBl6Sxfw2m+wa1sSO3ByqZJpJMvz+oJA/tuDh8RKeAQPI7WNP3EoYSrn5MWVWQJthiLBAYgDAkivKlVXjoZQacXV16cPTt4Yl4BOCTQ+bEpTzAVXc/KftreVsHS0jIl2TqmLoJUlPcVhLiGnXevhMpzS7nkdobfrxTJ4SIL8PfVxXYPw1sTvwDDD9QZ96/2h1ABDgDvODyo1Vwj455As9Z8Lg7+JMppUlCCNsQR84ipVMdBJA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=vzCYiscQHkL6aVKifOlvLsq2KOhjTXvEyA+uFdIFjU4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TzWX6+sa
Subject: Re: [Buildroot] [PATCH 3/3] package/ffmpeg: add optional support
 for libsoxr
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

 > Now that libsoxr no longer depends on ffmpeg, we can actually use
 > libsoxr in ffmpeg.

 > See:

 >   https://trac.ffmpeg.org/wiki/FFmpeg%20and%20the%20SoX%20Resampler

 > for some details.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
