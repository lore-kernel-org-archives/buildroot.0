Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4496CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 10:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB8C408DE;
	Mon,  1 Sep 2025 10:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mx_J3IKTIx6; Mon,  1 Sep 2025 10:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C645D40983
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C645D40983;
	Mon,  1 Sep 2025 10:35:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32E7D10E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 10:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22EA2820F3
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 10:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVn2yLXYgo-P for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 10:35:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BACB1820B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BACB1820B8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BACB1820B8
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 10:35:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 657324574; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 01 Sep 2025 10:35:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ut1so-001n3i-2T;
 Mon, 01 Sep 2025 12:35:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>
References: <20250829165238.3082564-1-peter@korsgaard.com>
 <20250829235308.18037377@windsurf>
Date: Mon, 01 Sep 2025 12:35:30 +0200
In-Reply-To: <20250829235308.18037377@windsurf> (Thomas Petazzoni's message of
 "Fri, 29 Aug 2025 23:53:08 +0200")
Message-ID: <873496fojx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=eXXEpp7PnDBlFWlYf4LEwprCtSr49TYRFwT6wpSfjhrQJbs/rJZReN7AG9Oe3ZOn41KkA0fN3v+111LBMk0hj+ukN0FZmEPzsjyFgNcnL6QBYMMCV4B02MM0Ni8XTbMSuqIyjIK2ZI+T8DxSX+fCfdIeEmfo9oBHFZq2IP+qFZ10Sj0SpaWrvtYvzHHrbqi3Y3SDFvRps0te3IZ+HHueDPzBy4tCsYkJE40Vaa21/GdhGcFbPKhqqvU3lRrPNdxzdf8n+f7nn0wz5VyATJMRRCsnMUm5kXwYq4S+dDaM+4F/9D6t3DaYdcv9Ytrj/EPTWfNrPtQSPaIIYr3wxANWWw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=qtzrSP+fS1FVL7mx4QLi9wkNmLX3gzfuDKNCr6lVMB0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=eXXEpp7P
Subject: Re: [Buildroot] [PATCH] package/mbpfan: fix build on musl /
 uclibc-ng
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Fri, 29 Aug 2025 18:52:38 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> define MBPFAN_BUILD_CMDS
 >> -	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS)" \
 >> +	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE" \

 > Upstream seems to still be active, so what about doing the "right"
 > thing, which is adding #define _DEFAULT_SOURCE in the source file, and
 > submitting an upstream patch?

I did that:

https://github.com/linux-on-mac/mbpfan/pull/271

And committed this patch after updating it to use the patch.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
