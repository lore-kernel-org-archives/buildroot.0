Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19036EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B26934188D;
	Fri, 21 Jul 2023 21:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26934188D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ustJoCL3A37Z; Fri, 21 Jul 2023 21:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0E494187B;
	Fri, 21 Jul 2023 21:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0E494187B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1891F1BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0A4140187
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0A4140187
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iwMyQARtlV6H for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:31:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFBED4017B
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFBED4017B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A23A20002;
 Fri, 21 Jul 2023 21:31:15 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:31:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721233114.2f175900@windsurf>
In-Reply-To: <20230716163707.420531-1-bernd@kuhls.net>
References: <20230716163707.420531-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689975075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBSmEM7yXCOkD2VxRvHX0kn1yK1D2RQhziE9SbILAUE=;
 b=CuGZAJ/c4ebD/5gnPkeIlQliXqgUtwKVXT3/BQ8KmID2Iaa1aOSJJdX+x2p7Icq9rvDb/2
 WheAVHFhsXOADcm2z42z1z+T88IiKEe3jwrMDMS5y6t/20HqnaJG6CRgT2o4Tt5ktx8sL/
 ihvbod6qhCLqP+PBGx4498ZXYEX9D6nzWNjChKo9SPd/zWgRNUQsqNVBZPJQO0gR9pFo5i
 5WjwK0fYw6yRKclNdu/ivDp/hs1jPhVfpn9jXK0Ml9jxMpTtH6tJ70Gs01ybIUNUHn0oCB
 UUcFLdGN+CXH++m9Telf21tuq1iolYk8qP6zP9yuPgFJmkBtqTAGykDmHdmT8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CuGZAJ/c
Subject: Re: [Buildroot] [PATCH 1/1] package/yaml-cpp: fix library name
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

On Sun, 16 Jul 2023 18:37:07 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> In the current state this package install libyaml-cppd.so due to "d"
> being added because the variable CMAKE_DEBUG_POSTFIX is not set:
> https://github.com/jbeder/yaml-cpp/blob/master/CMakeLists.txt#L137
> 
> This breaks the build of mongodb which expects the library name
> libyaml-cpp.so:
> https://github.com/mongodb/mongo/blob/master/SConstruct#L5090
> 
> Fixes:
> http://autobuild.buildroot.net/results/304/3044d040dec090a2f528a96f201d4e554f6779b4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/yaml-cpp/yaml-cpp.mk | 1 +
>  1 file changed, 1 insertion(+)

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
