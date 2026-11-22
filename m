Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A947D606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Lgn+sS4s;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=RUiEYWuK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68DAE60608;
	Sun, 22 Nov 2026 09:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLV3OOIxycVo; Sun, 22 Nov 2026 09:44:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 42FE160609
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795340643;
	b=mA0G7hhw47E9L4b48se1PYNzx/C6aVQPGAX3OVhZwGHkkb9MbgAJTlbVGi/i3snH6sSJ
	 Y/ForeUGrDbhWFew3qJWyy809Fq2D784whO6AMRP7AsTtCiW2yde+Yhty6k3/1jl2kRUl
	 gS4fU1EOPzX85TGdS0utcJjLn6TtAR/5e5D/j28rtk4eML/Pz3ZdLHS1gPSgLilD0CH9N
	 QFP5wsI+/or8L0mCXDG4DAVcAOYRjAlObQLmYDeCzTskt6k2CSiFksNfIvAbeGvRMTpvp
	 wkbYMebKAZ9RCuYDElL8R1IV2WXGL/2YsdJbG4rt6jR19K5p9Q5q03e5o9OW95Xzjpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795340643;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4vM8F4S7DvpK7AF1UgojPnQWFex4P+pc9YSybq9MpWs=;
	b=IDCg28qL0phIRirSkujWwwSoi0xaegHik82Z7QqSHbzcp6tfeAB1d+X6RfVVF2dpNruZ
	 BV84i4nNDAOAKneVYRn+1ngTJFyCE0W/GeggBQLQICiT4gcPRsqdXqAKQKRq1RVIlMtku
	 ct6ftx7KJGxofc9neVQqD++Z6amqPq5+br4w3A9OkjodD4t6sdYnUzaz8HPQFy2VvPZD+
	 6RNMp+CUqjY7LlXFmXOVxf+zTKM1F8rA9eMF1a1NPLZ0qO9oZNAgGSm9Khx7eXqbTfQjg
	 Uf7lcbF7IS/ZyXVLJwQ6ptxznKMhRLg0ZUMs4lfjKjQz5fqt57JXpH1eKK8U+bfAmWg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795340643;
	bh=4vM8F4S7DvpK7AF1UgojPnQWFex4P+pc9YSybq9MpWs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lgn+sS4sy/KmYusDkFugA0hVleiQdzQxxoeItwvRNgigZGXB3v5ezTTzoUWUK3PXn
	 J/9XnuxXiRXXIEBHD9E+aYH/j7F6kyb6ALJ7TS+RdKR0ystDOCU+x010lX+jcJTemR
	 oq9MJX2Svf2/EZy0rTVkFyoOby6rOquvVpN/jifzqdrZeo33Xsya0NnZo4GFPm1W8Y
	 xte0t84TIelHELdK5Wf+4mgSuxrAtTOADdNuPTIjo7HlpXh6lT7qkxQeo2WEnfWpPx
	 WeKoXOmSz/eKdbLtIox7m42xgEFN2+zsfgyOBhx48vyZSy56xXpoemlOheVUXX2aYb
	 Q9psQ2f2f1owA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42FE160609;
	Sun, 22 Nov 2026 09:44:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA05422B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 09:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFCCF40176
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 09:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgNatvcgqwv0 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 09:44:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3829B400F5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=RUiEYWuK
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3829B400F5
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 09:43:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=RUiEYWuKhOEGE4ETe5fB27a2GiBcOgc1a/oBrfi9qNXOdKAySQWdOJcrd1rx35aviTv5FG1V8lj34BU5p5cZuL86UIqf8CEylSO2Qpc7fai9fPv09c5yLuDWDf8DvktumPqpWBn3rVWW+0Kz3UImZOltAmO5mpPlK1jZ+GvBV1ixa8N6z4uhC23JoxncfkzSo32WF/G4vh72ftLtT1Ml11wRWu1Dbsuk216xjJrZocr/VCAuduYyayrfEMH1Qu+pnJwvnhB4aSweSApIwM5ExdLPztlTjE7G0+UZXx7CO/a9F1w/9BKD4QVQVgpBJf3eylqXbmomzuSDHVDkJ1HQFw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=HaHRULkdoo50BQm5C+OhrzFFIEF6TUmEAMSHcPXTRvo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -313065130; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 22 Nov 2026 09:43:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xV471-00000005eHh-0bfE;
 Sun, 22 Nov 2026 10:43:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261121225046.447546-1-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Sat, 21 Nov 2026 23:50:46 +0100")
