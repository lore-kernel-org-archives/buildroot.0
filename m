Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2790C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 07:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94F00407B8;
	Mon,  4 Mar 2024 07:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKNeeG0ZbN4L; Mon,  4 Mar 2024 07:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B23A9407CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B23A9407CF;
	Mon,  4 Mar 2024 07:32:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 412081BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EC84407CF
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QjhNkNK0-Qr for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 07:31:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03335407B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03335407B8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03335407B8
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 07:31:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66F2AE0004;
 Mon,  4 Mar 2024 07:31:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rh2nh-00CAqw-2C;
 Mon, 04 Mar 2024 08:31:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240303171115.1140763-1-ju.o@free.fr>
 <20240303231912.76c9702f@windsurf>
Date: Mon, 04 Mar 2024 08:31:53 +0100
In-Reply-To: <20240303231912.76c9702f@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 3 Mar 2024 23:19:12 +0100")
Message-ID: <87ttlm311y.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/efivar: bump to version 39 to
 fix build failures
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Julien,
 > On Sun,  3 Mar 2024 18:11:15 +0100
 > Julien Olivain <ju.o@free.fr> wrote:

 >> Those failures were introduced in commit f24029b561 "package/efivar:
 >> bump to version 38". This is because efivar introduced a usage of the
 >> qsort_r() libc function, in upstream commit [6], first included in
 >> version 38.
 >> 
 >> Musl libc added the qsort_r() function in upstream commit [7],
 >> included in version v1.2.3 (2022-04-07). So external toolchains
 >> including a Musl older than this version will fail.
 >> 
 >> This commit fixes those build failures by adding a dependency on
 >> !BR2_TOOLCHAIN_EXTERNAL_MUSL. Technically, this dependency also
 >> excludes external Musl toolchain _with_ the qsort_r() function, but
 >> there is currently no way to check that.

 > I think we shouldn't do that. Instead we should update/change the musl
 > toolchain used in the test-pkg testing. Possibly by using a Bootlin
 > toolchain instead.

Agreed. Buildroot has included a working musl version since Buildroot
2022.05, so I've dropped that part and committed - Thanks.

The affected toolchain is:

support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config:BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2020.11.2.tar.bz2"

I guess we could replace it with x86-i686--musl--stable-2022.08-1 or
newer:

https://toolchains.bootlin.com/releases_x86-i686.html

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
