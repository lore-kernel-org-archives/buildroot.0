Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9354BFD0057
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 14:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C5AA41B40;
	Sun,  1 Mar 2026 14:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGjElfSHpKdN; Sun,  1 Mar 2026 14:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D764341829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772374559;
	bh=vqtDK0w5N7jecHE7tS07ZT+8UiqH3SCKjNUi8TIaZ3Q=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mQNJsjKY6J4uiRjvT9WrW5fPFWfM1hkQijdZaoOXs5+uHw56SosM5kkxQO6g6XDli
	 Q73gyb56gtaLi0PEeWcIPikE4y5vMKYupD0HGCF4uksPK8xd5eF9TODDrCAKSMBSVf
	 65AeulY0n5EOBpjexBYorjk5zsjg7KRGxvtFbiv/aGTzN/FB6cMqDxomxfL/hnn9ij
	 eyCZrt4dqgp8TX/Gkc4S+D1BXEo7AEgwPK2qou2IUx2atCOUmscQ/Fsmc+pn27XV6p
	 bx7stQAKKr8RqY3e+b4z0pK1koj0aNnGheZohQn3MaSngtIIkJbzNTYJH2rFRFJ26c
	 WNElJve36evmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D764341829;
	Sun,  1 Mar 2026 14:15:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 756CB231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6725541829
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtHIou0lOs-m for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 14:15:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D84141827
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D84141827
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D84141827
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:15:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -789555353; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Mar 2026 14:15:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwhaH-0000000CkkC-2EnU;
 Sun, 01 Mar 2026 15:15:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260227190627.2008481-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 27 Feb 2026 20:06:27 +0100")
References: <20260227190627.2008481-1-bernd@kuhls.net>
Date: Sun, 01 Mar 2026 15:15:49 +0100
Message-ID: <87v7ffmy96.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dG2I68NbLlrLIi1x2K7BfIz6U5pOi0iK/cbdIEpFQJXvdRhHliF6e8Kx3XYlv0tNFu+m3sJJGI0MasflqSYaiNymHvdg2P8bN5m4AE8ZkHiOdY6nunH+jH6MOjBt4iZLwByTnTuf8zxK6Wq/3OFZqGGStrb2uQbDeMZcG169laC/f72pfFC5N+EQJP8jfAk+fkR4xwO9guatnZisaZZm7HOvVpuOvJWNVgcg53fyGtYWan3EUxOTFv3VRY38jyn90IikP3sNtD9JmAoGtuW4qPPy54kCpLYTE6jlDXtBnSnqaIJ7jsz8aKNmtdpxtaQc3Q+7pslNd3sPL+kFtpfGiQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=YCoPR93sQXkNFGGcfKQmo6t14ePejXycGD9CtD+VNkg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=dG2I68Nb
Subject: Re: [Buildroot] [PATCH 1/1] package/flashbench: fix download URL
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > The original source is offline, switch to forked repo and use the same
 > tree as before to only fix the download error.

 > Fixes:
 > https://autobuild.buildroot.net/results/eec/eecf2cbaafd8a170b5f5c6c24df552280a530204/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
