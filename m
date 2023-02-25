Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0357C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CE12400EC;
	Sat, 25 Feb 2023 09:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CE12400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7k64iQDlLnoA; Sat, 25 Feb 2023 09:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F63A40C1A;
	Sat, 25 Feb 2023 09:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F63A40C1A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D10751BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D61241655
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D61241655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13PiDpga9EkX for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:40:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E6A041626
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E6A041626
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:40:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0B2DCE0005;
 Sat, 25 Feb 2023 09:40:25 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:40:25 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225104025.23e4e21c@windsurf>
In-Reply-To: <20230224164053.53287-1-fontaine.fabrice@gmail.com>
References: <20230224164053.53287-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iC2qHGHv6R25zgwlch5rY9ajldGjddIhc9WDHy6CVPQ=;
 b=bUIUN52i9lKMk8mg6oeHf1FS7Jtxa6Xeuo11A9I1r3rKeP5PCEUmlPb8aCaHok9UQrTwYJ
 n21WSUu5m/+XDb3/CIICYavcbvLqBj+HSlZ4wARiqUj2Pq9Gr1x1KE2slgfPWbvDdcaooI
 9fgzzczSdH37VJjQdeStvH3oUnNbTW2C+GBLFwzkGOpURTvUCOvnYINmobgpMkhp8rfEgl
 vntTaDDnnh/ASYqO+2T9s5YKB9MSL9XrcViFryRRJi8aDxuleyDXsn95gP5p9akBPxXx8i
 pLj7jTC+Jk3lDVFVauXt/g1nH3gzCTJoSo2yx42wKPOWNalBItiFdGSNPGFbxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bUIUN52i
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-gmmlib: needs threads
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Feb 2023 17:40:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> threads are mandatory since version 19.1.1 and
> https://github.com/intel/gmmlib/commit/9e4aa143fb7e7e87332fcb7c9871040ff4a1a1da
> resulting in the following build failure since commit
> cd206d9b808a322a00294b4caad203a892ed4c92:
> 
> CMake Error at /home/thomas/autobuild/instance-2/output-1/host/share/cmake-3.22/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
>   Could NOT find Threads (missing: Threads_FOUND)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c1120932e8c212820b239ee8cd4a057623a73376
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/intel-gmmlib/Config.in      | 6 ++++--
>  package/intel-mediadriver/Config.in | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

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
