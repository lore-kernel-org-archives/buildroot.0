Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA07EC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800C3607CE;
	Tue, 26 Jul 2022 21:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 800C3607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgZjC646DQE1; Tue, 26 Jul 2022 21:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F3F3607D1;
	Tue, 26 Jul 2022 21:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F3F3607D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 102DC1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA531402E5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA531402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MB3avOaMtIyO for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:47:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9466F402E3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9466F402E3
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:47:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E5E81C0003;
 Tue, 26 Jul 2022 21:47:19 +0000 (UTC)
Date: Tue, 26 Jul 2022 23:47:18 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220726234718.45942b15@windsurf>
In-Reply-To: <20220726201647.216177-1-fontaine.fabrice@gmail.com>
References: <20220726201647.216177-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658872039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1TMEbXR724adRlmCdQQi28zoIYeJH9RN4e3NjeOPIk=;
 b=VM6YHmbccGnz92wasyegLNHwAwIl3zZVkkGJ8pCe/v/MYg212dVicRUBOj2A+sXOy4CP53
 JqkruZtsmnT5YB67gF7TciOjx4dTOcnrNTv91/007EDwNaONg1o0+UuNjhhrfwjsnH135l
 P+G6nAMvQloYfBY6sWBWJutAwn+jqCaMZqnDLPkRa9zOVs9hJYSj6Vwc0oXSv2nh/uT7m0
 sHdrl5OrkGCg07Aaae8MqbBXT1rIl6eD27inaOiRgCH+N6V/wg23mzpwY000MkOczHOoCz
 SItOBl6pdSyHFZT9vMik1m1FcpGRtTLTffvrIdAI1hRlStTaVkd52M1T6ASqhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VM6YHmbc
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: alsa needs UCM
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 22:16:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> alsa needs UCM since bump to version 16.1 in commit
> 6f3131296484767f037d3535ab69f328e94351db to avoid the following build
> failure:
> 
> In file included from ../src/modules/alsa/alsa-mixer.h:51,
>                  from ../src/modules/alsa/alsa-ucm.c:51:
> ../src/modules/alsa/alsa-ucm.h:26:10: fatal error: alsa/use-case.h: No such file or directory
>    26 | #include <alsa/use-case.h>
>       |          ^~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c651c03bc493ac721ad6517ace550237488ef8a8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pulseaudio/pulseaudio.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. We also applied a follow-up patch changing a
bit how this is handled: see commit
97cd3680a4cc4bc0c71bccccb1459eda4b880159.

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
