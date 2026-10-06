Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FCFCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0FDA60847;
	Tue,  6 Oct 2026 16:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiWV56h5g-Wq; Tue,  6 Oct 2026 16:33:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E884660809
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304439;
	b=XP7+GyZxcJGQZwAm9DhKsZNOePvxFr8iDDBHL1vv/GwF7KiZHFUeSdO+6HtfUhkyGtUe
	 KbQOoSbc5zjqSqzfJ4WaSiETIfhofu9o0hHrUzcG6T54/pCEt0Fe7hD0oF65ybdQ3wKfo
	 6qjTvHfeIgGxfceq6PcnkAZTBk6kyuFfvzpeWyDQhvptifEp+V5JXjQGsO1zpirNPEfp+
	 Q3Zd3/3+r6MYQ7MfBKOupjOnrb/TcMjhgjBP+oV85lhNvBkc2GgeXpFE8zqHWgWIh0zkL
	 AaWAncdsJ70OsnuU3j0mYyQu3NqEQ7QX8/zdywoUvHsonBkai4mXLcBfhY3C0zO3onw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304439;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=aI47CUsdWya5moCHpiAlZw73TJ9rliaS/E53IpVVHOQ=;
	b=ZWT+o2rnQUlst+s+11yFhN3lLjjDkgGy9g48XE+/6uDBJhLRwRb4+onnlrj89+nBKB98
	 A+cp5ZVDBQwAJCUqkTO9kjMfDMctUCXmoUGAjCh5am1sKydyxaW+zESMcJsUDyNY7aq6H
	 YkNCdZfly1gXKuIDi72BXSnOdIOFOTjJT0pwfWUJmr/8BRFDlDl+t8rHfQwnfF1AG+p02
	 4IQcMPsXKruild8bPsvrFQjR0Tt0n9dKL7ljxooG6WDpOFkEQSIe1b5cQVBrnaTXGwuPB
	 edcRKCZ0Eggmsut9LJPMtzS29/J7TdL5RJ5LpYmocvyvFRHJkna3whhthj7OevK78jw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304439;
	bh=aI47CUsdWya5moCHpiAlZw73TJ9rliaS/E53IpVVHOQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hr4Rrp5DzHLhVhB94WbYBHZuX4FGcB9Qk9oWBkkH9T+d1F9JqIO2SxPYHkd8F/pwL
	 KDCAdsj2CWs2ZDGxeO0mm0HYG1n58k9RnUkBxk27wZAAKCSuWGeDX4giyygNeWuiDT
	 T/C3IhQQ4m9IKZhgE49Sv83LTIO8+KOeNFQ7a+0tjihKiGS44Ilt3x8ubzPRDamJg4
	 m/QvdOGZccRfSqyiaDrODkrG3hM1q2Xg/e01kMdBf0Ukqrihp5YEHSHw9uw8KtipMF
	 VWVSyFw5Lfe/o+D9FWX1lpJDG5axwev85rz4rrjqQNaz/oU/0KyxRgh+2S/IpdRB/4
	 lxPBZBrVob7Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E884660809;
	Tue,  6 Oct 2026 16:33:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92B90317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DE9680D98
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ek6Zg8Qzdl-n for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:30:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CDC6A80DB8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304219;
 b=nyY/qM0ggK604st5ddP/ASUy1rs1lKP1fRT1Lif8buehzU0Z4Cxfpef8SFmINFHnR0Us
 /OTtA4uYot73NvU9LWMspO0zWAcbW60dg7TJodEPzCcbCTjFa2YHF75bnc65ZI0MBeApS
 4c0FxMszatur1tD39KPp2C4a4oQYHRfBGnH4yjFkyn/Loz3PqdO4X9uZN7VqyY9GE2+jN
 1uKpO5Jenc4Ic5oz095Nh3afOKGGnXCC2cyM60WSGaAMrZHFKSkL3AxnCCG+AETxGy/G/
 7naY0fQfLZY1CVqshU8yqiaA34xhfBO3hIy04gp/g3sLTBQya4yftUDyw7CBoTY1C0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304219;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=uyXZNtTGFvEzKcyynPc7H1k0w7JCHq0cpwI7phuhXAE=;
 b=ZcKx0a/oNuWhtBowtQlfo+Gsi5BJrsJi/uLGjNMAnCbd1QUu+eazzVwZqQqsSbP5tSrd
 r01JfeBJ4w2ce8dP5yIOUS591ge+XndWJu+slQB6jKAEo9eRg2pkyzI8YQU+BnJvXRwtO
 n3Rt0ExITxhQ1DTLBfVFTmTP4pkwG4/XWTXMKGT33oYVDvu8ZK+9rexcSgF2T3PoGlmSd
 sgLhfkyYmH3j+PMYPxT05oLSng8tHllYYF7COhtS6yXToc+lwpzF21GrBhBjiXKh9Sg7I
 qLvu43cnIXF4nMhoLkECJQeyVS6WktvM8VZFatk3S4LkMMQJsBLJABSeb6rbTatX/NQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C+q0nyHK; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDC6A80DB8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7609213F86A;
 Tue,  6 Oct 2026 18:30:15 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:41332])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 18:30:15 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 18:30:15 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261004202501.932522-1-james.hilliard1@gmail.com>
References: <20261004202501.932522-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <b6d670d10bdcb66a5a621015aa95f637@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] package/python-maturin: bump to version
 1.15.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/10/2026 22:24, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
