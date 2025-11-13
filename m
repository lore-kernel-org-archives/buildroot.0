Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24555CD5BA7
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B813F60F93;
	Thu, 13 Nov 2025 09:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crZvnlamlFJq; Thu, 13 Nov 2025 09:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 720F260EFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 720F260EFF;
	Thu, 13 Nov 2025 09:36:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76244158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7321560EFF
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lg6q0LZ95Wst for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76BE260F83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76BE260F83
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76BE260F83
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:36:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1102198323; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Nov 2025 09:36:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJTl2-002Ac2-1c;
 Thu, 13 Nov 2025 10:36:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Simon Dawson <spdawson@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Carsten Schoenert
 <c.schoenert@gmail.com>,  Lionel Orry <lionel.orry@gmail.com>,  Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-5-bernd@kuhls.net>
Date: Thu, 13 Nov 2025 10:36:48 +0100
In-Reply-To: <20251106204522.3273683-5-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 6 Nov 2025 21:45:11 +0100")
Message-ID: <87seeip93j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=CeW/WQ3n6TVpwCKUbNLCXfQM/dV2vD4L5A1wVrVJEnX5/vQB4/jVatNPg3a90ERWR7ry/v4vQsGiGt7mfHRPOW7rW2vT3g8UwNWp8rEXrfHA+HWvG5QC5+3shgNocVGMauoEKC+Qw7XkXf9CKcc20YmvNMntJVkLqu6dCh4nKQJMSKBMwxDgdXihfRINeyyHaUX7/XMwOMLo7zEOqAqtKHGB0oieerBltYe210gX2N5geoSSN+AS7miHhbuTtVMrevryvIStXewyC/qSMj/XDewmR7PzvyqPjfW0OimVKYGTNg2k/9fdTtMv975poPFrWf88uBfDJD5yBOBIuh5uQg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=gu2qfWD/QvP+vxTZ9LB7T23/B4+RBD6dQqWXfpsoXyw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=CeW/WQ3n
Subject: Re: [Buildroot] [PATCH v3 04/14] package/belle-sip: remove package
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
 > belle-sip was only needed as a dependency of linphone, as is anyway
 > bundled in more recent versions of linphone, making a separate package
 > unnnecessary.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
