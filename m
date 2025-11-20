Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7090DCF887F
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 22:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A51084926;
	Thu, 20 Nov 2025 22:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGi5_38XT9gZ; Thu, 20 Nov 2025 22:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B04881E3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B04881E3E;
	Thu, 20 Nov 2025 22:09:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C30E158
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02BCA81499
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62guL6trSjWW for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 22:09:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67FC6810F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67FC6810F9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67FC6810F9
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:09:18 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 59976190;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Nov 2025 22:09:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vMCq3-00000004Ez9-1XAl;
 Thu, 20 Nov 2025 23:09:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
In-Reply-To: <20251120213616.662BD85CA3@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Thu, 20 Nov 2025 22:30:48
 +0100")
References: <20251120213616.662BD85CA3@busybox.osuosl.org>
Date: Thu, 20 Nov 2025 23:09:15 +0100
Message-ID: <87fra8jr04.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=HPKDR0qcGi1i2Pduqaz7984OMqmm9yyDhznELOJ8OmXcRk0QbFeIrCzs1OUCjEl59AyuzVXCRJEeo0PYS846HZ1narsBOxsl7oqvqp8JhG13eFgZUK0yw6nEwk5e/lBcfMS+AtO3hnusNTiYKOjkTrvbUavCRW+0835JggUG357Zq+idrYrdekLtznlLao/ZivGFhiYXA6cGBUpE2eRlK390FxZ/bASh/0aIjSqCnaBLeC3OQguhyX3uxD7COC3v2hf678fA3CaTm2Lh+gcFOhQJYSJ2CLEQri50FFPMA0UJvKOXT34iCr71EjGbrdwg+gnMsvcwjhOyxe7pesaQ1A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=t+Axnz9NKqH+RkQ7Fet6o+AMnEOpOOLCfgPBDH7QILg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=HPKDR0qc
Subject: Re: [Buildroot] [git commit branch/2025.02.x] CHANGES: update for
 2025.02.8
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

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=20e8a0826409343b8e0ed71f49ec36e372c256ce
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

 > Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
 > ---
 >  CHANGES | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 >  1 file changed, 64 insertions(+)

 > diff --git a/CHANGES b/CHANGES
 > index 77bfbd18d4..cd6600af72 100644
 > --- a/CHANGES
 > +++ b/CHANGES
 > @@ -1,3 +1,67 @@
 > +2025.02.8, released November 20, 2025
 > +
 > +    Important / security related fixes:
 > +

NIT: Indentation looks wrong.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
