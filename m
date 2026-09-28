Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11718CA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 17:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB456064A;
	Mon, 28 Sep 2026 17:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnbMFMGePbse; Mon, 28 Sep 2026 17:42:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9E6D8606CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790617324;
	b=cdzj7QzysQ6hgCaTeq14+BQC0qi4tTvGAQyHRW6g0SaeZTLe4agdOTsQgRQ5HWAqHmyO
	 gr/yYcxWutVff06DPNFzYIxd5UxvDj21UY5SqfIZ74H6t9YHInxk1Oj6550s+dm05oaWP
	 lsFXXpalJTAVct/LWmTZxMmSnpVKazV7DtokdRFGAmeSCl2b5Q9pBuchgkAGo9w+1oAxQ
	 71mwmmGbNMG2BvrCtUuCmHXvFqsmVQ/rXNITPupvDmXAUqsTpY5cXcZE61/nE9Y14DLKR
	 e12MEADViQl6U4AN+N7KOQKuf3iDN7DAeDSRWbcWbBYPeSRcVZvd/XxTHU+d3TVFtqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790617324;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:Date:
	 To:Cc:Message-ID:References:MIME-Version:Content-Disposition:
	 In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1oQtpbYhRas6nZS7+jqyzHqtMCX5zjFZyP+C5dezyEU=;
	b=Rg+tGncaHQKHKwUwKv9HIYxtk8SLnrQCxGBnlpAQWv/BaxmUT3ADGdqW7GS6rsOiXJVR
	 PRYBCeEq8QyH7w7uPjY58SCBnIN58ephN3q2RMvnDjOGjNY8H8TUH+6Xzr8lrhPPn5fgl
	 XLB+DGz35V5SOcvbSL0Vg+g0Sbu9RkmNMVmx2hUBtC59gtdgiLwInSTAslJ/DuTGJ9k72
	 ss+swdxPB7RRyEdxKWHKzcKFObICUIU4zTav4vR/9agS4PkGQjsRBMAdpihbhBQ09+Z6O
	 Fuw7c5BP13Kprt7CxBM/nu0MO5goHejI7Yu/yVb1E3+UtUhSUvEnv5X3lt+bQFBsHmQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790617324;
	bh=1oQtpbYhRas6nZS7+jqyzHqtMCX5zjFZyP+C5dezyEU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i8AQgBj03jb3FtwiBr/h21uiqK0ShNN/SWx1smkx61aUFVaHkWbp7o2V0cLyAPzIo
	 B4FlDnma2zQdc0oHkyeUsq4rGRhO6xtNszWO4X+wscB0bkQD1iAe8LiEiOWelZ2ECT
	 +IqVuP03kHl5ne3RLUQ+fbcIw4/o62PRp1Y2+Zyt+xBc8ep9WI79iEZKFqRDtBPOVH
	 gVIVbQXCEzwB8ufqm4UM0hFY9rSgM3Z+Q9qNQAaT1IW2qzOD2AIjfdRCpu2Iq1wJP5
	 U1XVxKsEQh5UT4vL0Lw0qBozNx1US1j1Ve6047PsHSUmLxmeL1ki7+eAcmtlf3gm52
	 kvwnu9tP/irDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E6D8606CE;
	Mon, 28 Sep 2026 17:42:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 466711E8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 17:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 438D8606CE
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 17:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGohHz1vt6Hs for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 17:42:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 13D7B6064A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790617322;
 b=mtjDxqZFHfMiIxkcz48cNH/EXqYqySDiCkWPR1OBuxfYvr3uV/w4UB9A6VWUozzQGAX0
 o0k0xcfBiNSC2Ohe4yI5eg4UisJNb4UzueKLYpVyk4nM2FeDu0N/nbyxueakmr3MUoIN5
 yDYTaZUTI73kgdXZoXi2Kn9HT0hJDLlxg9I2V1uD1sbM3QzWS8Vtt3hawsH40ZwDPPqqA
 bQSrEWq2Jaz+SwiEDYeV61SuWhb014uN6PpNhjTt2G3/tnKdV6m2Bx7icBA3JcUa5huDk
 wnElMiaIyiuwW8DO/9pnRVspRmiCIW2xIxyc4Ap/MCWrJ8mzVyK4gTCntHYtSEW+rxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790617322;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=lg/3lpTTkV14Ib/1Hph4oUelp8fUwRd6NQ+zDQGpsYU=;
 b=I1j3aVSiXebuH1VAWgT1P2kkXUFxDzDIoI/UgjbKa2KQ3c5aorkDTm5IgUjn8K1xcGuw
 JJeuavmLMFDQADYZ4c9RbsV2JkYzKniUVk997bHyNlT3714hwV34CnHxEnHdXLQSdg3DS
 URU+4EkxL/NogCvPD2GczFVixhZTpthqQ381qLuYrEKt0izUF93mLxdp58dT7/6EiYUfc
 lMHhxlFxCWkvWDRyT3zPPyQvcrJAU1OieRS187UBIMQDaAH69UOvnutI3i0+OFJqkXsR5
 t3IY7E3yv+R8dvbpsxaucG9L7vszBrE/grFEXGe0lhT9yxmmBkwIT1eFeNBKrnpzPPg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eGQDd6Bf; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13D7B6064A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 17:42:00 +0000 (UTC)
Received: from L30177.local (unknown
 [IPv6:2a01:e0a:ac2:22b0:78a2:84b2:2635:609b])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 162E119F5C6;
 Mon, 28 Sep 2026 19:41:57 +0200 (CEST)
Date: Mon, 28 Sep 2026 19:41:54 +0200
To: Thibaut Collet <thbt.cllt@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <arqm4rbu8CnrzzSh@L30177.local>
References: <20260928152218.94978-1-thbt.cllt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928152218.94978-1-thbt.cllt@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/lldpd: fix compilation issue with
 kernel 7.3 on aarch64
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thibaut,

> +define LLDPD_DROP_UAPI_FILES
> +	rm -rf $(@D)/include/linux
> +endef
> +LLDPD_POST_PATCH_HOOKS += LLDPD_DROP_UAPI_FILES

LGTM so it'll support the current package versions. However,
could the lldpd's build framework be updated too with a mean
to avoid such patch ?

Reviewed-by: Vincent Jardin <vjardin@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
