Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC876E7FDF2
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 22:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5F3822F0;
	Mon,  2 Feb 2026 22:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDLh2N4f85Dl; Mon,  2 Feb 2026 22:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2A4B82998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770070607;
	bh=mGDN/7Ckafi5LlYZNoJ70KVbuTEvBq0IT4P+xEY9SNQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LSnffnakj0ktf3IP0482a8QX5cTGKiGCP68s7ANHVSn92REzGzZRhlWPC1RHfVlGO
	 hjUv2Fvr10wdSAqj7QtCyuUfEMM9LSGg02U7FvakYHT98clldk6v24tDZB/ogzow+q
	 w8Y4jtIfwbzWjeFQ0nJReLyNqKfzEHjdSp2HPmu8k8duKTcKmHBqg8arBN/OjRTORM
	 OWIK2Aa/ZfSemjMyWViLIR/KG+Awcgkk/gGWb0CSPnu25bOe91VibS3XECUXVzhFgB
	 ZIwTtjl117/HQhhF2yzc57kWII/LFGoPJD0efD98EUaoaCbNtvSPXml1SeVrTf8H1J
	 d22AWePTUvGEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2A4B82998;
	Mon,  2 Feb 2026 22:16:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E405F5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C305607AB
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyQowfoVyH3d for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 22:16:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47A136078E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A136078E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47A136078E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:16:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 132959157; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 22:16:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vn2Dk-00000007gzw-2LRq;
 Mon, 02 Feb 2026 23:16:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260202144704.980271-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Mon, 2 Feb 2026 15:47:03 +0100")
References: <20260202144704.980271-1-ju.o@free.fr>
Date: Mon, 02 Feb 2026 23:16:36 +0100
Message-ID: <878qdardtn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PIuA/CaxxPBYlr0TpP/EhkHVJdWR2IQACBoHwaagJ1myg2nMpkfL5ceJ7hBvPKwr8mXDShASFzongameciricwrcKg/smWei0V4YJDOpW4FG6kcj+EWZ7vZhzmPMXcCKdvARuBpK16AMd4ISZWspeJpeUH8zjnLniaWvSLnloHxl5LNJwFHCw4vHjupUViBMNtr0YZqtFN0TkrbpvkNjBydH3mOHmCFp+r4G7zev9P6maDhfWUDIbu0YrQJ3RiQBRWnyi73LvvOep0DUmDlVPXuuIaoG5Ah1Na+SIEVa+rGOZDtPKRAlKJzEBe0mNlE0kYNlLMkT3vUro6w4g4oQlA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=rkc5k1sdhcKlDCtY6Ie6u0bOK6q8+oeiu4sKUicc5M8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=PIuA/Cax
Subject: Re: [Buildroot] [PATCH 1/2] package/qemu: bump to version 10.1.3
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > For list of changes since v10.1.0, see:
 > https://gitlab.com/qemu-project/qemu/-/commits/v10.1.3

 > Note: this bump is a bugfix release for the stable-10.1 branch.
 > This commit can backported to Buildroot LTS branches.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
