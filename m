Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FA9C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE64C41108;
	Fri, 12 Jul 2024 15:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLi4VBuhz-5X; Fri, 12 Jul 2024 15:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFF14411FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFF14411FD;
	Fri, 12 Jul 2024 15:07:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AABD1BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93D0D84688
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YefPhFlQCjxN for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:07:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 964D184637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 964D184637
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 964D184637
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:07:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id A8E991814BA; Fri, 12 Jul 2024 17:07:15 +0200 (CEST)
In-Reply-To: <094496df-f537-4cd9-8695-f6c67d1577cb@mind.be>
References: <20240712113306.829994-1-buildroot@heine.tech>
 <094496df-f537-4cd9-8695-f6c67d1577cb@mind.be>
Date: Fri, 12 Jul 2024 17:07:15 +0200
To: "Arnout Vandecappelle" <arnout@mind.be>
MIME-Version: 1.0
Message-ID: <16910-66914680-3-18a4bae0@110921257>
User-Agent: SOGoMail 5.10.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1720796835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GqcN0nlllnbu76CPz9JLHmGblMqD1cr1R7dkFfBuHHQ=;
 b=Gpjr947jPC7a8s02W6QswuocDzQEnpbNQQvR09BOh3aMtrnTvmjwsjJQc3Xo0cXiw54kzR
 Kmv4+HmNmdODyUXTyjyNOa1QBxCvL3xgemJOpHItpF6lxQyCSM1kscaYdbFpS2014u4wkJ
 eQtq1AWZsE2dbozvm91Ck7eqM8dhpUk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=Gpjr947j
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/boost=3A_cleanup_HOST?=
 =?utf-8?q?=5FBOOST=5FFLAGS?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Friday, July 12, 2024 16:11 CEST, Arnout Vandecappelle <arnout@mind.be> wrote:

>   Hi Michael,
> 
> On 12/07/2024 13:33, Michael Nosthoff via buildroot wrote:
> > - fix alphabetical ordering
> > - align to 80 char width
> > - add comment explaining why options are enabled
> 
>   Thanks for this improvement!
> 
>   Perhaps you can also change it to one per line? Because honestly, that wall of 
> text still doesn't look very clean :-)

Happy to do this. This will make future diffs for version dumps much better to read.
(I was actually considering doing it. But wasn't sure if it was wanted.)

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
