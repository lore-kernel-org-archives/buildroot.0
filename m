Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD4ECCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 17:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7ACE4070E;
	Sun, 18 Oct 2026 17:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYv0cQfJQQV5; Sun, 18 Oct 2026 17:50:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 06D18406EF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792345851;
	b=pCBCNOOfZutqW9WDxsj1fDyONH/4F/foN7mCLNZAvdQsAt2MFVT+q5ZhBOSdkIaN3cY9
	 4tis0ldxEsbuLPK4hALqkeMknNEUkzZPeq3K2N11laAugkvJ5yRNDIakA49xFQjF070uw
	 1o3IAn1OqVwDiuvGSRgAyCSf2iTJ0CpsAI9iMZHTdzzxuALZMrKW1Fu+5TdP/7qHF7Cug
	 au8aw+KAihktolg79wjhponVQj62yAdNHAXCWb5eDoaUXlY+OUzrh9lkVUzR/mQ3u+1G/
	 MIVkpptaz720gTWIoqhtUCU1gmooYXZANI51fID1HMUvah1e6otwC4WC2tu696vIEPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792345851;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=NuFcqW/L44Yh8oneVo2p2sY7rdtGPvdNhRVqhlMgAOw=;
	b=QXQiW10KSnEdaMyDD9JI+quxcJgJDzmhjkiWwtFiTQLTbCmCL4p7x1sNRe9sGwgFSChe
	 hFLwi78dYi2AqIhAzLA/u0NLVJMSw/zdzwPATXZ1fvgy3qmX36TS591cKVRNBALJ8FSkP
	 ZqnnGL+/drh/yo5BrJaBFRWLqOeWEAjKZ8+L/JM7eLjak8sSmNwHW5J0RgFD2iIirrz7d
	 qCQfPmr9ip6aqIA9V6FSrs8MvcAOYs6AnDoasGMYgB87P43bK9Qya9Pk/rKCMGmA4pJaB
	 ylTgJlj+SIGwuea+LEGB7GuKqx7z87f8AEHYCu9lOuliFmL8xa0M/VIla+NGVg0S0QA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792345851;
	bh=NuFcqW/L44Yh8oneVo2p2sY7rdtGPvdNhRVqhlMgAOw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pKcZ4N0IFptfCnumpCjVtz9Y4YyWUriUDxs7CblOcPC24lh2wkw1pk47wvEEPc4IM
	 miE1V059fh6g7Oxt21kXMae+vUwdOTf7+p+rWWbC7AcWhZ2AqZ/dtHFNe8Je4pIxRj
	 3NobGl0Fpl5vqX3wirMZTVQaJLg1rJjZ0v+k6rmSWIPlL42xYsZqAKt45zzICgsh4N
	 f+EHtfQziXkQPZmwYBDqYugjvFiuqHz3IsdEByrCIRV+MxdlGXsR0cEd/oMbBwussg
	 i0/UDbokvh5pQVGXYD2AKgNNaTgJZ2QBnnGyCPg7Tu614wDFvEidoqMa/hjTVQHGZZ
	 ekFnphbKUnzLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06D18406EF;
	Sun, 18 Oct 2026 17:50:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BA7D769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D86680FB2
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QERXUgcLvVaq for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 17:50:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23B1480FB1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792345848;
 b=b6BD6Eyi4tSgAPdIkIfKixORdKH4lJ9BQhSGGAgpNwz1Koy3D+6m7330eBXY8FabwV7o
 ow4DZPIcoCJ7crzh5OpEjlcQaQQ0pBCtwdN0kLk4Q7TKdgF5ccJqPtsSNDqXYuBGLsB0Y
 2Gjwwr0EUO2Mu8PHqi0VMzEazNb3/TPSK8UPhzAhgul4wJx8Bg6pOB6BisxliHgy634Rl
 0mWGch5++JvhEzLjFcVjSrupZaB/R4CCWI3t+mMn8H07gszqtu993mBN7gGNA/1BTSJVG
 jJP88Q9pOK0k4/hTLrk8nV7vMIlQZZSVd+5JxNYr9qRTjEDU6B5nyay6AFtJdSS63KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792345848;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=R+ZtIB2SxbFHVvyLqmWKtO0cK690MKGXsy45snuFHdg=;
 b=Q4S5MGKx7EC0C809XyDegpV1sjIzJPH69YI/8lYChA5wNfePO/U3Mhxl7HMDez0jMvwB
 TTIWdNqYTQZS0CioHySu9I4w/IWw1AGE0s57/wgWM8KQnitio15JJyU5TlxqtHjqZtj9u
 pgbaVOuqSBjbFJBy397ZHl4AwFcM2cr7v1zn48hdfzXUQO85fScXAihHsPzdN/wUvliZA
 2vBImXS4xfNLkvSTQHWVJiPLmWlaffIzZnZ88UrC8nVMUp4AZAaJpTEtVrViYeBS2phkz
 R3vguCkRVP9aCAeb17F6CuU8fD9HqYf0IN/Un1C0JQsbAC/Vta/5j2oSX1D7fh6nd5g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="RKZUxK/n"; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23B1480FB1
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 17:50:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 752B3B00563;
 Sun, 18 Oct 2026 19:50:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 19:50:42 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 19:50:42 +0200
To: Bryan Brattlof <bb@ti.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi
 <X15000177@gmail.com>
In-Reply-To: <20261014-uboot-fixes-v1-1-2676fd37a97a@ti.com>
References: <20261014-uboot-fixes-v1-0-2676fd37a97a@ti.com>
 <20261014-uboot-fixes-v1-1-2676fd37a97a@ti.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <da1ddb5f52475161b61ff86f347c180e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/4] configs/ti_am62ax_sk: bump tfa,
 linux and uboot versions
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

Hi Bryan,

On 14/10/2026 19:10, Bryan Brattlof via buildroot wrote:
> Bump the am62ax-sk reference board to use the latest stable tfa, uboot
> and linux kernel releases to pull in the latest bug fixes and features.
> 
> Because swig 4.5.0 removes support for Python 2 compatibility we need 
> to
> backport a patch for U-Boot to remove the Python 2 macros it uses to
> generate the final fimrware images.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>

I applied this series on master, thanks.

For info, I did minor changes to fix check-package errors.
I added the missing "Upstream:" and "Signed-off-by:" (with my name)
tags. I also added links to upstream hash source in linux.hash
files. See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/5ff10177c49d18878e44a1d8ab33e24d1e72ba50

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
