Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC79C88E59
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EEEB40741;
	Sat, 12 Sep 2026 13:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAy2-dfYylso; Sat, 12 Sep 2026 13:59:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4458C4072E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789221559;
	b=NFwcN/Ixc9496oyo6ahWqgp4Yv8lj/9jgFUYdUkOaOnjsmh10Hr9drkZPmUYoWtwggwD
	 paT5f/jBQ2jwvBPI6DYuyg2kgfaPDza5GbXL7akcU2PbrsAmaCSohR7Xdy8WOJWRFJ8DM
	 cD8Os1nqp8p2ZwvIl2wp5uHVpYbSBm6P5DFIRGFpUql8pXNK9W+lGJPG5GnpSgMySz0mv
	 g/TBlhyTIHKELvD+9Zduby/8knLfLq6P36nh59OiasVMHHMfLTOyKRF749/OzzCXTiPAO
	 wcOJcwmq69Im9R07l8RKl0VqwnHg9ZQZpMGop8Q/rnIfFyU9P+SBBVKhvQiYJjAtL6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789221559;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ExVhKrpgpWfwTwo/0gTJ489tgpMEbexyjIWu1NgVucM=;
	b=QrA1S+DTuJFH5GrlBreXWvd1HFNcsY4OTydxKfYyNGQtsL583C9T2SmyOfpbr3khzWdy
	 o+e/ojiQsACzm5UZ+AEKvQm4chOEyS4DdWSSD/Pw2ZyZBVnsM4QZ6/4yzKC1lEivSWAIC
	 MG2y57eicM0Xq1Q1vGsJXfZxU6wG+JOTn5N/XtfMEMzjdxFfMDxaqeOD0lpMEws1b4uHG
	 x9vD+ZqAdEij8psPSFBOydiu2lMSxt5aXA8VIugSeNi2DU5Dkt8OSNukd4SgGS7u+aoc1
	 pLmPasBik00F2um8Hdx6MP/YH0TsrFH1a4J2C4i8BBdGwVRhgzPyggJsOH21Z4E977w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789221559;
	bh=ExVhKrpgpWfwTwo/0gTJ489tgpMEbexyjIWu1NgVucM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m7NhmtmLtu9H9wupZ5IsuDRLIaNQ36YckZP3gQ6QiIkQJUZFuAXxbmz3Xe8fbdkHc
	 RL/0vG9TQiNsNgZzxP/9gCg6W64e3F/rNV+2TqLRfw4Cr4SpZYV5c/UNFs2UjRqmE9
	 OWipLqw+dTeVhC2szTgHhqyiqnNpY8eoMGpriZJQUATsH1wnfbCri1sO2diM3QGcZq
	 utPNN3C1WgsUwIcKlmKzfRVloY9xrinlx3rOVgIYNWzCQ+AMNMQ0HsLt9WtVztIzx4
	 RaTObwO1meL112HROUA9DZiS7PzjHDd3BbsEd2V34jPNOK5eN7OFXeUsS5GV5nMgjX
	 TGVlBluD7wnGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4458C4072E;
	Sat, 12 Sep 2026 13:59:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4887E23F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E0724072E
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OHMLMa0z4oz for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:59:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 53CF940719
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789221556;
 b=jqYv1uevpjo9D5cdNuc3XSEX6DwwW3hBaadTbk/6cG1cQPw1YkmezJh65qOZTgk0TGnH
 Oyrfw3TIkauC2JPUT/pCuDBE1Vcxji+0xXWKHrzrOGmchI4NqjKApcO1Op5pEbhU4iQw1
 0S5Fp2wxxlJ5CQhoAlLZ1gsJ6DIRz5ZHgIWVjc1eOJ4wG6c8TIKrwRFe1gmz7ji27muSo
 efqN6XCroB0/k15s6AVqXwWAhEj0FoRB8odzPCHCPELGL+KmRdDOsOxCGKqrct387CxHU
 8RbysH496j+ae71f8zQ3DZA07lUUnbS3JbQr8DD3ONsjsyC2EPAK4lrZ47LiDqX9iXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789221556;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=hB0vBF3uPz4eE78Cvnp/uoOr0dB0zLQBH4QNXbPQt0E=;
 b=Fpt2EvFGdmFsBQuAgRlNXDsgw+V4lsmgVDy7FBCsIw7EyjXPVk/NctxopaLAR4+v+Z80
 C0cR0edO45WLXZgB3E7dAB6rJf78+njFF+h4rksW+YsEftkzDXGryChkD5vKKUSjek8Z5
 yT6g/a93IoTSEIBr+9Tz2gzKr7HYGgBvOC7LK1GLEv+kRTr+fAvYIaDiGT7uogzLssu95
 NbLqTrzqYVZqErU66iVeuL/3PwAEeDpp1BizJajQ5aUgU3H1RNXDcE/xrbrTLFl43tDPC
 bJYawUP+8CIiYfKlQli2GqLyjvHe3jHKgjbtFEmOCVjFjK2mLiZPat2saH3nar6l3Bg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tGnuKLuE; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53CF940719
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:59:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EF0E013F86E;
 Sat, 12 Sep 2026 15:59:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 15:59:12 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 15:59:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260906091113.3583868-1-bernd@kuhls.net>
References: <20260906091113.3583868-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <0f906c5cce11a5ce468d180a24646422@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/softhsm2: bump version to 2.7.0
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

On 06/09/2026 11:11, Bernd Kuhls wrote:
> https://github.com/softhsm/SoftHSMv2/releases/tag/2.7.0
> 
> Switched repo to new standalone repo:
> https://github.com/softhsm/SoftHSMv2/commit/2355064ce4df21cda919d1600a7299e762918338
> 
> We need to use the github helper to download the code which also needs
> autoreconf.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
