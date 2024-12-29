Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAE2E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF7D36084D;
	Sun, 29 Dec 2024 22:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOV8x7Cq9L2j; Sun, 29 Dec 2024 22:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5978608CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5978608CA;
	Sun, 29 Dec 2024 22:37:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D78DC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39AF4402E5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkZWYU3-JmvU for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:37:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F11F9402A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F11F9402A6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F11F9402A6
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:37:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAA80C0003;
 Sun, 29 Dec 2024 22:37:03 +0000 (UTC)
Date: Sun, 29 Dec 2024 23:37:03 +0100
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241229233703.707ef648@windsurf>
In-Reply-To: <20240913154634.10723-1-nicolas.cavallari@green-communications.fr>
References: <20240913154634.10723-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735511824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9sSLC8gp9PfWfYeCsAJ3mhtUfQzxTGT3XcEviRwjvgk=;
 b=MZSqJYB3gnpDRm+ZuKLdo0f0tpcS6cqshGCwNCF36tnHUhjVnvKHt5sFZU/ar8oh/3b6WR
 R+0LaO5KtXmlOvWsKA9oVMSyOz/pw/YA/dgAguM/5vMUZALWnzfkZxrIsQ8HGZYGa4Q5ZR
 A3d6ZiOcevJEtKocV4YwxrEPDtVyePMJ0XQkKTexE6fw4E/jFEBC436qEh2gjNWEns6fZ2
 biJcwmoN35RuVXKW0CrkO1aUVUHjXItgw2zhI1ed27UAy1sJQ9mvpYGTAeK85IrFrSeY1w
 s1YsGgsJpdtAYQV3UhPdmOycBESlCG2VJc6cjaaEP71lrtYXfcO2pyxMc9RvwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MZSqJYB3
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix bluetoothd
 daemon not starting
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nicolas,

On Fri, 13 Sep 2024 17:44:28 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> bluetoothd does not start since commit 1a8676aa6e4b
> ("package/bluez5_utils: disable datafiles"):
> 
> bluetoothd[4242]: Bluetooth daemon 5.75
> bluetoothd[4242]: src/main.c:main() Unable to get on D-Bus
> 
> This because --disable-datafiles also disables installing the D-Bus
> policy file /etc/dbus-1/system.d/bluetooth.conf that allows bluetoothd
> to own the "org.bluez" service name.
> 
> The underlying issue that the commit tried to fix is that this package
> now installs /etc/bluetooth with mode 555, which causes problems when
> buildroot need to remove or patch files.
> 
> To fix this, fix the permissions in target/ and staging/ after
> installation, but still make sure that the permissions on the rootfs are
> 555.
> 
> There could still be permissions issues if make install fails, because
> the fixups will not be applied.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/bluez5_utils/bluez5_utils.mk | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

Sorry for not getting back to you earlier on this. We have applied a
different fix, which involves a patch that was accepted upstream, see:

  https://gitlab.com/buildroot.org/buildroot/-/commit/421a92a8973d23b017293ea8b776d34fb54a6b5e

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
