Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C56ECA601E
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 19:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50625812B4;
	Fri,  9 Oct 2026 19:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebLZUarUTSDK; Fri,  9 Oct 2026 19:35:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7415D813CB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791574540;
	b=QMOumPDBBEmb3d+ky6/KQS9aa0umumqDRH/CZimKPLkkVfB2HnCugUu9n3QH8boDLACU
	 i2Go3bCr3zLbJTWccdotI3tRa840ws8oMOPcLdpbS5of8Np2MdD59Dqze6M0pLiZwdn8g
	 LqnHs8J3ptgCZyTK3wL6HBHaJ5NbfHCqET0eWTEXjmrGPIZ2Ipl10PfMsloxqyxpgQIs2
	 WqsCpFxsl6aZS1eCCVZNA4rhGxYm3GzMOiRvj1Nd1nQOqYunls6L0LEub/Cg6T6I2vnXj
	 OEkYzOosouQwLkJR3kPyM9LPO3plwQ/Ii1hozasIM6dqjMG+MUj4+k/lBpmncsK0cgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791574540;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=R6IuMkqdh0n7CmAt0t/tvJKEmnNVnrG8PhQJckOPzvo=;
	b=nHhXxJ/vQBZK97PzWvZUdqOJ1DrZRfiFwEeD2RQ52QtzBdwPuDPn+Vy5Nbmle/I+Jd0s
	 druC8VFe1jquXRfznxzLfYHZUJtIfMkx2KT2XPAs4x+ZS/Hr2Ih5nwpcvjsqNJzCbd29b
	 y+W4UVaZUAmHp9luiayEn5MjrH0kh39j+M4YL2OD+7clnoLXwY7UJZ/6Kq0kcBt41SeN+
	 hQWpzuAPB8ROqYd2jaB4LHOJZGeqLZ4TVxf7iEexeh/gQAIslfzRlUrmOvXm1Qvd3FBR2
	 4J8I+k3/BPuG7onl1KuQWlvd0FlwuBGzrYby5lPskmT+tvjM6GAB1DuTAPE/wouTV4A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791574540;
	bh=R6IuMkqdh0n7CmAt0t/tvJKEmnNVnrG8PhQJckOPzvo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l1tGd4/MeUkAomCF00dTb6t5556gAZmhZOyxowMCFQQUgrIL2SU8dlpxRoJDjQM8e
	 TCWueliST3lqbNUzqp0aU8gnNvLDtUxM+LWBiYMVw7hoBcgvgg/fx/mdGak5K09UiH
	 cXsAidLLTuoqyzhAnZnj9NFC2exKJdCwx4aSnuAIgslImk5viA3FgAln9Q0/KQ4xGW
	 OaFM9A3GG/9283H/ibOux43dmf359SVCoOGr7odWBW2nTQRuuiABiVOePZoAuXxTlB
	 5DJ9rZnvmiJhBzwxPTCF5jgelZlVWKWK+fqw8ytXs3CDBwdCXzXQTouAZ7gZFpAOE/
	 jE8AW6eoAU0Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7415D813CB;
	Fri,  9 Oct 2026 19:35:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D03D3B4
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 533BD40080
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTLYK-6GZUL9 for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 19:35:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CD81B40053
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791574538;
 b=QMmtbGrGCN3/8DBIFL/lfmIIfyrTLqNxK9A30HLFpkDDxYRmkorclRPYdmEQkshQkJtD
 bFVPhE4X5O3lyCHsg6kpPPlqg4gCCtDiTtbgcYf4zlnwh4xw9JpuFueA6lCvYxAZriDXt
 JjTS7DlEZcsmdB33rBT/JIEMT4crxMbzfY/6/jaw6dS0FQo937CeUeoACU0W2srGcf47D
 f3jXMFazyuHIhncyzzDUhVEPHH+EWu89BOT//iORf0+nIZUGui0WI0Kd0zbJGwPhAieZg
 R1iIZTIZrZSmyeTZB7ZWOoeheGpZKdgMYwrr6ouyCf8f+2b8E1MhrW7oxPsXtNeJDqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791574538;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=cctTY3hyfSCg4KOjtHdNvK73ZFXFv9JXj6StZOuazPc=;
 b=ErpZ1TffxCEQF1WnhzFcjpHjG/8nk/sO83i/pxRQiD0I1j1p4kOt9sx/h6jY3cd4UHAD
 baXjcE+p+6jsGXd9Jsk+QH9gVRhR7Xyf0/R/z6GdkMoK8IDSUbKpkamP2CjUsnDZhKf+h
 nADe4vy2P+8keAWX4lk7HJDnex3XUFR1K9ZppSeU/2m0bJcxtpkOvTYOGqMWt4os/kaA1
 Z0ZfICsrnB6t5nFVmyVZUozEnKeOpAcV8J8WhrLNclCfanBHj+WshEE2J32N743ILi/6R
 lhnwtdF9SrsR6+YpU/QAb+RAhJ2b4yUHEnBJIi6zdR4Q3oFf7pbZJS/PZvUNtQIaQGQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rPfQSIYp; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD81B40053
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:35:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 88FCC78034E;
 Fri,  9 Oct 2026 21:35:34 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:51246])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Oct 2026 21:35:34 +0200
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 21:35:34 +0200
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261009022020.2337-1-cp0613@linux.alibaba.com>
References: <20261009022020.2337-1-cp0613@linux.alibaba.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <482f5886f7e49e54207569c7bd626c2a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/iniparser: bump version to 4.3.2
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

On 09/10/2026 04:20, Chen Pei wrote:
> https://gitlab.com/iniparser/iniparser/-/releases/v4.3.2
> 
> Bugfix releases. 4.3.1 fixes iniparser_dump_ini() repeating the
> previous value for NULL values, fixes dictionary_new() not detecting a
> failed calloc() of the key array, and documents values without a
> section. 4.3.2 lessens the strictness of the version macro test. The
> SONAME major version is unchanged.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
