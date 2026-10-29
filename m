Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8AE606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 09:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tiw7uDds;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=BIeD9VGJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0546C60668;
	Thu, 29 Oct 2026 09:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPOfNSz6DbSu; Thu, 29 Oct 2026 09:53:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D785E60686
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793267586;
	b=a+sf9T6UfM3Pz7qRLgiZ4ky8ousvpOJqcg+4vTJeAydAgK4giKLpldqKg2zjWjTC2jAV
	 Fne29ZB8CFJTQQLiANsIG1hRRmNZrF2JIyUjcc92m/uV9JiXWHZG5QwpxDyYpvMlVuSyL
	 +JyW+BmwfxNUTFkVVqBUQ9rSknXR77YDM3dBqMzIxW9y2YDMOy0WhcBnFH6F95ml76J3X
	 cBCNuc5v74N//Pf/Wb9p4kdhFRflxf3bKzcuR5OBBW8vrhuzaLOmZJ+dhDu2FhmhuZBG8
	 94DZzmjRuvZIxHuUTsLtj/YjXVQCbwbZUlhKck92onkU/uPFvhKVJN1VkXwts0hAZZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793267586;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=D+ql1SHjsDPxV/wdOdqYkUAUykFy/MddgGai3M9YJoI=;
	b=tHbNNRiEPZMxEhfuR0NFQaGfz3JZffQVXkoLvl7ztrUDTdljZWe4t1KW4qEhreRvKrpY
	 pBdruEm/JgWtZf5HaRn8yHVZkrENB1hg1BJ1CtzTVKjuAhW8m/Bpw8tI7HBlHx3npIDWV
	 cYHjR+/1E2MeyMSg5FgHAGP64pgEegB8eydtl3p8Gmg0JfXbCV4hsVrd+8heNBdSOufN+
	 e/eJk2Y+rjC9YVqOQ6WRg6cYFfWRrRyZVSajiVux2+k652h8vT9wyds1b3zcnL587DLSr
	 tSyeii5/XsJaX3K88wIJjOb2p7NxvqTI4CsE2wNovFitM/QUQuBk0hWCI3rbv5+jm8g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793267585;
	bh=D+ql1SHjsDPxV/wdOdqYkUAUykFy/MddgGai3M9YJoI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tiw7uDdsqNbl1okek1BgcKWRAfrwtwDTkz8ychI+hIizo4n9+29KMdzxQ+gmMOdY5
	 29xt4m4mF1rzEwgmY3+syrXt+LCP/QzpZ5lmX2taiVSxYJYemFhVPBXM4kaAc16kXa
	 nhiFCWHvm+MTxbeyXjPM5vOZshn18HT9rMW0Treqo3RCAPbioU8rWOZR3Kvt0pa8ON
	 qgm3hDUdXZs9IT+K09US9JfZMA21lpO3mqxpZaq8wrgX5zG/IHpi2iJn/E27VobVO8
	 tefpQKKL98ieR3eBQqAIbLJDi67mXaTHYTyRG8Jau9eIIfQeGiw55KIxmbtxIu3Lap
	 JddRoPcD3W3lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D785E60686;
	Thu, 29 Oct 2026 09:53:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87C0C356
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 09:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DDF740024
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 09:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gG4QHPG4_9m2 for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 09:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 24CA14032E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793267582;
 b=MtmIMIoxwmYu1vH0g/XIYrvpQHAoY5+IT3leWFJtNlELVRjmsHgUZpeDN3ShTa94gSqG
 p8ggMS+GuIDHPvtN0qdsJttdZXENA3cgnlxtlC1LA9JpVAMaeNfYF3M31K4za5HOKikaG
 gASHhSGiSwTgI6BOzA5dbFVaQmhQjszLWmRs4hVNj6MxWBd9xbFiSRYVZIrr5cSetpUjy
 TNI31lQB0gbYSk3EugHP7OcBBSQyqGsn5Ier/UG0Y+b00uPKOFuwkdsvrfaY+z2V1BZmy
 FE8Nau1lIHyHgHsO2tn6sy4klJbIFlLsCsuylEgCDBZH1myK1l3sQTJBbA3RpZQOEfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793267582;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=9ZdPrH4JO0TIkx1pAaiWAhgrxtHJ9i4QKUmy+mwbzCU=;
 b=LDE4D643PaWKlueorRgueiu12rAafJjznp8xazLhjh/jCSh5jiqwMJU4n0+QbP8F7vI1
 IDNh7IKw3kzWsvEnFcW2E3j7hLouzxzIruws1eyDpo8lc5O5fa8BbFWzPAIEoTQ/jS75i
 LmtgZXpI5OqRezEGOIj+ExGmFV8WtM9m+sOpu9TEoKPaaWLRlv2NE0Kl5JKzxqg6WcS+d
 GokkPge4MIT+wakMb3nNPM41pYboW86tZ29B0NtU7MwauDwptQX7sM5eEVd4YoekpuY/l
 1WDuWxu5S6jsP2AennuWEHMJ4RgaXvpYD5YOPOeIeYj06RFfd0cen5/e5Z+cf9qZOdA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=BIeD9VGJ; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=BIeD9VGJ
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24CA14032E
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 09:53:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=BIeD9VGJc/2vPhQPFHjyjtZiAB7/l9OfmcKWaczIXZQUdzXe+SVOPv6XQHgf+eQQtEloCQRQkFYoCnTC2Co9le51HtrtBb4Kfxlqezdju13kuYqKz8U2N8/FkmFuKU9e3ApobseyhzmznzFrI0zNUBWcijn+w14xlz8Jyj/cav7CwulVQnZEq9i+//ZDSfXsO4wjLHEB5FMURyOz0jx2Si/cthaAMuRld6G2cKiCuSzog1Gw9laf6Ol5+JIGtpAf33aaCD/y1DMDydhH3/OKORkgw+7AU2K2pL679lHQcH4zO5vKrRNbyEKvQIxuvLFItzP3nyYJT2/DQMYJEuppHQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=qJVHDN19dgnLap/SbstQyqv23jbfuQ1g0jJgblxg5VY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 12156102;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 29 Oct 2026 09:52:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xMMoO-0000000BtrI-14Yv;
 Thu, 29 Oct 2026 10:52:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov <yegorslists@googlemail.com>, pieterjanca@gmail.com,
 brock@cottonwoodcomputer.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Bernd Kuhls
 <bernd@kuhls.net>,  buildroot@buildroot.org
In-Reply-To: <CAGm1_kvUUsz4tKbbzn_z6cTSjgBVFjy44yrx5c3c5Y9BUcCPdw@mail.gmail.com>
 (Yegor Yefremov's message of "Thu, 29 Oct 2026 09:45:12 +0100")
References: <6ae2cb1e.ef735cbd.21420e.a28d@mx.google.com>
 <CAGm1_kvUUsz4tKbbzn_z6cTSjgBVFjy44yrx5c3c5Y9BUcCPdw@mail.gmail.com>
Date: Thu, 29 Oct 2026 10:52:44 +0100
Message-ID: <875wykygsz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-10-28
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > Hi All,
 > do we still want to keep the following packages?

 >> madplay-0.15.2b | 1

 > Unmaintained since 2004.

I would say drop it, mpg123 is a better option today.


 >> mender-3.5.3 | 1
 >> mraa-2.2.0 | 1

 > Last release was in 2020. Low git activity.

And Intel Galileo/Edison are dead, maybe indeed drop it?


 >> pdmenu-1.3.6 | 1

 > The last release is from September 2020. git repo shows a very rare activity.

Indeed. It was also dropped from Debian a long time ago, so maybe we
should as well?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
