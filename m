Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F22606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jqYYRoAQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08C484072E;
	Sat,  7 Nov 2026 18:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHYuYVHJ-Uk4; Sat,  7 Nov 2026 18:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1833D405AA
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794074892;
	b=XrgDEpI+Iplf2oS2TaiRg0jgcrrJytY7oriaJWFeaMO9bsvzrZhGx7vQguscePZsCtjv
	 P3m1MFiZlpRxNPE+dkhQY7mkHkJMPS6ZHWwOlXYow6cUgMGH0bagsItIl7QgWNqwN4R4n
	 RzCg0qEKX6e+GrcavWUteRiPrhVMVe1wdZDO5RzlBzlFrNpWv1J7hxqg2OrbQxgH1pJvu
	 sFkjisXY9vAMBisyoKuCTYacCCO9njoXIKUP+wiiqY+07SAYCX9H3RmUIlorT7/A/iZXB
	 1qzU0LreEw++UbBp6+4MkQNNs2YFiolf87uuFw+4waJrgg26EZ5e/RvJc3v3vAEejvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794074892;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=XNKrSFyWM1/1rlTWUhFgUi7YB0N52YjwjZ0+FqWH+sM=;
	b=a8wIisYw+41UlLevQA0go7eBrGnJBViLwoLUkYbxzCYtLGx3QJKOerBY2+Ipo7TK6k7c
	 LheZ9kSDwevea39Nj61+4rLu8JGlDVExl3VzjTtTzlYpSg8UOYRru0wD8LaJeN6vmtWcu
	 zcnszm/3c5vtfEduRjaveCLMVakEB0EpYeKMFZHImn4Soh1lX9fX5Ie7yuuPJNHPY8n6D
	 yh4F7OVF3hJtL37G+9B8AOx43ZHLiwUAtBHmOJSAaiegsSut0R7eu0547t5en5tMDdx4a
	 DqKA5NNnTEHPE/pry5bN3SV59Vc9MzwqRjye1GGG8YdMlx1rgqr3x+z+oDRzL/JHvlQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794074892;
	bh=XNKrSFyWM1/1rlTWUhFgUi7YB0N52YjwjZ0+FqWH+sM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jqYYRoAQ2z0MJU8eHrzeuyTTK24rZNKzfGiQiP08BBq1n4lduuDfJZNeBnAHnBO88
	 I0bCrUqOMVrwZzfWJP9MAMIUsrMNMIavZDrmrGtp+x43Foc5GVh7rrJB7AdfZATPhR
	 cZm0a5zKgUTwjRy23mlsUbwbcSkiPcYNyloHdVc0Mt4HG7Jj786tmErRZlRFDNRLhw
	 WS4RKSFHzUOiQsulucGBLyaFHigAcAKfJ+PGV2oo3KmmL52YAoIeTc6T15AfF4E7Eq
	 TASDk4SYpUetqEemOVPGMTLwglSawlK1HknwG84lKMzoPQTZMKH5aNdytx41Wz08Ej
	 8JRamLYRlfRUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1833D405AA;
	Sat,  7 Nov 2026 18:08:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5288BA64
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 439E58103B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsIf_JeL756l for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 18:08:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D89DB80FA1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D89DB80FA1
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:08:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0542120039F;
 Sat,  7 Nov 2026 19:08:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 19:08:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 19:08:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thijs Vermeir <thijsvermeir@gmail.com>
In-Reply-To: <20261027055612.16492-1-bernd@kuhls.net>
References: <20261027055612.16492-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <514801a0d94fd113a505d622f4f368a8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/2] package/x265: fix build on i386
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/2026 06:56, Bernd Kuhls wrote:
> Fixes build error:
> 
> [100%] Linking CXX shared library libx265.so
> /home/autobuild/autobuild/instance-2/output-1/per-package/x265/host/i686-buildroot-linux-musl/bin/ld:
> common/CMakeFiles/common.dir/x86/pixel-a.asm.o: warning:
>  relocation in read-only section `.text'
> /home/autobuild/autobuild/instance-2/output-1/per-package/x265/host/i686-buildroot-linux-musl/bin/ld:
> read-only segment has dynamic relocations
> collect2: error: ld returned 1 exit status
> 
> For details see:
> https://bugzilla.redhat.com/show_bug.cgi?id=2428281
> https://github.com/rpmfusion/x265/commit/acff0da237beea2c1229d743a2eaa16c839e00b3
> 
> Fixes:
> https://autobuild.buildroot.net/results/6ab/6ab6ce2e82a4ccd9ca58b2233a3d496eff697cdc/
> 
> The oldest build error of this kind dates back to 2024:
> https://autobuild.buildroot.net/results/5a0/5a0040e1a5e352fdc7a37ac268083466ad80404b/
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
