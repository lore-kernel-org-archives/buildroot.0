Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C26ECD6E64
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 08:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93479614DA;
	Wed,  3 Jun 2026 08:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTAl2qnMsz6K; Wed,  3 Jun 2026 08:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38F9D613F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780474015;
	bh=HDUCGF+lpxGwOZcZ6w0cjndNwqOc24cC4JBWfLTaIIE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bhI0g4X8rXotDDuuvQLcXBmP52Ys2NmgSQ3P2XM6dyAL71WRIGTn0CLtlnkkqZnQB
	 PdJWe5sZkwNxrfnovOjVyxWxrvI/5tzBYnXosfugR/gbRVhuOrD+6W6lJvSqbsjyu0
	 68SdNjS3YNFs29/bY92WKAd13sFEuJwcuEsxZ01ixt92JHrU66dXe6a3FtsL4S/S4Y
	 X1aLqqRx7sfScYGzHUTj3OVJZ8F3YzPqPh072agLnhpLPwZx8coInoMw1SGFP62/0a
	 1UlwXA+MziLuc34KqiJgPMz0wmQTlTocDXV0d8y0ye5tQtNF9QXvKr7MHJj8fCbGJY
	 zwhDcuQzx4xRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F9D613F5;
	Wed,  3 Jun 2026 08:06:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6593353
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC00040FDD
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThotDzUMDIk4 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 08:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD19B40FDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD19B40FDC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD19B40FDC
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:06:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1204914070; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 08:06:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUgch-0000000CI7C-49IK;
 Wed, 03 Jun 2026 10:06:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260602214908.1292981-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 2 Jun 2026 23:49:08 +0200")
References: <20260602214908.1292981-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 10:06:47 +0200
Message-ID: <87mrxcoxns.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rFjTp/TU6J9XGhBQgLzZLI9sTcJEDvl9Y5tqjPvucrALVM8IYpGrEMGwDpcec1/Nr4ur+KE6rD9NWC3SZVwB2KnMZ10otud5aaAkV6EyWbALHu1vWwmHJUDcDrIJll68wPhHPcvvwjoM3On3eLGsXla8hoM4RuaJl6f0PeuSRwQ6CLaPupMi4Uxiu7eYITfve0n4AkFIsJ4sI3DFgQvdU2ae1ooXx/K+LvmJGfNC0tvnvg33FSsmvPgHsyriBU8mn9E8Rg0sZ650ar4fMnpqx/5eWk4oHa5T1mtA3Up9mtKkMonIhCNotnNQqq9pyaXLLv/J3wXP6hzyTwAt6/CjEg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ekd+o/nuFgH6lCKfKQH0ALgP14oDx5E3zM3j5gGnwLY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=rFjTp/TU
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: security bump version
 to 4.2.0
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://www.privoxy.org/gitweb/?p=privoxy.git;a=blob;f=ChangeLog;h=d62aa6bf0b2cb26100e4ba8e528638259502711d;hb=0c5225b6844dd1a838b80d09d715a6c4ccbda2c6

Committed after adding the vulnerability info from the above link,
thanks.

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/57576281f13331dfc2e60673a30098448d05e75d

 >  package/privoxy/privoxy.hash | 6 +++---
 >  package/privoxy/privoxy.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
 > index cfb6f5a5c8..2678a4ec25 100644
 > --- a/package/privoxy/privoxy.hash
 > +++ b/package/privoxy/privoxy.hash
 > @@ -1,5 +1,5 @@
 > -# From https://sourceforge.net/projects/ijbswa/files/Sources/4.1.0%20%28stable%29/
 > -sha1  6afc12dc38781a37670c7e4bb69700900123084f  privoxy-4.1.0-stable-src.tar.gz
 > +# From https://sourceforge.net/projects/ijbswa/files/Sources/4.2.0%20%28stable%29/
 > +sha1  deb927b172a3b473bcf246ea848ba6ed931274bf  privoxy-4.2.0-stable-src.tar.gz
 >  # Locally computed
 > -sha256  23e4686e5848c74cb680c09c2811f0357739ecfe641f9c4072ee42399092c97b  privoxy-4.1.0-stable-src.tar.gz
 > +sha256  6f91267f81f626c416994db89ab62f4d09246eebf4754b81186e13a18ee9028f  privoxy-4.2.0-stable-src.tar.gz
 >  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
 > diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
 > index bfd4996292..9bafc1385d 100644
 > --- a/package/privoxy/privoxy.mk
 > +++ b/package/privoxy/privoxy.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -PRIVOXY_VERSION = 4.1.0
 > +PRIVOXY_VERSION = 4.2.0
 >  PRIVOXY_SITE = https://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 >  PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 >  # configure not shipped
 > -- 

 > 2.47.3

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
