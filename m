Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97D4C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AC8440948;
	Tue,  2 Jan 2024 20:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AC8440948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QqPkDUWYpt5F; Tue,  2 Jan 2024 20:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 602D540A97;
	Tue,  2 Jan 2024 20:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 602D540A97
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6A91BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6D2B60DFD
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6D2B60DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c878RCl13KCt for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:18:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D780760DB7
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D780760DB7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08A1840002;
 Tue,  2 Jan 2024 20:18:27 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:18:27 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102211827.5e07e015@windsurf>
In-Reply-To: <20240102171759.824667-1-fontaine.fabrice@gmail.com>
References: <20240102171759.824667-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yAm6oNICiQImEZJFnRLLwFSNThJZGY0/+mi/RrerdEQ=;
 b=h7bJ59dzOH/GFlSxXBfxf2mne0w5qvieaNebxlgUKvkDBY84gob85nE9MpAWvV0z2QP9t7
 yY/xTt3zkph+YqtV37SntYT3nHZGUo2mxu+iGJyrC1ECGx4mzKiXUuTsO1Q9UKGyqfhhZO
 UO9Tn/klXTahIm4ovS6OPQnGPsFnQHicX3rjWa7MOQSUuDjdUUdcJOoqpSqv/auPfTurvI
 QPs/u4iUVXWcnIiT2IAoI3o/OhfHGyaQhRTBBw8qto8pvJB71E8ZqhSRzOZAn+aSapUPVZ
 u80axXg70cI/ex09ltD+ptVSGipPMsh4sKLrS66RzPokl9MknItNTCk5Qp/vbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h7bJ59dz
Subject: Re: [Buildroot] [PATCH 1/1] package/python-contourpy: needs C++
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 18:17:59 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> C++ is mandatory resulting in the following build failure since the
> addition of the package in commit
> 1e7f0794bbb0075285dc3b4dab8484f12adbb886:
> 
> ../output-1/build/python-contourpy-1.1.0/meson.build:1:0: ERROR: Unable to detect GNU compiler type:
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6b50f9621b00aab384cc2dde77fae7daff46d08b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-contourpy/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
