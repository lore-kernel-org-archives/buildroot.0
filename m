Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F462CD37BF
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 20:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC3F740B1B;
	Wed, 12 Nov 2025 20:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3c098d6Rb-b; Wed, 12 Nov 2025 20:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D757840AFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D757840AFD;
	Wed, 12 Nov 2025 20:12:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A873230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83DD18316F
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5amXHlvC2iB for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 20:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D0C38315C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D0C38315C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D0C38315C
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:12:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 147226081; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 20:12:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJHCK-00HagY-23;
 Wed, 12 Nov 2025 21:12:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
References: <20251107012804.2080218-1-james.hilliard1@gmail.com>
Date: Wed, 12 Nov 2025 21:12:08 +0100
In-Reply-To: <20251107012804.2080218-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Thu, 6 Nov 2025 18:28:04 -0700")
Message-ID: <877bvvrox3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=tGu0SRcPBjhgC0QyhUI4iOtzYJr/Besap5g60NcggYg7QCO1gaW7rPocPE7Ymp6yy/5hvO7yF4es511Gcs8spaag9ck0iR3khnT0T4zf5Ym68Mx5WsHwsmMHPRKlNThS53Bk6VpgvigZIDub8OmQau4geCwQzJAgG19hCGkkSTi3Bqm07EpPeo5UlU3iwWp1GyrqezFGHTG2uqmDi8Fdhm96RtA5iel6GgDaeoRB49k47hQFv52P2/fwi3elErt7lC0lFwMXWtoyDKNXxEowxkSMlKYo34AGB9rUoA5squ+Xo1ZxaZIDNFfoJaTPJJ+7GPR1YzhCPh7f/dnuYuNpQQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=TjhB2TBSz5cIYRDFZXFf708RiPcM/Ia18x0F3dl5tFw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=tGu0SRcP
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: add missing config
 fixups
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > There are a number of kernel config fixups required for tailscale to
 > function properly, these are commonly enabled by default in various
 > kernel configs but lets make sure they are all enabled here as well.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed, thanks.

Out of interest, where did this list of config options come from? I
didn't find anything in the tailscale documentation from a quick look.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
