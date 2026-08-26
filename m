Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD76C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D38880992;
	Wed, 26 Aug 2026 20:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2BT1G8KcQMM; Wed, 26 Aug 2026 20:56:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787777797;
	bh=btu5znvS7npyy+3tyYRWttK7s9CXNgKIgensxND0rOA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q6B1ErhyCuJp2T5sUb9cZ6V0sOvT0ZdF9ZT4YIwOnjkezyyFFvCkSRPTUioFhjoDL
	 WX1JaNERTsEDrtQQ1IGQg6z4UjoYEneYdYKMOLU6NFlYRMz5IzqM/DM0ZW+6xCBwzf
	 Xsa83Od5iZBBhV86CrzRSBlMkdMgzzz2YHH7cF8JSVxbNHt06yUUUQCvbaEp80hPjB
	 awjt/XswymYIpTnhM1/+7i7qU+L1Ge1s5KefhbTgs1AgAohm1Fa8u4PF/+Uige4VOQ
	 6wfaBawzN+rTNgOD7rDWueDluATsarZqAI8DEEmZ+6QEv07oHBtS7+dGN5+0ELYJsD
	 G0sYZDKQ9gexQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE9CC8087B;
	Wed, 26 Aug 2026 20:56:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 646A529B
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5676A40247
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPMEhKykZph5 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8045A400A6
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:56:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7761019F593;
 Wed, 26 Aug 2026 22:56:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Aug 2026 22:56:30 +0200
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 22:56:30 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?=
 <flavio.tapajos@newtesc.com.br>
In-Reply-To: <20260826191159.711051-1-thomas.perale@mind.be>
References: <20260826191159.711051-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.18
Message-ID: <8f56f3a9640df87ef4255bc6c84000e2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/rsyslog: upstream patch
 CVE-2026-19654
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

On 26/08/2026 21:11, Thomas Perale via buildroot wrote:
> - CVE-2026-19654:
>     A unauthenticated remote peer may lead rsyslogd to crash due to a 
> flaw
>     in the optional imptcp module. A crafted input sequence during
>     oversize-frame recovery can cause an invalid internal message 
> length
>     and terminate rsyslogd. No confidentiality or integrity impact,
>     privilege escalation, or code execution has been identified. imtcp 
> and
>     the default imptcp framing modes are not affected.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-19654
>   - 
> https://github.com/rsyslog/rsyslog/commit/07b3c40a5a78c79ed9109251f842ca7e955dd586
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
