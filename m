Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE400EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 848026102C;
	Tue, 18 Jul 2023 20:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 848026102C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R1wVocb_jDW0; Tue, 18 Jul 2023 20:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF98260D62;
	Tue, 18 Jul 2023 20:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF98260D62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 529681BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C30C81F74
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C30C81F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzQDZLtTuPcB for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:43:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2103381F4A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2103381F4A
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:43:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 664C6C0002;
 Tue, 18 Jul 2023 20:43:02 +0000 (UTC)
Date: Tue, 18 Jul 2023 22:43:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718224300.5de6b78b@windsurf>
In-Reply-To: <20230716072833.2117113-1-bernd@kuhls.net>
References: <20230716072833.2117113-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689712982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhcdHMbqQFPVzuf7NKmKoZ5cp52l68vzYaYquE1B/6A=;
 b=FkDETFlvbFm6pnbBPATyaUE1AZvI0NDPiIQH8ZOZmWyVf0g9FdJmQvXvnf/SrwpMa3YG3g
 JjqFJkT5fCDGQiyX0+7Fat0pLp8qZIYVVIGzYSdhT2TwLr8OTDJISVerAB/yvYtqaHx/tN
 g1gjGlxgQJayTwbzcThNEbMeznEwTnj2KoQkI+WGmwBG8UngIBqkIFMIWQIx7A4AEXOsfe
 k6oOc+DSd8Zuz/ms8DMfZmwtHFuV9RGlokA2noN8PAOvDIJbo6T8Vdjpjh7UD6AH3kfIEj
 kylpr4O/Rp1cKamIOVB7ftK4vchVuUDW0YtOwOH2/Zmkp/TqHihzYkTyaiizkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FkDETFlv
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 require IPC::Cmd perl package for libopenssl
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

On Sun, 16 Jul 2023 09:28:33 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/b85/b85b64162b3889d96c713030b46401e3e0a9a4e2/
> http://autobuild.buildroot.net/results/fea/fea92e9c2a87a317675a7d0610c2ee467a373b69/
> 
> Since the bump to 3.0.9 with buildroot commit
> 3c66f65a6a549930870f2c0d98abb5ca9321d2a5 the configure script of
> (host-)libopenssl needs the FindBin perl module on the host:
> 
> Can't locate IPC/Cmd.pm in @INC (you may need to install the IPC::Cmd
> module) (@INC contains: /home/buildroot/autobuild/instance-1/output-1/
> build/host-libopenssl-3.0.9/util/perl /home/buildroot/autobuild/instance
> -1/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/
> perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl
> /usr/lib64/perl5 /usr/share/perl5 /home/buildroot/autobuild/instance-1/
> output-1/build/host-libopenssl-3.0.9/external/perl/Text-Template-1.56/
> lib) at /home/buildroot/autobuild/instance-1/output-1/build/host-lib
> openssl-3.0.9/util/perl/OpenSSL/config.pm line 19.
> BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance
> -1/output-1/build/host-libopenssl-3.0.9/util/perl/OpenSSL/config.pm line
> 19.
> 
> As this is needed for both libopenssl and host-libopenssl (which does not
> have a corresponding config symbol in the .config), we have to require it
> unconditionally.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  support/dependencies/dependencies.sh | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. I have also installed the missing package on
br-autobuild-1 so that it can now build openssl/host-openssl 3.x
properly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
