Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4378CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9513F60E06;
	Sun,  5 Oct 2025 13:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAd4is7tZbH2; Sun,  5 Oct 2025 13:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9C1960DD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C1960DD2;
	Sun,  5 Oct 2025 13:30:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF864D76
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C25B281E9E
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7LUXvF4S4mE for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:30:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B05C81E4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B05C81E4B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B05C81E4B
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:30:18 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -206923497; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 13:30:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5OoW-00Gl1H-0v;
 Sun, 05 Oct 2025 15:30:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>
References: <20251004122113.2161276-1-bernd@kuhls.net>
 <20251004122113.2161276-2-bernd@kuhls.net>
Date: Sun, 05 Oct 2025 15:30:12 +0200
In-Reply-To: <20251004122113.2161276-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 4 Oct 2025 14:21:12 +0200")
Message-ID: <874isd4gt7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=g+GIdd3I1g2GCG+h7HURhhQQedVWVPMoWXT3zsFE1VKh40rrJikD0nwRKJBCAEi5U/WXvzp6NfJGQfr6WVMk9QPZB9dKYsGApMLy2k8h4aDitaSw+Bk4LoANIALB68pQC4F0W4dVN5g4QSBsHLm3NmQdPHYwAAiAZm/DO9QtCnqSJk7MHnP3bMbN0MNe4MByngv2VfKAzsYaoHzrWrGWiusNdSFCKCfMpfrvvdLKXFxFGBd9c5L998x0ZdJQTTfZuVDt8t8G0nehtMiwNz+hEcZhxRwz1RLMc5jHmtXXUAILXOKMhKMRVBM05HMut9wO7iG48Hrx4UbyIhXtWImcfg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=6dBRwqae3c/5PcJEXB/kDIgVcIFJjfa++K8tVhxCMd8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=g+GIdd3I
Subject: Re: [Buildroot] [PATCH 2/3] package/libgcrypt: bump version to
 1.11.2
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

 > Release notes:
 > https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=blob;f=NEWS;h=3add9aad0cf6dc5a70ce6cb3983a46e585a630b3;hb=737cc63600146f196738a6768679eb016cf866e9
 > https://dev.gnupg.org/T7642

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
