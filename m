Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A61DCCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 21:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2593440983;
	Sun, 16 Nov 2025 21:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYXWZbezPU2p; Sun, 16 Nov 2025 21:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB43E40945
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB43E40945;
	Sun, 16 Nov 2025 21:50:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B954158
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19E5860BA5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pflQbT1b55OZ for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 21:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDBAC60832
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDBAC60832
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDBAC60832
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:50:16 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1823882004; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Nov 2025 21:50:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vKkdN-000000015CC-46dJ;
 Sun, 16 Nov 2025 22:50:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>,  buildroot@buildroot.org
In-Reply-To: <4f593e5a5246154f4a6334dc57483aef@free.fr> (Julien Olivain's
 message of "Sun, 16 Nov 2025 22:10:02 +0100")
References: <20251115220705.572223-1-bernd@kuhls.net>
 <87h5utwvhp.fsf@dell.be.48ers.dk>
 <4f593e5a5246154f4a6334dc57483aef@free.fr>
Date: Sun, 16 Nov 2025 22:50:09 +0100
Message-ID: <87v7j9ve9a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=JB7uTVbzRTlnPbBY3Yzcd1Kt8gvcxnMFI1GiuOU6Gg4j5p6ImldBMqGgmzM814KBZ6Ds/4nlZWdTcRxHgJ90Rh6chs5sPAzIHvVqhfQo6/9/CzBZtaxhSSAMa07iwKF0njqx4B2EobrMBVZKDMBpYBNww/2gO2a68oKCKhHmc4RujIIvUb9iPz4grZfBWWdz9WJhtKHF3gnxQ0JnkmWwPdWJASMXXGFR8L6y38bjD5eA5RXzQub+O5pcZXk6Va5vJmtaUj0fE5IP3rerLaKz/YVmk7SBrOixRCsUu2TCnFSSN9Zenkn1BAAVsCcfEuBlkJwR6LuqpgflH0xn4nxr8w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=1izCCELqnldYiP+dNAFCAsLSbb6Y4ko+rLVJgsP7D1o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=JB7uTVbz
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Hi Peter, Bernd,
 > On 16/11/2025 21:52, Peter Korsgaard wrote:
 >>>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
 >> Hi,
 >> > The package is incompatible with newer versions of protobuf:
 >> >
 >> https://github.com/OpenLightingProject/ola/issues/1879#issuecomment-2567133849
 >> >
 >> https://github.com/OpenLightingProject/ola/pull/1975#issuecomment-2346854820
 >> > with no upstream fixes in sight and fails to build with protobuf
 >> 29.3
 >> > currently used by buildroot:
 >> >
 >> https://lists.buildroot.org/pipermail/buildroot/2025-February/772533.html
 >> > Fixes:
 >> >
 >> https://autobuild.buildroot.net/results/fbb/fbbfef6e3715c0ac195537ab88ebb2e0e6c90c2f/
 >> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 >> Julien, what do you say?
 >> It sounds like there also may be some unfixed security issues in
 >> ola:
 >> https://github.com/OpenLightingProject/ola/issues/2006

 > I am OK to remove this package for the time being.

 > Acked-by: Julien Olivain <ju.o@free.fr>

OK, good - Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
