Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DC9CCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 19:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C907484CC3;
	Sun,  2 Nov 2025 19:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfSMtQL4Bhew; Sun,  2 Nov 2025 19:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0822584BD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0822584BD6;
	Sun,  2 Nov 2025 19:45:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7EA8436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA41184BD6
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvdmRRj0yTnl for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 19:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D12FE84BD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12FE84BD5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D12FE84BD5
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 19:45:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 578924757; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 02 Nov 2025 19:45:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vFe13-000uJD-1T;
 Sun, 02 Nov 2025 20:45:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
References: <20251025143512.78812-1-thomas@devoogdt.com>
 <20251025143512.78812-2-thomas@devoogdt.com>
Date: Sun, 02 Nov 2025 20:45:29 +0100
In-Reply-To: <20251025143512.78812-2-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Sat, 25 Oct 2025 16:35:12 +0200")
Message-ID: <87ecqg9q1y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ZCvP8w8c2OhKnWMR6hfGLNkbfKwOegpPvRlB5dKJrP0L8hMcHuQjp1wQyFtXXnSsDsIK1tx9DJhKdbMXwEt25DfO8bR0wIXubQ81UkbSndWh/fYZPnT5kgPJ7hoF/IBSJaTKDg+nyKSM/dujl/BkPCVsn1Lyt6OrOgVZkWeor4F/ky1H6jSoMfKh6SsEyvh5ijCeZ9yrkSRf4r7Ln08tzM4bUYDBOmSfun3m6PdwqrJ3brQKA3JuKYCdXdvu2Nskoj39XzKib125as58dbu5DwArqSxWwXkVzJN94idk9ZmuTtNNjBXKj3NyKJurwyoDNM6adb2mujB66ee4OLTuzQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=gvFUozl9alGHxAvhsQVuepsxTTQXFx/ciPO6KiSCTs8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ZCvP8w8c
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: disable internal
 ccache configuration
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > WebKit's auto-configured ccache results in 100% cache misses.
 > Disable WebKit's internal ccache setup [1] since Buildroot
 > already manages the ccache in toolchain/toolchain-wrapper.c.

 > [1] https://github.com/WebKit/WebKit/blob/webkitgtk-2.50.1/Source/cmake/WebKitCCache.cmake

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
