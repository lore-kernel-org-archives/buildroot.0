Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C942F606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 05:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a8OIg6Um;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=jH4KrX9m
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A52C860AA0;
	Fri, 30 Oct 2026 05:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvBGtzx4UNM8; Fri, 30 Oct 2026 05:39:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D7C060A70
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793338775;
	b=beSpr0SxLlmhWDXKzZG9h56LhY0MH06ksKgCTfvbXu3GuH2ef5ytVsCoTnKBPzlVXnpl
	 QnNEhiB1Gv4MxLH+OWYb5VL2ZRc8GeJbKV3SihWwoES8ILC4JqtTpJymfezr5EbXrNJLs
	 SY3lPc3uDL039fkiJjW8KVJzrwGHNtj4iCJXQ3yqobhzkfCuZIQNE+lVgx5VbXPpWZu2S
	 I0yywyuhaygANV4vFdyzuphedzAjOI3W93fYCb1fIIqpcEqJTC5dzgZLneKOWacW7aIoR
	 Yp0lCHT2LQHfxHwU9Art+osgbIu00KCGviKj8LNbPmyPgYv8PmtfaPC3MdSiv7JMvRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793338775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:In-Reply-To:
	 References:Message-ID:X-Sender:X-Virus-Scanned:X-Virus-Status:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=dVvuisjSnZf7DF61BKoSLLHH4VryN/1TZY3e7EexqRc=;
	b=oH+M2Thk0TpAt81MCPWFLqtlthMMnsA84PSPA5uG6IjNGQdXXt6WFHFz8xeVS0blvHRa
	 vfchl0E/Mlya/f7aXpqIJws6vWjWx7+kJ9PBsXlfdnXf9/NiyA13TCZy+TnFqStUbArfS
	 nCUA+nW/CwA8+Jxq8/tL91H3Yl8RQsyp1qNU40lquixnQvOlgY/2sw4X+AzBOUovBRGnm
	 Lrp/ztXwoPM4YdvlXkwre4W0oRN8lvgRWB+NapZwF7Ts4dFp5R05qCB+uS9pePV8dFNB9
	 cymNIjAsg8mz8Dn9BcKDFtQKZk4S+c1b9LKVdc4p8C/rUfnKfETH9SqbTzQpATppDJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=none header.from=umbiko.net;
	dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=jH4KrX9m;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793338775;
	bh=dVvuisjSnZf7DF61BKoSLLHH4VryN/1TZY3e7EexqRc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a8OIg6UmknVZ/pvyaZdKQ21MT9Sz25BgUF7GXYLZrO0tS95nFJqUTWKqYO3mmMtoE
	 B7/lqqP/Vij5tK5HqFgqKLe6sbBNWJ6A97vdCTYunbUKl+5bfvXaPgAlUJsbQSzHY6
	 X6T4INdUEi9GJPk+ncFzggE3h+xXqsbsFGfr9nJhMfuvTRILhN2IUdkZlbAKTV58Ur
	 gxZvjVeKFfo6SOqGsCTRt54k2/8LY1IeAkQ2Sf7yvWIxP7cFvZMySTmMvRiMnn5N3T
	 wuUM5l3hFC95UtvMc6ESa3uGk6oJQ/Q/X5IuBP0X6AZW0ZvnG+aHPW3PqeNE9eNVlf
	 G0xV0dpCVPy3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D7C060A70;
	Fri, 30 Oct 2026 05:39:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D1B02C7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 05:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E8CB60A70
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 05:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXLMll9i3z8r for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 05:39:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E4C2E606D3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=176.9.89.163
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793338772;
 b=A/R87EEXajmWsdjMhQJW/KSOQC9j3KjCLam1upWjOHYaANNP7mnzdc9EPrmwQg+GiVgQ
 vrjr5LgXlB2vkq7/zh+SX/hhfgURRzLrzxQfaAhwTcfJ3u677ejvfwZ6AvtwJEhOXvuSL
 2mROsb3eTQVaOt9oJzm0oG3H5lMEHc939g9LJk8gIvFTaJOgdLTdLTAvF6lXCuFG21UXb
 AJQkTb+83xb9PJ/N64b1GvDIW6lkLTFkjCp9zn8rN7jo/1oc/AM7bkJ0aMPG0grde83kK
 D88jmBIrQkQ3C4eZoLQAfLUtOelJij8wOAl3x+QdqsrojQHKckzB0OEE3Kt+oGEFxBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793338772;
 h=Received-SPF:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=SzgVOR933lB8dSpsJcCW53Z2Gjvxu2Ji7lxsx3hd/LI=;
 b=dwsL+rRCzwBfCZj+ddtcxt7pgLiEspy/4lj1vGXg/NW8RgR3tNBtGHH9iUYTexQ1e3xn
 CI6Dt1sWqbX8fV5PICLpTDKOWenIkTb38oKFFoGePyHs8AYT2zKu/3GXoQKbVJGSf4ub3
 VbtAXEhWOuGMtUAgvkOwFXNgzeqQ/nvQCn5s/ImrYTB9LFB8F3cQn5JmJF9C0QvJphYeZ
 8K+t0ePIp/g45xen6yH1UPTZS/98RQ/nfMSuHKOKAq3IkkeR37iZfGG9YGTF7dYiwTF5c
 hJllLyi0akWZ/z5Awn05YVSrcyNvBpV7Z5w5MXd/B1GDM5VN35UKL90mEk0KS7rk00A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=umbiko.net;
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=jH4KrX9m; 
 arc=none smtp.remote-ip=176.9.89.163
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=jH4KrX9m
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4C2E606D3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 05:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1793338767; bh=UfWARAiPDIy2XrqWCH3OOScoto6JHTJI6qAJ3mXi2lQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=jH4KrX9mfi4F4+lD234SDddXJG3/ANRTMknNb/F0tS2NDUBBVaIX/Txb3eRtPESfd
 c1XMIxWXwyVLkzQ9K5sWg0jhTscLS8E+6RaDumcKHdxaRPBEvIof7Z357Lr0LGXJbZ
 xCfshzLsHFRsezurAsI3ZcR5iZMESoFC6tFBn39A=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id B402EBDE28EC;
 Fri, 30 Oct 2026 06:39:26 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 05:39:26 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
