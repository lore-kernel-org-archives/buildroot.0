Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C499DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 22:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17DF960FBE;
	Sat, 25 Jun 2022 22:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17DF960FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPtxREHDPYL3; Sat, 25 Jun 2022 22:37:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A0A360FBA;
	Sat, 25 Jun 2022 22:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A0A360FBA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51EB31BF35B
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 22:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 207FE60FBA
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 22:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 207FE60FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8mw0J5R8sUo for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 22:37:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F11360736
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F11360736
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 22:37:51 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z19so8065576edb.11
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 15:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=f2+1Bqpzu2Xq71X58KM2lGhELgox7awAM1ZPL41UTts=;
 b=nj7gSMPe6KuntcPwKloQBqfm37S7e8EhYTfcXWsoO87aimjKUd2qh96ZC0AsPud46M
 bR34B+IxA2Mj83ipsupngeIXClefIJHDBF3+JSVPUgo57wmx5lVDL+g5brKHdNsrhG1D
 gPrmBrJC3fq5Zo78nJ6kGEi66VZBRYbl7c7COA8UoLpLR0jw1ItRnnu9O3Ghxqjz/VPz
 flgZl7vC7XkX+mT/IwCfpvoFTueNDzSd1i6wy1VsjbP6Aq2gIx3yO0d95D/zn0Kwv5w5
 O0k2aI/zC39nawG4ioEvzIfKEjLsxYstgGnMcu0Q5SAHm8E6oEGXmT08Xg6sF8n/g1P8
 AVYg==
X-Gm-Message-State: AJIora9bV26a/RuRq1nmDqQXoujabxb5F6yuWB5Ml5IN+rO713m9Wni8
 7etlQPR4470RwADIRLFg6TtlYfNufwRSnQ==
X-Google-Smtp-Source: AGRyM1sCvL0dTdMk7QbuIZgk6u36MJWzjNsbEPwxWlLpKYOBuksE7+4eSBrQllRsgyPNLrfJLKnXKQ==
X-Received: by 2002:a05:6402:3305:b0:435:8b1a:8fa1 with SMTP id
 e5-20020a056402330500b004358b1a8fa1mr7765058eda.32.1656196669043; 
 Sat, 25 Jun 2022 15:37:49 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 j12-20020a1709064b4c00b00722e7e48dfdsm3057481ejv.218.2022.06.25.15.37.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jun 2022 15:37:48 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id n1so7800557wrg.12
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 15:37:48 -0700 (PDT)
X-Received: by 2002:a5d:4708:0:b0:21b:8a39:1aa5 with SMTP id
 y8-20020a5d4708000000b0021b8a391aa5mr5382734wrq.141.1656196667789; Sat, 25
 Jun 2022 15:37:47 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 25 Jun 2022 15:37:36 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rjW4aTmTObDpKyrdMX1e=CqGzyeGHSg5sB-eeonz3LTg@mail.gmail.com>
Message-ID: <CA+h8R2rjW4aTmTObDpKyrdMX1e=CqGzyeGHSg5sB-eeonz3LTg@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=f2+1Bqpzu2Xq71X58KM2lGhELgox7awAM1ZPL41UTts=;
 b=LZBCvLhgh1pt45Gbn5mwHJO/oPepEEcBqr8OCICPrDz0aSoK38No8OWVAFAX1YGszk
 DWD1Xe5N83oyxAWyi7I75skLUH1kChLm9Sdslr1UZ4F6+U0fs0SHclGV0U3n8x3rK+fC
 D2FzkKmHEO7yWwyFGrKC/FV+uXjGsgGKY9Iy3p51YlD6HY38Tsd5DX7kIKmzY8m+2qmC
 iH8OMDvawhXXscv2jn97c5nt2j2aMh6olaDYzNHM9oaUd6qSOUsvUhQ4LjuC7u9NJIfN
 mlsnxVtTpr6+nWdC9VnUT9amntAbB8DEVovmhFkWC+ZAfSmxn9Tna6W0cFhqB3iuCAqr
 ljcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=LZBCvLhg
Subject: [Buildroot] go: patching dependency versions w/ go modules?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

There's a particular issue I've run into with the Go implementation
while trying to fix the gocryptfs package.

Currently the process is:

 1. Download the package source code.
 2. Run "go mod vendor" and re-bundle into a .tar.gz.
 3. Hash the resulting .tar.gz
 4. Extract it to the build/ tree
 5. Apply any patches
 6. Run the build.

The problem with this is, if we try to patch the versions of any
dependencies, for example by editing go.mod and go.sum, this is after
the download step at #2.

So currently it is not possible to change the version of dependencies
with a patch.

Is there any clean way to fix this?

The only thing I can think of is to add a new variable which contains
a list of "go mod edit" commands to run just before "go mod vendor" in
the download & extract step.

go mod edit -replace
github.com/jacobsa/crypto=github.com/piggynl/jacobsa-crypto@xorblock-generic

Thanks & best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
