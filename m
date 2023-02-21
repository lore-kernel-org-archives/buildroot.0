Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6707C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 13:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FAA82FAE;
	Tue, 21 Feb 2023 13:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82FAA82FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hW_askInyh41; Tue, 21 Feb 2023 13:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E670482F98;
	Tue, 21 Feb 2023 13:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E670482F98
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF1AD1BF215
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 850E882F8A
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 850E882F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIPPHJ9JahFv for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 13:50:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CE2882F77
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CE2882F77
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 13:50:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2368640005;
 Tue, 21 Feb 2023 13:50:36 +0000 (UTC)
Date: Tue, 21 Feb 2023 14:50:35 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230221145035.363e3b06@windsurf>
In-Reply-To: <CAPi7W83eNioTFO9ok7gz9LBZVCorpiaAbU917y9EVtDdgbwX0A@mail.gmail.com>
References: <20230220231902.340496-1-fontaine.fabrice@gmail.com>
 <20230221093719.5215ef5d@windsurf>
 <CAPi7W83eNioTFO9ok7gz9LBZVCorpiaAbU917y9EVtDdgbwX0A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676987436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nd4crAgm/zZ975bwKUx91UEq3VJdvsU+cP8UyKIiOJg=;
 b=XPN2vtT2Xmlsjr31xmoifXZzgo9jCrQyNkIM6QEUiGQfIeR9wQgUZvOVbj8LP+oHmDQvGz
 6PZqebwbhlfM8ns1+Yh+4XV2QZIm0B1Kj7ltb2zGcjrKYBjCy8926nCjhpuj9lPbrhGtyP
 d3T4ZlS5W8vXbdXek8kPSmB/AS7BTPHLSE97WsrON9gxTcoi0pzUvChy2jHD7Wdmhhzg2t
 qNukqpbCM3igezUzFos1Ci4KVMPivK0h4i+c5uoUGUyYl0fCEGuhozr/0kNrMk3yPPTszd
 O5+qPnxPPbqI5+kzHxbDT7A1n2IRUpk4Bs4DMv94kINCYgXUXYsQ8IxLnszYBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XPN2vtT2
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build without
 C++
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Feb 2023 12:34:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> A build failure is raised when applying patch because of line ending in
> lib/snappy-fef67ac/CMakeLists.txt

Thanks for pointing this out. Fixed in
https://gitlab.com/buildroot.org/buildroot/-/commit/5c6e45f7eb4981810883961dd3af37ec0dc9d229

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
