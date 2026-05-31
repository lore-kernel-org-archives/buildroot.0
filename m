Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE3ECD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 10:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F11181187;
	Sun, 31 May 2026 10:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFvVlLg8YO-w; Sun, 31 May 2026 10:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2A338117E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780224280;
	bh=93Y1RePrVtN76mOOEu0/upT3AA9C4mW6MDQPyJwpcko=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ji1Kl/JKvqr/Ew6zjZy0XLXV71j655wjNopwNSyWi4K4N+uFwrLEVUNzqlf6JIxUp
	 kU/K5fBEjjCsE/G8qLjSxEjH1vTnk+m4dfThIl3oAbW/cvb5aLnLFdfRKzuDuxcylv
	 Dl99YVMeGeWI04nMr/EZLQQt6M97wMcGdxl7hLSIF/U4npEpdz7HA2kHDYJeRvGlYB
	 BDY/J+tM3wltd7Q6A1z6TKQN7llC9AkCjFUkFipNyTAddMxFQX8Llm3KSVQrkqpo54
	 dQVhybEN2QuZrSbEnXdPzZGY/8HF2wcJRzDBej0fmF2YeP53W6qSqpPHGpTZtPpDXl
	 67TzEJRNQNj8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2A338117E;
	Sun, 31 May 2026 10:44:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC240257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 10:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2A1B60F2E
 for <buildroot@buildroot.org>; Sun, 31 May 2026 10:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZNmhTQC--VR for <buildroot@buildroot.org>;
 Sun, 31 May 2026 10:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A55D960F1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A55D960F1B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A55D960F1B
 for <buildroot@buildroot.org>; Sun, 31 May 2026 10:44:38 +0000 (UTC)
Received: from [10.42.0.16] (ip-109-42-118-38.web.vodafone.de [109.42.118.38])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 96D922C846B2
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:44:35 +0200 (CEST)
Message-ID: <3e632c4e-8eb2-4f47-be4c-71821c540083@bubu1.eu>
Date: Sun, 31 May 2026 12:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Buildroot List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780224275; bh=clFIngJBGUSafyJFBsooySNLuY12uiWixokSXxXZn2E=;
 h=Date:To:From:Subject;
 b=N/NaNoVqNsL6BeH2d9bjtJsqg+2rOf5KDnvmmmKqV0iRq0mbmbjitS9NV++tEC8Qm
 0xUhNY955rrRVHrOXva6yXsMgE9ClVgijZJxbiqRHa3hN5oshBGX+Yc5WYHcQbLChr
 n006mE1Mi3PUZjZA44BEUzEH0L+/V1FCsUmqWOnSy5gPB1vIcvH1Z48n7QAMeUAbIy
 MZtD5kgwXFaRhEQaXlvVxsI7334crZ2yHMvP7xVeYP/5ss5S4GBgby3jYmGPs8NztU
 1tDENMBeTN87F84l1PCN4vP62wsX2rYm0xjIcLqb+MIaDMQFPGzjbV07Cv7yI0L7Ot
 0qFoV8tL+1COg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=N/NaNoVq
Subject: [Buildroot] Announcing Fiona Klute as an additional Buildroot
 maintainer
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hey everyone,

we're happy to announce that Fiona is joining as another buildroot 
maintainer.

Fiona has been active in the project for quite a while, contributing to 
many core topics and providing high-quality feedback to other contributors.

The current maintainers (in alphabetical order) or thus now:

Arnout Vandecappelle
Fiona Klute
Julien Olivain
Marcus Hoffmann
Peter Korsgaard
Romain Naour
Thomas Petazzoni

Thanks a lot Fiona!

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
