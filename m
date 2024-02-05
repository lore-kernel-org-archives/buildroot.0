Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6F9C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB1C4419B2;
	Mon,  5 Feb 2024 11:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB1C4419B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kim1K76UN5x7; Mon,  5 Feb 2024 11:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4490418E2;
	Mon,  5 Feb 2024 11:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4490418E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 885271BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 609B882AC6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 609B882AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kplugznWioyV for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:36:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 450FD82BD6
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 450FD82BD6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 987C820005;
 Mon,  5 Feb 2024 11:36:51 +0000 (UTC)
Date: Mon, 5 Feb 2024 12:36:50 +0100
To: Kevin Cui <bh@bugs.cc>
Message-ID: <20240205123650.23b78a48@windsurf>
In-Reply-To: <20240129034403.10232-2-bh@bugs.cc>
References: <87ede3236l.fsf@48ers.dk>
	<20240129034403.10232-2-bh@bugs.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707133011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXxd9uryPMqCTnEsgPuUaMvKsdejhDD3VMivohVetY4=;
 b=VBeU7PfRDyQC9PwlkP6rmvNozs5UYQ4d4m4wwqYBgY1HwGWaYbTAqwJssIxAo/zRd4tU1G
 ZeAA52oMmeCffQsgp0CoD1qlroRjcr3rp2WWrC8lNEFUJ1Bz4lr+zcS91v95JocbC+uOjA
 It1pSotOk7F31eIC4V5noicn6Ku3CQ/DxyTXrR10+Adq23n7IeHt/teJDZfWLbo8Sx8qeH
 dM2rf1KEIz/yWQDScrKoTo6cHwNYJrYSh2LVFPQbjr5Dr3X7CjbLXHehX8DH/8Q3DtSTLn
 urd8BS1lKCJB1s+DnXFFoJrbQW7d6zp309w+84BpqF+o0r38Z2tEAbu6HncHkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VBeU7PfR
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libxml-parser-perl: bump to
 version 2.47
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 29 Jan 2024 11:44:04 +0800
Kevin Cui <bh@bugs.cc> wrote:

> Signed-off-by: Kevin Cui <bh@bugs.cc>
> 
> ---
> Changes for v2:
>   - use real name in "From" and "Signed-off-by"
> ---
>  package/libxml-parser-perl/libxml-parser-perl.hash | 4 ++--
>  package/libxml-parser-perl/libxml-parser-perl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks for your patch! You forgot to explain in the commit log why the
README file hash changed. It's important to look into this and provide
explanation in the commit log, as it's the very reason why we have
those hashes in the first place: to detect license changes and account
for them.

And it turns out that a separate LICENSE file got added in 2.47. But
(!) this new license file is wrong: it doesn't contain the right
license text. This was already seen by Debian, and reported upstream:
https://github.com/cpan-authors/XML-Parser/pull/99.

So I expanded significantly the commit log to explain all of this. See
the final commit at
https://gitlab.com/buildroot.org/buildroot/-/commit/7fd6473a2b8c4ca274bd8a3b53e55d6af5242f9a.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
