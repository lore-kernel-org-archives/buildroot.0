Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E675DE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 16:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A740660613;
	Mon,  6 Jan 2025 16:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDe4bmjCBow6; Mon,  6 Jan 2025 16:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C95216062E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C95216062E;
	Mon,  6 Jan 2025 16:11:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2022A6B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00C5A6062E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rb6vBec81UJ for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 16:11:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F39160613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F39160613
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F39160613
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:11:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C133D1BF20A;
 Mon,  6 Jan 2025 16:11:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tUph9-00Ecbk-2d;
 Mon, 06 Jan 2025 17:11:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>,  Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Bis <marcin@bis.org.pl>,  "Fabrice Fontaine"
 <fontaine.fabrice@gmail.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
References: <20241205143650.3262372-1-fiona.klute@gmx.de>
 <20241205143650.3262372-3-fiona.klute@gmx.de>
Date: Mon, 06 Jan 2025 17:11:11 +0100
In-Reply-To: <20241205143650.3262372-3-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Thu, 5 Dec 2024 15:36:49 +0100")
Message-ID: <87a5c3hqhs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/4] package/bluez5_utils: install datafiles
 with correct permissions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

 > From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
 > The datafiles include the dbus policy, without which bluetoothd fails
 > to start (unless it is provided by other means):

 > # /usr/libexec/bluetooth/bluetoothd -n
 > bluetoothd[1011]: Bluetooth daemon 5.78
 > D-Bus setup failed: Connection ":1.7" is not allowed to own the
 > service "org.bluez" due to security policies in the configuration file
 > bluetoothd[1011]: src/main.c:main() Unable to get on D-Bus

 > The installation issue 1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e was
 > meant to fix is the result of upstream incorrectly installing
 > /etc/bluetooth with 0555 (strictly read-only) permissions.

 > Fixes: 1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e

 > Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
