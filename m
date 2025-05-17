Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5F4C3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ED2B83B4E;
	Sat, 17 May 2025 10:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ceWgwrJSnUh; Sat, 17 May 2025 10:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F9EF83B0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F9EF83B0E;
	Sat, 17 May 2025 10:39:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CD8C1DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 826B640529
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEIsz4lxXQlo for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:39:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D8A540409
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8A540409
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D8A540409
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:39:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1C994327A;
 Sat, 17 May 2025 10:39:03 +0000 (UTC)
Date: Sat, 17 May 2025 12:39:03 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20250517123903.01291367@windsurf>
In-Reply-To: <20250425223140.2341210-1-giulio.benetti@benettiengineering.com>
References: <20250425223140.2341210-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudehgeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffgueethffffffhgeekkeejtefgfeevuddvjedvleevleefgfefgfegudetleevnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepsghuihhlu
 ghrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747478344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2NGPtZTYWSDEaQTyNtxilq1p9Fl8mk6rFZ0BlQW05BI=;
 b=EIwQEhneKitf7YCDwkKKDDfd2jOSgd2JMVYp/Y3AwjDzYFG81JFCglR1engT9SqqLCtq/H
 mLLaQamjAiz+WH87/WTc6Iv5eVKs7GfhX3FJ7J/Jt1iBUhwZr/q/zNTXUK6FpX2gnYo6at
 OMiC2lRlarBsWOg11voYVQm20FNnWUGaNLMBdX3+6qZx51twX37+jM+V8i8541bUpDA8Fl
 AgD0F+PlfiC4hm0tcv/w5lYdIc3/r0o5slc4SIxdAB4RbqUdHTuOsS39d89BFCJ9iP44vb
 gxuOQdcDo6A/KS3aVmX0z/KzlUr7icXTiv3Ey/AdzP4/PMqeSGq6/vIGVlrKtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EIwQEhne
Subject: Re: [Buildroot] [PATCH] package/libfuse3: fix build failure with no
 NPTL
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

Hello Giulio,

On Sat, 26 Apr 2025 00:31:40 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patches, one upstreamed and one pending upstream to fix the
> presence of function pthread_setname_np in runtime.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../0001-Fix-meson-function-tests.patch       | 121 ++++++++++++++++++
>  ...ke-special_funcs-check-more-reliable.patch |  41 ++++++
>  2 files changed, 162 insertions(+)
>  create mode 100644 package/libfuse3/0001-Fix-meson-function-tests.patch
>  create mode 100644 package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch

Applied to master, thanks. However, I had to improve the commit log
quite a bit, because it was missing two critical information:

- Since when the problem started happening, so that we know if the fix
  needs to be backported or not

- Reference to an autobuilder failure

So I ended up with:

    package/libfuse3: fix build failure with no NPTL
    
    Since the bump of libfuse3 from 3.16.2 to 3.17.1 in Buildroot commit
    a4430578aeb6ca460813f4ff7d833cdd839a3249, libfuse3 uses
    pthread_setname_np() which is only available with NPTL.
    
    Some initial fixes were made upstream, but are insufficient to fully
    fix the problem, so this commit brings additional upstream patches
    fixing the issue completely.
    
    Fixes:
    
      https://autobuild.buildroot.net/results/f3cfaa8ed63483858ffa32b719ea4be68ba6c4f3/
    
    Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Also, since your patch has been accepted upstream, I replaced the
Upstream: link to point to the final upstream commit.

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
