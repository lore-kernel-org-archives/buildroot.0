Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986BAC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 20:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 420B38333F;
	Wed,  1 Jul 2026 20:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Dhc4byxPLiG; Wed,  1 Jul 2026 20:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D290982BBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782936743;
	bh=mBRP7yeUftC+THcVIIzNmgqkzVbYU+hGlwPkGFjShKc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e6TInanEe+7aucbH9HEusV5QFU217hum2WV3Zm+Iv4i8XT31/WGI/7hhZu1aQGmed
	 WRRazOdvME2Vaj8pD3M13e+j/7ruXzMpPNLILqv6BEe7scCnLL3yb1IfF95LA5VWk5
	 gPDRggATAgnwC4AHGcvKEez6rrrVNFeclZ9NtRqFkZmASFZadynxYZhsWpuZobnJ0Z
	 6ovuEMpYhb5ekY8fIScgxNqOuazgsiKxz0KOFGX96z3cttINmcwbGeSn7UazpLY9o5
	 7QbcFv/cqE+Qbc73rqSBWY5LMPK04hnfpI+Tp1mCkb/YGGI/idqwHUlX6NtE99Ncfe
	 w2sC8cjOCE0qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D290982BBA;
	Wed,  1 Jul 2026 20:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7871127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D9E640CB6
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMHT5u9EQsJv for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 20:12:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83F6940DBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F6940DBB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83F6940DBB
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:12:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1156414241; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 20:12:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wf1I8-000000033Do-1nyA;
 Wed, 01 Jul 2026 22:12:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260624185403.1182797-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 24 Jun 2026 20:54:03 +0200")
References: <20260624185403.1182797-1-bernd@kuhls.net>
Date: Wed, 01 Jul 2026 22:12:16 +0200
Message-ID: <87echmpizj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=cYSwFPcxNPT9AmRPgl3vZ5nXFv5Xd2iVl+Wk969ZBvg2mzHofxKTXR3HbGcH68Yi8KtddNhL0hyQMhX81Uvk52obxZiYszJ6lkdp7XZS1HobvAbcMnaAvE8aI+4enkykJ1zfBCeWqJ8Yt2RLfGbjKRO5RhbH8/Au8AFPN3hzQNtaRXq0lCHXhmJl0K5eeP4pAAWxjTGZZUfTq2okYh4+sa3DB3JUtWLIiQxuwsm1o5qghyExYHhq7axNF76T151EXykedNY0F9Rg13Nuin1GFbj6CwgUoGRqTu/Zz79/1talFCRybs13Phm5G1tQ+syypR9QJcvEw7weDtXPKaql5Q==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=dSvrxlmGS1BeTBkGvpwprEKvYGlhngYZTPoznWS7dyQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=cYSwFPcx
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 21.5.21-Omega
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

 > https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.20-Omega
 > https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.21-Omega

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipeline passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/8fd9e5b9ad1ed7ddc84f42da726d43e2d918dd13

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
