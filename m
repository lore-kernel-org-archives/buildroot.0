Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B33ECC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F6F5406E6;
	Tue, 13 Oct 2026 21:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QUdnMXOYpdkO; Tue, 13 Oct 2026 21:56:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 63FD040689
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928572;
	b=evb5M5F+OZcpJmi5q8ZuWAffBSsKdieYeRykhN5YjgNfVC0sW4UHW8WwTSSalkvCEqgK
	 ruymEbSemmBrgV0MiTjCRzMnQn0ZKmL7jeyujjoJr6jBCp6vq94o1JwKnmC6HOW1/Z0SW
	 y6+u16KEi3+nMOSLgeDzcp+G0i1pg5MxH2xUYI05MvXQwD02QfuzR+zMhxUxUCix0UAMH
	 bSTR99GHF+Wt/d3wi5gHjwvwx9JrrBcBjJGcqvn3NwxSkg36GGy2CQGL5AfSmZt7T1foP
	 gWCw7dW2YyJ4AvdehOgnZpRwdFzXAByXsq2QDahuh26ROuehiMx6Xo1DpYQeIKraRUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928572;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Injected-Via-Gmane:To:From:Date:Message-ID:References:Mime-Version:
	 User-Agent:Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=iSt2U+iV/HR4HeZKHn2CAwgIv0ubccHV0uFSOFEHxvE=;
	b=by+BunCfGbqUBfjFoF9KlcdGiIsqYdoUF8u4tu9Hu8l4VwKRVOvQRLNCMUNuiOozOWn7
	 i4WuJY5+2y4Y4/Ak10K+T6FXyCACkgk2UrKjKW0c18cUjWBNCFkyptKO5GnDgzQ8xSfMA
	 W2lUdOfL9VLWMc4+15hjgcnAS4UJXan5sp3iKaQjy621A5DkMH+yHfR5aA7kud23HZ5rS
	 0ha+knsK2r4SqHByl6ayU6Oz71iMNiqFgT1jyv2RDCgOxe2vbZoUe0pzxkiwWOoIbru9Q
	 4gADHTgWcex/O6I8benuASaaTPKNgxYRuAkQ3anL/JRbcSxI+LylnkW/kgoxE7GLm9Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928572;
	bh=iSt2U+iV/HR4HeZKHn2CAwgIv0ubccHV0uFSOFEHxvE=;
	h=To:From:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UWy50PqV8t0Vlm4GeFDhKcasL7TGN0y4HJhw7BWPJnZCYXe1DLTdZghro5ByzWw5F
	 N6FHGpP04SVz7copi15D+8lgWUBM+tntSeeDdR3XREobtrva8/JkIZvxz6+Cdhww79
	 t/p+ApiCC1NqEBwIAjIbk9gPVVfN1ommxc8Yqia5TDAjQuxhYFeqczucdl7J6Rk8wW
	 V6bnu7wvvimZg2AJ88vo5VL5pNW/mjhFf9CAaIgU6KPngRULgCMZJ7HcDYSjhlK3qS
	 Q7+N60OfdlsxLAchr9hAn+F/L7CN9lx7TcHQOeK6mTVvgpZqHarmVRkEovT91D+8Ox
	 VSZ7YHcq2D7Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63FD040689;
	Tue, 13 Oct 2026 21:56:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E54D2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 142678091C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKY0D9itrnre for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:56:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CD98D80806
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=116.202.254.214
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928570;
 b=XdVcHxJnnvmorWeeJDxe6zB2LPhmEDq4ze97eX6PyB4aQ0t++Ths918epJB9olWt8tZI
 45iVUQAsrZaVThG3l1LVHvqya2MQY+6kzYgfu2YwYNjsya1A1n64YYmbkS+CJ8DGq87D2
 Kebn2q44dfzIKZGjZvHEn3ItH0HyauvW34VuMoENbwWPdn460nK/XqQjLSRhd0VpxX3+2
 mN2dK7g8TbHOXCcVB+ndOuDEDZEtw1Kl7WMIQj8pzZwFoWN64ty4PoUg1OW7YxF8G4N3o
 EupyLYlfPY5PxQsZwQLqAh+L290rVifO88OfZV1XK3+q6uFyzEhTqBuzLjqSV7+dCCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928570;
 h=Received-SPF:Received:X-Injected-Via-Gmane:To:From:Subject:Date:
 Message-ID:References:Mime-Version:Content-Type:
 Content-Transfer-Encoding:User-Agent:Cc;
 bh=hahOUcTkDJWOuyGF0SQs2UMUZAbQH/Elm5sEyonZ8Ow=;
 b=nRUjVV5HvFg2GmTZUA42n/C6J27RnVf9ovBALk/56QH4H9VSjizYgi5L8Xrbrq4cqa9m
 Itoyx2kj2uaRxgdrQcJx8BuAiJuVJlscEdmMYRS1Qg2G5HCRzq7yo3ZqcGaqXNK7iebTc
 jz1vm1WwKwMsS6PWqtbsXtZXREVr37mzpNXRelNUdQQIpeeZmHCEUAfhNie8iUJgMd/z5
 L0DLacd51qTpinrLgiCd0g5/3XuAiowaXR0I90AqOuTjXZxKwo31A+IV4FTRhebUXdT5W
 FY7+he9nik2U/XG7ak/aOTx/RZAUC96Xx8Ru+Y9s2KsWYkLmGgdFJ7sbZORytCCPDSw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=fail header.from=kuhls.net;
 arc=none smtp.remote-ip=116.202.254.214
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD98D80806
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 21:56:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1xGkTf-0009Sw-4A
 for buildroot@busybox.net; Tue, 13 Oct 2026 23:56:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 13 Oct 2026 23:55:19 +0200
Message-ID: <pan$c5588$1d87bba9$b8343b37$60ee4e78@ID-313208.user.individual.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <asniCZ4ltvtZWCh5__25469.4031713129$1791615974$gmane$org@windsurf>
 <pan$444ad$867befee$c29c659$f558e15a@ID-313208.user.individual.net>
 <asnwC9QEUG6c1VSW@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Cc: buildroot@uclibc.org
Subject: Re: [Buildroot] [PATCH v8 00/84] Bump libopenssl, python3, kodi,
 ffmpeg
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

Am Sat, 10 Oct 2026 09:59:32 +0200 schrieb Thomas Petazzoni via buildroot:

> Why is libopenssl bump to 4.0.3 last? Is it because Kodi 21.x will not
> work with OpenSSL 4.0?

No, python 3.14 is incompatible with libopenssl 4.0. And Kodi 21.3 is 
incompatible with python 3.15.

Bumping python3 to 3.15 before the libopenssl will save us from adding a 
9000+ lines patch to python 3.14:
https://patchwork.buildroot.org/project/buildroot/patch/
20260929183607.1849293-49-bernd@kuhls.net/

> Please send separate series for the different topics, even if it means
> that you need to wait for several of those series to be merged before
> you can send some "final" work, like the OpenSSL 4.0 bump itself.

Ok, started with the ffmpeg bump to 7.0.3:
https://patchwork.buildroot.org/project/buildroot/list/?series=1231

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
