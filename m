Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F5FC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C352860B20;
	Sat,  5 Nov 2022 20:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C352860B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkNIoVbeNaQX; Sat,  5 Nov 2022 20:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB3BD60AC6;
	Sat,  5 Nov 2022 20:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB3BD60AC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1BC1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF02460671
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF02460671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozkP2InmVTUZ for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:09:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BE4760592
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BE4760592
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:09:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3CC72100005;
 Sat,  5 Nov 2022 20:09:39 +0000 (UTC)
Date: Sat, 5 Nov 2022 21:09:38 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105210938.665cfe86@windsurf>
In-Reply-To: <20221104101639.24364-1-fontaine.fabrice@gmail.com>
References: <20221104101639.24364-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667678979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTgJgWPu2yxmYuq1/bH3i+GRXWxvFzv7Y/itk8fatyc=;
 b=MVI9sU3YIoi1jijF25W/OI9tKhL8nkq7Dvdz8ghEpSwONWNhuHSUqFPpNx0uKoLGs2JmOT
 L431VNbxpVYxVNjkax1wKMZ4jp1dd+qAq5aBz9ZBQSwuIOUbDzM/Fubuin3x85MdgRH+Xw
 5bFKb+ab1P3kxwnGULW1cTfq8Sg7t0KJ2zCIPpGx7beUt9kbBXs4ylbdd+itPaiDlbYdsV
 jkoWP2Z8PSE07hBUDMf7n3RxM6wIdL73+j70S5FPVgxhtp+ngIzS0gIXDzL3EMEZQPepgO
 KDvojAbigUefHSUIyX8rUxrjtwpx8rwUhHj5DNSAnRkfQW7jvzjmVSCr3+xBrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MVI9sU3Y
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: add host-python3
 dependency
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

On Fri,  4 Nov 2022 11:16:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> add host-python3 dependency to avoid the following build failure raised
> since the addition of the package in commit
> e43da7bb32285bbd41b38a379aef77132d149df7:
> 
> (cd /home/autobuild/autobuild/instance-19/output-1/build/botan-2.19.2; PATH="/home/autobuild/autobuild/instance-19/output-1/host/bin:/home/autobuild/autobuild/instance-19/output-1/host/sbin:/home/autobuild/make:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" ./configure.py --cpu="m68k" --disable-cc-tests --os=linux --cc=gcc --cc-bin="/home/autobuild/autobuild/instance-19/output-1/host/bin/m68k-linux-g++" --prefix=/usr --without-documentation --extra-libs=atomic --disable-shared-library --enable-static-library --no-autoload --without-stack-protector --without-os-feature=getauxval --with-boost --with-sqlite --with-zlib --disable-altivec --disable-neon)
> /usr/bin/env: 'python': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/91eb6d03ee899bc1034efc5ac7d1fe78961d37ca
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/botan.mk | 1 +
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
