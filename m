Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9FED5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 16:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 109C081199;
	Sat,  9 Nov 2024 16:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZdNHoqMdzdI; Sat,  9 Nov 2024 16:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 247E881347
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 247E881347;
	Sat,  9 Nov 2024 16:23:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C8BD8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 108BA81199
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DTKRXY1h2Nc for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 16:23:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8218181347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8218181347
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8218181347
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:23:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9D00FF806;
 Sat,  9 Nov 2024 16:23:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t9oF3-006IRj-0r;
 Sat, 09 Nov 2024 17:23:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
References: <Zuj3qpOmPcV0BhTw@waldemar-brodkorb.de>
Date: Sat, 09 Nov 2024 17:23:17 +0100
In-Reply-To: <Zuj3qpOmPcV0BhTw@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Tue, 17 Sep 2024 05:29:46 +0200")
Message-ID: <87y11scr62.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/bind: force shared build
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > We got following error with --enable-static:
 > checking whether to build static libraries... yes
 > configure: error: Static linking is not supported as it disables dlopen() and certain security features (e.g. RELRO, ASLR)

 > Fixes:

 >  http://autobuild.buildroot.org/results/b55/b553898381ff0fdf5dd705fbb11b469b7564c6e6

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed to 2024.02.x and 2024.08.x, thanks.

> ---
 >  package/bind/bind.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/bind/bind.mk b/package/bind/bind.mk
 > index 217c9916fd..d594ab5e39 100644
 > --- a/package/bind/bind.mk
 > +++ b/package/bind/bind.mk
 > @@ -33,6 +33,7 @@ BIND_CONF_OPTS = \
 >  	--enable-epoll \
 >  	--disable-doh \
 >  	--disable-backtrace \
 > +	--disable-static \
 >  	--with-openssl=$(STAGING_DIR)/usr
 
 >  BIND_DEPENDENCIES = host-pkgconf libuv openssl
 > -- 

 > 2.39.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
