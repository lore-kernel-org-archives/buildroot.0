Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C0C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDC84435DF;
	Fri,  5 Jan 2024 12:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDC84435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEHXnqjv7OYe; Fri,  5 Jan 2024 12:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D208F436D8;
	Fri,  5 Jan 2024 12:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D208F436D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EBA71BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5490E436D6
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5490E436D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ekPb-ipv0frC for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:48:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFBB0401ED
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFBB0401ED
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07D04E0003;
 Fri,  5 Jan 2024 12:48:36 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:48:36 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105134836.2d5dd981@windsurf>
In-Reply-To: <20240104171737.12200-1-fontaine.fabrice@gmail.com>
References: <20240104171737.12200-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704458917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNElnSCZoMMrSuoQqKmq6bJYxfOy2dAdAu1VrRI4uL0=;
 b=o2kTNvBlkdOo16jZV0MPtZBsx7VCaWUIz5V+ejtdEGN2trHkcc+fFQ6vNkAKpN6WPGjhoW
 3xGJTQNpqTFZonDcxA156AjXX2Gz3EeJ6Yc0sAWOUAINdUOmy1I+Q8nfUFPPjqkdfxBDnL
 JJ5MXI6fNMEdjdjmjvBDSch5iWsssf6t9Own4zTycKSXT+VINR6oYAd5EFR2eMIAOuB1Mb
 7YKy5ExJRuJdJoQi2AN4OYkRxXlYOAsn+5bk/0MkNddE6sh00YaBRnl8yWsYqHz7qnYgCl
 mz/tw1K0F06QTaso7w6xGCnyhIEzx6eMB9QRtv5KL9kjd7NXXCksXxaQmog69A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o2kTNvBl
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/python-pysensors: fix build without host lm-sensors
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  4 Jan 2024 18:17:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the addition of the
> package in commit c8ff8d41c06f6b1cbc5cf8702a516411084ead16:
> 
>   File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/setup.py", line 3, in <module>
>     import sensors
>   File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/sensors/__init__.py", line 20, in <module>
>     raise ImportError("can't find the sensors library.")
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/acd8583fb635ea27811405a2478182ddcd5642f7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Drop dependency and add a patch  instead

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
