Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08072606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GIw9nwir
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C359A605F9;
	Sun, 25 Oct 2026 18:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTIhuZZbpiQr; Sun, 25 Oct 2026 18:22:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E96AD60603
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792952534;
	b=iCDzx8Fr8kckcXQvCBUv6iqR5qaH5WuY3UVVzqI8FeqMFt9SkUzWSoX03LY/6EGluj5K
	 9cEt46bfoh249agWIokMfyBXrBdQ6ZWFCT5Ddt+Wynd0NaUxV73alQiAOwX2jeYDkwV5e
	 MQex16UrGWxhOTW5FSK7dkIHv5qBGwevOiyAfloR/cqbkkou6TTG9B5LtrqvAQPj2Rm+t
	 EYokbngU+1QXGi7wRAfQqc9jgn07MTzaH0IGZn6TI4jmI/dnIOp+33QVtb2K71myejsVJ
	 KKUomiDceXM6ZckmlhHfUQGotLa9lk6bgULenpp/mZ4uAH9N2rBy0CTmnPtHPyiopJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792952534;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Injected-Via-Gmane:To:From:Date:Message-ID:References:Mime-Version:
	 User-Agent:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4CzrzAF/9zEC+3Rlj2/aDo3qjgZ37aqayN+xT81mx10=;
	b=JteCZvazvWfaaZxMNLFXFTR8GUVEhk21MLZSSsCyDTgAvORAroFx7KWwi+LWAi9Eb4Jh
	 ZIqRRpyZlLvkKGQB7jEoSECqZZwcaEUrhIsPnwcaqJTSv+M8V0222d8GzgnEw8MQkMsLr
	 1GfvClylp687sRU2rZ43u+C92jEo9f1DXPfFDYhxekC4xL3r6UFktlEkR4DIObHEWGzCy
	 webebfdeDMwZEQtZ82iC9YFOwennMgMC2YiyM/B/APJdxYXIGj9o7KZvWoSB+T9DJVo5F
	 asYpRwA+vHalFIxVsPYXd2llkBQ8xRB1FxIXwJKFjtNxUf3jx0vsiHCORcAnDr5q17w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792952534;
	bh=4CzrzAF/9zEC+3Rlj2/aDo3qjgZ37aqayN+xT81mx10=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GIw9nwirJFsm0elJrGEihi6eShhfvRKr0YZnoDlQWhRLXD/bfsecSn21TPoBROI3p
	 epPJkVC/OfL050IXUZB1pws7CkrS1WjTWFy+1433OARVSecO1tPpmC4VvTtqYaDaN0
	 OyhdGD2JKqM3UsGc/1nlDGdw87v3NeaFwEm0tZrGRL3KGnUy84F2Vnn6i2cMZT0eZh
	 R0138omGesfrtF9DVdXjM4Jz7OeZRFgdWHad2Q4A+3AbXTvVjvFwyYiOifzSZfjD/B
	 6EcC23023NGKIvauIqJkvTNSZW+oo8ezC03tuwzTv86/lnaaTkgw5Q0QboqLhEASVa
	 WAfLlwKTfArZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E96AD60603;
	Sun, 25 Oct 2026 18:22:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A8E9235
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5118F809A4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3E1RxiItS4jo for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 18:22:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C506880974
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=116.202.254.214
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792952531;
 b=cQuDnLuQU02nboBxdqAifGnL2syHzCgJFlPsu14Jk7oxiPrJNyNkXg4mnEn2RbRYTkKU
 5vBuv0in+9+RVLezRp0SQyL90pT6rx5xDbn1IlL0I3akgAq+s2Ks/FLoT5AgB9UskTgu9
 7rm74a3OlNqdj0NRdo3/6n40T82JiPukcBTMeju6URO+OPXNIBBomMXIVDg9XZ2n9qZJs
 2LjUI3Addq3MvVDDw4Rtmu4O88SNzPdB4cYmaxMWAB9ifmVAjpr2QZmFe2qksuhTCotid
 z50Jro16L4OiTF+y68GehZrkXj7Y+PrFo8x2Le719BJ/6QG/iokd28TjQ8LkxAgMqBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792952531;
 h=Received-SPF:Received:X-Injected-Via-Gmane:To:From:Subject:Date:
 Message-ID:References:Mime-Version:Content-Type:
 Content-Transfer-Encoding:User-Agent;
 bh=MbZunS/e1MRG1BEcBvnUVOVBi82hgpp9UykDsKVDcTQ=;
 b=lQI1C34Yxk3MbBmwo1E3b3B/Qd208GlGLcb53jshXcMoLv+gd/cFU5XdUrgs1il9hxgY
 BLCuhOvaXcJzcgNarDX8vrv25t7SfIrjBxPHAqTgyLdANA3Uaks7ct+YK1a8cWaqwMCgv
 rT0nNSpi4KRkhiTvpFq/9yBxqgUshg78795zCS59bbtl7MC8al/yWG6rDIOjwWWNWFrjt
 MVciEidU+4yhkiaWCr61yXSB1GkcX7yzyC0dvXfp57Z9rxABJY/r1bbrgjrqXqwu+e24Z
 kmg9d3T1Mi/3ftXkrZjmDHcC2k2A+dEUHcKKofO0/oAo5ZyldnZpzS7B7Nnrj0ece7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=fail header.from=kuhls.net;
 arc=none smtp.remote-ip=116.202.254.214
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C506880974
 for <buildroot@uclibc.org>; Sun, 25 Oct 2026 18:22:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1xL2r9-0009sU-DW
 for buildroot@uclibc.org; Sun, 25 Oct 2026 19:22:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 25 Oct 2026 19:21:23 +0100
Message-ID: <pan$c8f11$fd6e52c9$f44ff9a3$fdf16aca@ID-313208.user.individual.net>
References: <20261025104643.3703370-1-bernd@kuhls.net>
 <at4_x-qSmchPMRN9__17522.8374240518$1792950297$gmane$org@windsurf>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH 1/1] package/x265: bump version to 4.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Sun, 25 Oct 2026 18:44:35 +0100 schrieb Thomas Petazzoni via buildroot:

>> by adding "-Wl,-z,notext" to LDFLAGS as suggested by
>> https://bugzilla.redhat.com/show_bug.cgi?id=2428281#c5
> 
> Hum, what tells you this is specific to i386?

Hi Thomas,

it is mentioned in the bug report:

https://bugzilla.redhat.com/show_bug.cgi?id=2428281#c2
https://bugzilla.redhat.com/show_bug.cgi?id=2428281#c7
https://bugzilla.redhat.com/show_bug.cgi?id=2428281#c9

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
