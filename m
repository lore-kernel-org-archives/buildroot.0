Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D78CEBF61
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 20:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8FB460747;
	Sun, 16 Nov 2025 20:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruEbj2JF0tKc; Sun, 16 Nov 2025 20:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE7060AA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE7060AA7;
	Sun, 16 Nov 2025 20:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47BA7D5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 241A482216
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7051Ah_BYCC8 for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 20:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6005282211
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6005282211
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6005282211
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:52:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1179492314; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Nov 2025 20:52:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vKjje-000000012B4-3Xmh;
 Sun, 16 Nov 2025 21:52:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>
In-Reply-To: <20251115220705.572223-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 15 Nov 2025 23:07:05 +0100")
References: <20251115220705.572223-1-bernd@kuhls.net>
Date: Sun, 16 Nov 2025 21:52:34 +0100
Message-ID: <87h5utwvhp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bN/O8fpkjvgV+MGsN+VMshLApCsIHc9NrWnSmYgJn1/qugOChwcrYrCmqt4nrN8OKpI7JorU5xGsbjKnLRlbcGyf8jpv53YSwpN4f6kqUvyjIHRbj6ZnTaAteUfZmAXdb70ayDCLROkMwhGNWthIhHg98KhhzWs6VVta7HeQx7WTRDabHIBVLhBHgq8jDTGN8fdUnPwSgaXyW65pKgaTH0vjIEM5jZTS2941HcQCIG53DS/I9yH1LV7rh/cVBWUX2qawFTSiGOIvMcinrxk9CMqJ8YhbpVfaYMQhqR2ndbBG3Y3k2AV0cwyappomH2hlNRsiI/N4w4L2cZYgPX0oFg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=j9Od8Nv1VtsaV/PO/LqWfHBC3DylsZIm2zP/2hx4IZc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=bN/O8fpk
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: remove package
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

Hi,

 > The package is incompatible with newer versions of protobuf:
 > https://github.com/OpenLightingProject/ola/issues/1879#issuecomment-2567133849
 > https://github.com/OpenLightingProject/ola/pull/1975#issuecomment-2346854820

 > with no upstream fixes in sight and fails to build with protobuf 29.3
 > currently used by buildroot:
 > https://lists.buildroot.org/pipermail/buildroot/2025-February/772533.html

 > Fixes:
 > https://autobuild.buildroot.net/results/fbb/fbbfef6e3715c0ac195537ab88ebb2e0e6c90c2f/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Julien, what do you say?

It sounds like there also may be some unfixed security issues in ola:

https://github.com/OpenLightingProject/ola/issues/2006

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
