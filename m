Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA576CD5BAF
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D0760F96;
	Thu, 13 Nov 2025 09:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uek88XdcT-7X; Thu, 13 Nov 2025 09:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E13860751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E13860751;
	Thu, 13 Nov 2025 09:52:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E81E158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C3BD4024D
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJmF7Y-BZ8Rp for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:52:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F7C44024B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F7C44024B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F7C44024B
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:52:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 497311536; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Nov 2025 09:52:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJU0R-002Bp4-06;
 Thu, 13 Nov 2025 10:52:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Simon Dawson <spdawson@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Carsten Schoenert
 <c.schoenert@gmail.com>,  Lionel Orry <lionel.orry@gmail.com>,  Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-15-bernd@kuhls.net>
Date: Thu, 13 Nov 2025 10:52:43 +0100
In-Reply-To: <20251106204522.3273683-15-bernd@kuhls.net> (Bernd Kuhls's
 message of "Thu, 6 Nov 2025 21:45:21 +0100")
Message-ID: <87ecq2ntsk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=r4LyxboGLJ6uSkPxKu+i5GlNWxw+BnnSqhVUrW8sUbw3vOb8icCMvSUn/tMCrKjNeVrHi6KBn8hMnp/tSc1NgaGZ4X5pouSIoZOz6iJDzCx+Mmp3//PHM6BrePdmBSI8cjyKrMruoi6o/IaRzQflxQYrDihE15/hOdY/cM6BvPnD7dUqqz1ZV4W+m45tcWrPY0rxAgOYJDCES5vSbaA8Cb7UBXfOvgR06YBXogtfmwaDKcavgTJycKM7aIXQpSEcPYm2Rk9KRwwqd37VWyKD2G60ziFVtmqeAusYdLWn9cJl6yrbFUcSScNQTuexwdyF8kHl2OsRFw0ORqQF6ThuZQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=8i1wKfY2/iUh+Hrcu1zNFaCwiWWh1TCeHoadePfqrNU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=r4LyxboG
Subject: Re: [Buildroot] [PATCH v3 14/14] package/libgtk2: remove package
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

 > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > The final upstream release of libgtk2 was published in December
 > 2020. libgtk2 no longer builds with GCC 14.x, even less so with GCC
 > 15.x. While Debian has some fixes to make it build with GCC 14.x,
 > those are not sufficient to allow building libgtk2 with GCC 15.x.

 > libgtk2 is anyway very old, largely superseded by libgtk3 and then
 > libgtk4. It is therefore time to remove it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > [Bernd: adjusted comment in package/avahi/avahi.mk]
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
