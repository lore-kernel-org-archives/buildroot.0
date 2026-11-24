Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29001606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XTrR2mxe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 002EB60814;
	Tue, 24 Nov 2026 11:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JiIZa6jPNxug; Tue, 24 Nov 2026 11:34:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0E5FF607EB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795520057;
	b=ZFDyZJbddq12ENzQ95o3beIXYUDM+eZWERNdJjVYGii6xoMA6WPEuD7cwaHUlAZmPlWV
	 IDq+2Y23uXGR/I+3sILF+++ZamN1XyStchsQrqzMJarwq5I86OUJheAdHQSmaU2XSxlsq
	 1WrTHy22wmfx57LyZCZbEGR+g0+BANd8bfF08/SEpjOGWyqt+VU9BH9Y18rtBJ4ZCogjh
	 djT1yVvhQtnWQo773AcPUfPcoKQj/Fgyb0K66QpsRkB7QqusfpzCtT40gD3erEPaPY3kS
	 YgC+rDSw0GZN0lCSxIgmnE2b2z7YyBsFJs0bBH83yBaFedR1R0bAmKHn+QWtlpBlOMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520057;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FeirYERk2GM1m8XMkkSJue/ajNLtmmaUCN8MypwpFL4=;
	b=k/5Tqj0gx7cOJi+1ybc+ihF5BWrt15cabuLT3hYgmu2lEJ4BY8R9d2MP+fXtf3mJoTnO
	 MTODhhWuIZ4a3zDuwc7FuxGlnhK8Z17EuPFj42USdgJNQ7nq1F4Xmg3Wjm1IkcTWUXzyq
	 ZZl9vQoips5W5uLzUWvl/yrAF+k0zl4C3hAhkvIFNm3jYgI94yeTMRdtoZyRkF3bqBc2V
	 +GFEW0kSGJc7rhOwVEOX0p2wEdyWI1sCpgUaVr7c4pK8//SnrO1bV7Fktu8BYsGJHrwBD
	 k8eE25Kr1enGkv/8HLiNL9Xo2li9yhkQgNCh2DzIZ4GXoMDZBrI0yJrgMiQtGQtIOyQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795520057;
	bh=FeirYERk2GM1m8XMkkSJue/ajNLtmmaUCN8MypwpFL4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XTrR2mxe4Zy2iA3jUkSW733GpmL58RrTXXcJ/UnybUS6J2z4OOd35j04Mzc9vzt30
	 /spH4RHXSF3qAMxGj3z1XE7QOBxT9uEUqadA73i8sDVO90jdVaiyetBOL/awei6eTc
	 H/EzmedA0a1K2vdJgQ7gKD6fhBcaoMIrtWVpp4N/xq419mtBf8T3b3uq4uFpVDOnUt
	 s/vPUr53d0ynwWsIGkqn5sSmIArGfqAbtge7/eq1UI1sHl53zsOkKvOgQHNb+XmTNr
	 jRpM5Llvlnl3VubftNnwGxH+YUA0P/AmXLHtvOOuZ6/nPR0axdOa6bG84g3h/c/tcJ
	 TAS6T1uao6nog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E5FF607EB;
	Tue, 24 Nov 2026 11:34:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C69DE1C9
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B83FA607EB
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7HF6XokE1Fu for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 11:34:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4FDD060689
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FDD060689
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:34:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 69DC8780375;
 Tue, 24 Nov 2026 12:34:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Tue, 24 Nov 2026 12:34:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 12:34:11 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <d727ccd0-ad20-497e-a20e-5e5699173dcd@benettiengineering.com>
References: <20261124090801.316109-1-giulio.benetti@benettiengineering.com>
 <d727ccd0-ad20-497e-a20e-5e5699173dcd@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <18be9448ea8f3b2d7fc0e465d11c372b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 10:09, Giulio Benetti wrote:
> Pardon, this is a security bump. Is it possible to reword it while 
> committing?
> 
> Best regards
> Giulio
> 
> On 11/24/26 10:08 AM, Giulio Benetti wrote:
>> This is a stable security bug-fix release that hardens on-disk 
>> metadata
>> validation (LUKS1/LUKS2, OPAL, BITLK, verity) and fixes keyring 
>> handling.
>> 
>> For release note, see:
>> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.9/docs/v2.8.9-ReleaseNotes
>> 
>> Assisted-By: Claude Opus 5.5
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, after rewording commit title as "security bump".

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
