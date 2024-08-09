Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A19DC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 21:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF97360650;
	Fri,  9 Aug 2024 21:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygM-sv5aHowi; Fri,  9 Aug 2024 21:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1394961305
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1394961305;
	Fri,  9 Aug 2024 21:07:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 571851BF286
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 21:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44C4C61305
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 21:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCxo1nwriymy for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 21:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A6F1E60650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6F1E60650
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6F1E60650
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 21:07:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5242860002;
 Fri,  9 Aug 2024 21:07:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1scWpd-000Kin-1g;
 Fri, 09 Aug 2024 23:07:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231203182911.290968-1-fontaine.fabrice@gmail.com>
 <20240713145227.3a69102a@windsurf>
Date: Fri, 09 Aug 2024 23:07:29 +0200
In-Reply-To: <20240713145227.3a69102a@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 13 Jul 2024 14:52:27 +0200")
Message-ID: <878qx5o166.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/openssl: add BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello,
 > On Sun,  3 Dec 2023 19:29:11 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> libressl doesn't support all architectures since bump to version 3.8.2
 >> in commit 21eca49ed5110872407b76ab9337d2877c4cda24 and
 >> https://github.com/libressl/portable/commit/b98c56fd5e86fa76eb55a98a2266a923f64f705c
 >> https://github.com/libressl/portable/commit/71ce0b8c3e07079a40011d2f3515969e3bdf302e:
 >> 
 >> In file included from /home/autobuild/autobuild/instance-4/output-1/build/libressl-3.8.2/crypto/rc4/rc4_enc.c:61:
 >> /home/autobuild/autobuild/instance-4/output-1/build/libressl-3.8.2/crypto/../include/openssl/rc4.h:75:9: error: unknown type name 'RC4_INT'
 >> 75 |         RC4_INT x, y;
 >> |         ^~~~~~~
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/1f6ac121b3771ccc4b0e846c061b7002ccb63963
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Thanks, patch applied, sorry for the huge delay!

 > I even submitted a small
 > contribution https://github.com/libressl/portable/pull/1070 to error out with
 > a nice error message rather than horribly failing at build time.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
