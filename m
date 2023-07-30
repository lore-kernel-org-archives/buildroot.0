Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A6AEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 22:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FECF607A3;
	Sun, 30 Jul 2023 22:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FECF607A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrn6jAeIO0sB; Sun, 30 Jul 2023 22:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C8F607B4;
	Sun, 30 Jul 2023 22:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C8F607B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41F761BF3BF
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 22:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BA5680EA4
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 22:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BA5680EA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_1pP-nXMlZB for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 22:13:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADB2180B8D
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 22:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADB2180B8D
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB7A21C0003;
 Sun, 30 Jul 2023 22:13:29 +0000 (UTC)
Date: Mon, 31 Jul 2023 00:13:28 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230731001328.5d47d12f@windsurf>
In-Reply-To: <a38e4cdf-fa74-74a2-eab0-1e63923c5fc0@mind.be>
References: <20230102071522.3229935-1-JoelsonCarl@gmail.com>
 <a38e4cdf-fa74-74a2-eab0-1e63923c5fc0@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690755210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skHKCXPSOgUYW0VwF0voEQDiihgU/hURibOmiZ6dmQk=;
 b=TNfWnatqXmqU0d6fX1rdZ4tK+as3Mo8Sqa+SnILckjQP5vgsgHrUXiYdXcxWmX4CKT2TIz
 57x96OiAhxa64N8hkn6RHL34RtJOP3x/6/SL7OqmfQl/ySB/w+GoNoo3C0efDlZxFBVNfd
 5Frk07w+GCHnBXtIEEQ6x/KH+qf9NYQXNi+vV5o5EM07DNsItRjSUzl7Y2JZgIwhczPedE
 K46ic1hOs2dFgCClV26xHpzvMClHgsHj7hTqUiRy5M+bCgD3XtHXojHOuI+D7OPquYqsMR
 fG43lXQphDtTsFYm+eSCeISbqCN5M0X9bAd91I+F4coQ9YHo49tKN6j74tWX7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TNfWnatq
Subject: Re: [Buildroot] [PATCH 1/1] package/cmocka: don't allow building
 for Thumb1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 9 Mar 2023 22:54:27 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>   Instead of adding an arch exception, have you tried (conditionally) adding 
> -DWITH_STACK_CLASH_PROTECTION=OFF to CMOCKA_CONFIGURE_OPTS? I think that that 
> should bypass the check.

It works!

So I applied Joel's patch but essentially rewrote it (and its commit
message) to use the solution proposed by Arnout.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