In-Reply-To: <auOsS9x90TIovctY@windsurf>
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
 <at5oC97YlhN98HHS@windsurf>
 <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
 <45a821b584840d1cabe6df1dfe083fb8@umbiko.net> <auBeTP2NwmLiaDGR@windsurf>
 <ec78e4b982b6b8b0a3ccc04fc9b70ca5@umbiko.net> <auOsS9x90TIovctY@windsurf>
Message-ID: <ce4ac926e3a892fc92bd7fb9e532bbaa@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v2] boot/syslinux: Bump to 6.04-pre2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-29 20:30, Thomas Petazzoni wrote:
> On Wed, Oct 28, 2026 at 04:48:51AM +0000, Andreas Ziegler wrote:
>> On 2026-10-27 08:19, Thomas Petazzoni wrote:
>> > On Tue, Oct 27, 2026 at 04:54:45AM +0000, Andreas Ziegler wrote:
>> >
>> > > Yes, there is still interest in this software, and I sadly mourn the
>> > > absence
>> > > of the don't-delete-host-syslinux patch.
>> >
>> > Not sure to understand this one. Could you clarify? Is Alexander's
>> > patch dropping some feature that exists today in boot/syslinux/ and
>> > that is important for you?
>> 
>> The v1 of this patch was a series, which contained one additional 
>> patch: 
>> https://patchwork.buildroot.org/project/buildroot/patch/20260830181907.106154-2-alexander.sverdlin@gmail.com/
>> . This unfortunately did not meet the upstream requirement. This 
>> change
>> would make a messy (and dangerous) installation of syslinux on the 
>> build
>> machine obsolete.
> 
> Which change? Your proposed change at
> https://patchwork.buildroot.org/project/buildroot/patch/20260830181907.106154-2-alexander.sverdlin@gmail.com/
> ? Sorry, I'm still not following you. Could you perhaps bring a bit
> more context?

Yes, I was referring to the change initiated by the patch.

Alexander originally sent two patches

   [1/2] boot/syslinux: Bump to 6.04-pre2 [1]
   [2/2] boot/syslinux: Don't delete host syslinux installer [2]

2/2 used a pattern already used in other patches (0004, 0005, 0011) to 
build the syslinux binary. This was flagged because it should have been 
up-streamed. Since this is not possible (project discontinued, 
implementation is a buildroot-specific workaround), Alexander chose to 
discontinue it for now.

host/bin/syslinux needs to be executed to make a partition bootable. If 
Buildroot does not supply the binary, the corresponding host package has 
to be installed.

Kind regards,
Andreas

> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

[1] 
https://patchwork.buildroot.org/project/buildroot/patch/20260830181907.106154-1-alexander.sverdlin@gmail.com/
[2] 
https://patchwork.buildroot.org/project/buildroot/patch/20260830181907.106154-2-alexander.sverdlin@gmail.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