References: <20261121225046.447546-1-angelo.compagnucci@gmail.com>
Date: Sun, 22 Nov 2026 10:43:55 +0100
Message-ID: <87wlq5p5es.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 version 7.1.2-36
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > Fixes the following security issues:
 > - GHSA-qw9c-mq27-w844: Heap Buffer Over-Write when exporting pixel data
 > - GHSA-5545-xpgp-wj32: Use After Free in ASHLAR encoder due to multi
 >   threading.
 > - GHSA-wp55-fj9p-xx9q: Heap Buffer Over-Read in WandView with specific
 >   thread settings
 > - GHSA-cvrx-j29f-c5q9: Use After Free in splay tree when using it
 >   concurrently
 > - GHSA-f3r8-89f9-mx43: Use After Free in DOT decoder in multithreaded
 >   environment
 > - GHSA-4cmr-g39q-mh38: Heap Buffer Over-Read in specific stream
 >   operation
 > - GHSA-4jg2-g974-7w79: Heap Buffer Over-Read when decoding a PICT image
 >   and encoding it with the DPX encoder
 > - GHSA-6rm4-qg7h-vvc4: Heap Buffer Over-Read and Null Pointer
 >   Dereference in draw operation
 > - GHSA-8xm2-q8hq-m68q: Heap Buffer Over-Write when providing a specific
 >   argument to the ShearRotateImage method
 > - GHSA-5c63-85hh-8vpj: Policy Bypass when doing a sub image search
 > - GHSA-7pvc-jpr7-9wxq: Heap Buffer Over-Write in EXR decoder
 > - GHSA-58v3-cmwm-hj3w: Policy Bypass with -splice operation
 > - GHSA-h5qr-j3rh-p38h: Infinite Loop when providing invalid argument to
 >   the -rotational-blur option
 > - GHSA-rqg8-7wq4-54hj: Heap Buffer Over-Write in ICON decoder
 > - GHSA-6r6f-x5h8-fw8h: New security policy to prevent formatting
 >   placeholders has been added
 > - GHSA-j4x4-q2rm-qxjf: Heap Buffer Over-Write in the C++ readImages and
 >   montage api
 > - GHSA-rm4h-gcc3-55wx: Information Disclosure in PGX and FITS decoder
 > - GHSA-cf7p-m88c-h9jh: Heap Buffer Over-Write when encoding 12 bit
 >   images
 > - GHSA-p5vf-jpj8-mmhm: Information Disclosure in MIFF decoder
 > - GHSA-8c8r-vjh3-j578: Heap Buffer Over-Write in MAC decoder
 > - GHSA-949m-6h6h-4gj2: Information Disclosure in DJVU decoder
 > - GHSA-g3c3-wcx5-7qrw: Heap Buffer Over-Read in HEIC decoder
 > - GHSA-mqmh-65w8-fgjp: Heap Buffer Over-Write in Postscript decoders
 > - GHSA-c8x7-2x5c-m4gv: Denial of service in MSVG decoder
 > - GHSA-vf87-6hhw-9hcj: Denial of service in FITS decoder
 > - GHSA-v56x-r6p7-8v88: Use After Free in MPC decoder
 > - GHSA-w85x-jcrh-64rr: Use After Free in image registry when using it
 >   concurrently
 > - GHSA-8gpx-685q-62m9: Uninitialized Pointer Dereference in MSL decoder

 > Release notes:
 > https://imagemagick.org/changelog/

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
