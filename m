Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26898C79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 19:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D413440519;
	Mon,  7 Sep 2026 19:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIog1_8K_8Tj; Mon,  7 Sep 2026 19:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1C4A540518
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788810782;
	b=PqYgbTHx3JE0DhTm+i6CxOPRcO3a5lTBSbLoJE+smd67+4pBOlKP/qJdyle7G/Szy+7y
	 QnasFWLdentp5tcz7j2ujvOWL/EhSPlG+GL+49wXaL5jI3KuJVl/Yf7zn9UgMVeG/oq/3
	 HfFGROT0hY6nwU3b7+JMBpweMA5EruFEmn8NgYOCxBc7aCqGyxOOQBtg1jlfY3828Gq55
	 /ZPIHSTWjmJ0Vi8aLitQKXcHzt8+djHpPkvvKfLZbVqNaGbpWMoMn1sQLHOh6nj6393Fk
	 JhWDSqbiPe7euUhykh8nJtRZypifu6P5Jg79XvLJsTM8h9pTteO0Mxfq6eWyAwD6fZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788810782;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=lEl2bU5MQsjPNP2w4g+Oy8Ac53LZKm2Kyg/E1aScBao=;
	b=DHQtNVDLr8TfkZRRb3728AaMpD5cZAqTGID7jMCrPJnVDL9AdoZqIUIprXx/MCXg3uO0
	 As/fEYsJ6Ll17oDgR8b7Q7XqVU5hz5DZU6IIn5eon8qMFtMGdV45V8lZGv5KLCE2ZUIBV
	 nYMeUbagb2C5jNOwgia8Ov4RYly+Z7RX2HhwUI81vds+T20qdNOgbfZ19IKV+Y3Fn08uN
	 fUtdOdxmH2VDjoPJGt/KB7e0HzJcoWr0shG/NtRztZ1CvgzUXsj9oQ6uU9vninZZXHMp9
	 Qj4uhvyyDxLmNnvqxJloTVmn0QpZP1UAd3hZvhsACWYUzy4UaTewtjrdEebmnZtjQRA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788810782;
	bh=lEl2bU5MQsjPNP2w4g+Oy8Ac53LZKm2Kyg/E1aScBao=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cSCC9XE1guKgOXuYHqoTk8TFuWvKW2fBayqstZNbexv04eaJWtkAiMZEHDerFVc+U
	 HzRVV2EJWRjJXr/+ZsTQ3FCnNR7TqTd18W5AnIH5ApUc/6PeWXSGoDwSVn7yFPcIaL
	 cjafxU5Or3raQLgx1zt4dO5wN1zw/A2KeeqyumTh9yZPceYe3BfIfN9HDDQNLuZ5BI
	 T/+MyWoooWXn9ONZ/ImlTyF8HksrL0S01iq2b8/+jPXAyTfl0Z3M5lVE8QAOqxYhqn
	 8H7rPql18wA+BVS47h36tdG9UpegGijULHFVzkaNenrV/okOgYSJMuFzeuJNBZ8f97
	 41A3IAKS6IY6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C4A540518;
	Mon,  7 Sep 2026 19:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5EDC388
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 19:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98ED740085
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 19:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZcPRoNTrs7j for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 19:52:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0E3214005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788810778;
 b=cIFRmDtbjlibjOkFvmd/u1NtOShywxBGb4a/cii/1eGFzImca0J+Wgbh8e901A1msEej
 N3Naf1IEGOefMurU6leG3RWq2sPapb9Jt7nN6mXjZbwxF6wfSw7Wv6IKHoI0HGxOd7EJ5
 JbVDgMaq8EzXSTC4q98pAzN587vahXd9cI/Qdw2jvmDLEx7y4DzYI8YTNKNu8A/TiTAc5
 eqnO5RImgzocPc8fUP1cy/0IqCEcUra4xn9JyvYd8W8+4iYIBJ7gZWCjCnMN2qmyDoyEZ
 ogsle6ysIfqe9je/smlVsoVPJoywxD+eikA5GPal4hjeqzi+LVrUg40gDPXZ5nkHw6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788810778;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=uzyKRT1YpwPaPF5SIoeauxwXfagT0hLxh+ExoK/XcYA=;
 b=dgd26TbnQ6Y8yYVTgPpqyKMyPs7xllBtaUv9fABiBkgmwaXLvcpYyKNL4CgtLO9hWY/y
 Uz8MGnszyc5m2hMUaepfsbmkaAkgylDGr0oW7qmJLbPgFsShEWN3j1jKT5i6iaiejk2i6
 QT+JVK43QyVipPxh/Muqq/bTKmE9ChBcr0Mpq9isus0fL/0/4bligZ05RtXeG+jXApCFf
 CAGMcUgaJp+r4TjgOrTVtXuSRl9RypzRn3htyPHdOqK44/p5lSZS/2PDjOCldUcYrtk6G
 Wi1RkLl9vMOphNDm/LHCD/euTkaM6NfQG3Ke8A4WAdSCHLdnBbkBBvTdGwwnlrcW3ZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cn7dWwBW; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E3214005A
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 19:52:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6C8DA2003CC;
 Mon,  7 Sep 2026 21:52:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Sep 2026 21:52:52 +0200
MIME-Version: 1.0
Date: Mon, 07 Sep 2026 21:52:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260907155241.3755621-1-bernd@kuhls.net>
References: <20260907155241.3755621-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <6b6c482c7097fe39dd10df4aa68824b3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{rust,
 rust-bin}: bump version to 1.98.1
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

On 07/09/2026 17:52, Bernd Kuhls wrote:
> https://blog.rust-lang.org/2026/09/03/Rust-1.98.1/
> https://blog.rust-lang.org/2026/08/20/Rust-1.98.0/
> 
> Disable the new option compress-debuginfo, introduced in version 1.98.0
> https://github.com/rust-lang/rust/commit/65f06572fb81da89a1a87373aa3e6128060210c1
> 
> to disable a build error reported by Julien:
> https://lists.buildroot.org/pipermail/buildroot/2026-September/808960.html
> 
> rust-lld: error: --compress-debug-sections: LLVM was not built with
> LLVM_ENABLE_ZLIB or did not find zlib at build time
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
