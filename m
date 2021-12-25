Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F7AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 10:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F9660C06;
	Sat, 25 Dec 2021 10:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTi4xQNY7nAI; Sat, 25 Dec 2021 10:55:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEB2B60BEC;
	Sat, 25 Dec 2021 10:55:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6135F1BF83E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5040581431
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yik-SSvwiRe9 for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 10:54:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64FB48142F
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 10:54:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 74FAB240002;
 Sat, 25 Dec 2021 10:54:24 +0000 (UTC)
Date: Sat, 25 Dec 2021 11:54:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211225115423.4e1af945@windsurf>
In-Reply-To: <20211220155546.2566020-1-fontaine.fabrice@gmail.com>
References: <20211220155546.2566020-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libnetconf2: disable tests
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Jan =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Dec 2021 16:55:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> tests are not disabled since bump to version 2.0.24 in commit
> 721f05420cb5908aa19eef47f96418aa6cd04398 and
> https://github.com/CESNET/libnetconf2/commit/2cd716353d0922ff57c34ead58fbcd14b7fb92af
> resulting in the following build failure if cmocka is found:
> 
> In file included from /home/buildroot/autobuild/instance-2/output-1/build/libnetconf2-2.0.24/tests/client/test_client_ssh.c:8:
> /home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/cmocka.h:2334:47: error: unknown type name 'va_list'
>  2334 | void vprint_message(const char* const format, va_list args) CMOCKA_PRINTF_ATTRIBUTE(1, 0);
>       |                                               ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fe793ae69d952a7a07d6d07e179925b67469dff4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnetconf2/libnetconf2.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
