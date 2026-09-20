Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9380CC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 540E740AE0;
	Sun, 20 Sep 2026 12:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BCvml9v4_tr; Sun, 20 Sep 2026 12:15:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8947540AA7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789906509;
	b=eOHpHhjXOvUy2I4Wp/ZnQn/NWHyLrjOeTt3dGpJqLuxFm4mxIUn/ij9qgAHiY25HqS9X
	 Qt1roi2F8TfjA8S9gNzP83/El2VF1OXTwphNTsHPV9CAgt1hwXXlPw8Gx50IkdK1w+2wH
	 sCZhsWFwMcJo8Oq9qvdbKMDf0i/U3ZZMj39MQLb04h8dwIhDZY3oDjZ11fVsM0UpExU3d
	 zvYdKWLAAk397lyyaRVAmY23EN5mqT7twGawgtxyIy6GgtdaGrU4wbjbK01k+92I1PQ+d
	 iVhgMG22kcPWMymKENkY8yf8qShWUHw3H9l93jH/vLEVX9jN8EvuKwiQVimmautLxew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789906509;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZPOnjGFhnKbgT7lH5iiX0PcWJCrL5vB2ONyJCQIHQZs=;
	b=fxG0FAv4cPRfgTvwvOjvHdTle4CNCT3yV1ZsG7XMWV9TcMSH/KnsA6uGySEannJNuv9e
	 IXhOC5+EdGUlHhQpyQPG9Vp8qsU3PFbDQ426bn0kysF9Cu6Dk1eqCBabhLBntP+DIfAe5
	 xHG45FxLBr/onHJgHAxZC4FShF4L0lXjP4/vhOaKgsUfpuVzFl0TPX8M4c2Kz82tQJ8eh
	 IdOGj18CGTRgq7H7a5hG1hW3flg/22zqW97kqO8/Utwgzs0cacN7N5kTwO+PHmzgyzByJ
	 A3TVjz2UUYDMliOTUJimx+CGaXTLjZ0gwMPU/APadpEZhn84HA2Qp8vZVeJRtE27Bbg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789906509;
	bh=ZPOnjGFhnKbgT7lH5iiX0PcWJCrL5vB2ONyJCQIHQZs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jWSKBNKP+kU560AWkhm6a++mR5V15e34DOj4vavhplbYiLSWxZ/y/5Udrh8WRWhbS
	 7eR1ZDSQluWbwAZ0ncTvfSJ6OZcISmeZqUFRhFDYoBB9KdsDRUQsCuFgKbRyuOLiMX
	 5pvNYi9hZloRLBWOw7Ciu7uGcuTg7HQy0ewcE29tYvwzhX0EyeS0ClpuUEVaalab7J
	 zivtXzpO4khtKYvwSYw227Q6RjlgcwKmMEd5dE61J+rw/LKjOThr/mLexfhQUxeisZ
	 kXHT0rcwQQuXwgeye602f1XtgBxUfW8Tea8Q5jDt9ATBv4p06WEreTAkfoTtnzsCCd
	 Km0H01LMpWnuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8947540AA7;
	Sun, 20 Sep 2026 12:15:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B470337A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A9B340AA7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0y5prwoX36r for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:15:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0B27540810
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789906506;
 b=iSQ6r4TrLoR49UiJe+9v+NH1dWEB93HVH1sYLt7Zi8Tq0CtysmyBA6r45Elh5VXflsq0
 WEMAMtkO69W3pHGPJFmaGDLbclHRxFEL97DlfTX/3AjXLZaDQA4GKbuV9T/A89/FD/jjp
 Zx4zOOV2D0rG1aJWAW7sp3p1za59WccaDBjp3z21VgT36crOHYjXo4P6kVszqrx6WdwCp
 NupHclfPPsYe1oyIAKtzHiDWzL0Y+GVyi5zwqgloY4bTDy3yy5/XnrV9e1m/O7rrYHf+F
 ONTYqfrL/KsUs2DWMx9luyac2wLk0x3BP6Nm62pJvSBvf11oj1a80OoSyNZK8be4euQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789906506;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=uZMr1wsLjB6JKNIdTSJTWCB9pZgmWaBei1BQE4RtFqw=;
 b=jilgRHh839ZpcE/dTFAPYv6BtWjzg2L5S/tTrKrGksSgjRs4dnHlRo6HwDKkJjTudJcp
 2f3tp3DbCyK4QeAL/AgHlvCBlJNyyzSAfwCt2TYAjU/eLixZeXwW6VvZ6rbJ/+F9tgmSp
 nr54WMhQAu865Qqz02l9B2o6Hn5aEiU1dPV0iuFw57mJ5cFJReUnyd+715UwWnaeE7J4R
 rwKqS0iM2WCgYaedJ1UyMkTcg+cZkFi44v+p4+BRHtsbEDvuAO9rexTc5oOkjm4npjjOC
 +zA+WG5qEy7Ssu+AA6hp7hOL5EmQn/tvJrQkj4JLw+Xivs0wYVm6iq9iK98xVTQQk7Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mqYugbWx; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B27540810
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:15:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 15EFA4E4091B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:15:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DEDDA604C9;
 Sun, 20 Sep 2026 12:15:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D88F3103282B0; 
 Sun, 20 Sep 2026 14:15:00 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:14:59 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <aq_NM15i7OLrpmRK@windsurf>
References: <20260920113231.2342852-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920113231.2342852-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/kbd: requires shared libraries
 if using uClibc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 20, 2026 at 01:32:31PM +0200, Fiona Klute via buildroot wrote:
> Since upstream commit 7fdd8debe37ae52812b77d82e08713bd62c607f4 [1]
> (included from release 2.9.0) libkbdfile unconditionally includes
> dlfcn.h. uClibc provides this header only if shared library support is
> enabled [2], so building kbd fails if BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> and BR2_STATIC_LIBS=y (BR2_SHARED_STATIC_LIBS=y works).

Hm, you bring an interesting problem to the table here. So far,
whenever <dlfcn.h> was used, we simply added a !BR2_STATIC_LIBS
dependency. Just check in the tree:

$ git grep dlcfn

BR2_STATIC_LIBS=y with glibc is not possible.

BR2_STATIC_LIBS=y with uClibc indeed brings this outcome, as in this
case, we build uClibc without dynamic library support, and therefore
dlfcn.h is missing.

The interesting case is BR2_STATIC_LIBS=y with musl. We do allow this
configuration.. but in this case indeed musl will still provide
<dlfcn.h> and allow loading dynamic libraries.

I'm not sure how to handle this. However, for the time being, for the
sake of consistency, I think we should handle this <dlfcn.h> usage of
kbd like we're doing in all other packages: by adding just a
!BR2_STATIC_LIBS dependency.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
