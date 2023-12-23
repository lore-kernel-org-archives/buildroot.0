Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E09C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF58A60E7C;
	Sat, 23 Dec 2023 14:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF58A60E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O54_wlEUIj3v; Sat, 23 Dec 2023 14:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21D5C608A6;
	Sat, 23 Dec 2023 14:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D5C608A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61F2F1BF280
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A67D608A6
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A67D608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOEYED2Nat75 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:16:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF78D60586
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF78D60586
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0854220003;
 Sat, 23 Dec 2023 14:16:46 +0000 (UTC)
Date: Sat, 23 Dec 2023 15:16:46 +0100
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20231223151646.27de9baf@windsurf>
In-Reply-To: <47f41c5f59356bcda28bf1ed0c8046241876b21c.1703096871.git.stefan@agner.ch>
References: <47f41c5f59356bcda28bf1ed0c8046241876b21c.1703096871.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703341007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZprhQVh/UAWcveEo5denEWxoU7Q71YpGWjL2G9tgYg=;
 b=XhcrP2f8CSvMbjP5ch45yZxecSSqwOOCnQHO45PFH36pxOqq+glFZXoWpWEStYW7FXfNOg
 IeHPky+b+005wBp7tJnIk6w/+pO95ZyykMJQ/T0O0n5mV2maHzGSxbE4dOcRivkBLZuMGd
 La/ftNS4YTkzxwOwl2m5LZBNtpOvB/w8agsaJfYzTyJOuj6X73eX1j6VMIKPmn3S63yWJE
 qgkeDfulK4IAncyJ8j3pRuWq6tjCEDASBvWnu9IFc+ZCCdo+st3Jn/TU3cPuDVZttStCmf
 azRGwt4EJSOpD1N6oTckx/w7jMW/CENDlZlQpCYTfyfRzkKo7GMMfb58T3idxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XhcrP2f8
Subject: Re: [Buildroot] [PATCH] package/dbus-broker: bump to release 35
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
Cc: james.hilliard1@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 20 Dec 2023 19:28:51 +0100
Stefan Agner <stefan@agner.ch> wrote:

> This release supports the new `ProcessFD` key in
> `GetConnectionCredentials()`. It also contains a fix which avoids
> using randomness during early boot besides other fixes.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/dbus-broker/dbus-broker.hash | 2 +-
>  package/dbus-broker/dbus-broker.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This change breaks legal-info:

>>> dbus-broker 35 Patching
>>> dbus-broker 35 Collecting legal info
LICENSE: OK (sha256: 3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4)
ERROR: while checking hashes from package/dbus-broker//dbus-broker.hash
ERROR: subprojects/libcdvar-1/AUTHORS has wrong sha256 hash:
ERROR: expected: 20ea1f96abc15553695c6725bb3dcabff4b43b85b7ca7d675a2b8860e3b01f87
ERROR: got     : ce7b8b8fb05126e556b3f9ed97fe21aa654e4ff411c00a9fd219ecbaae26abe0
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make: *** [package/dbus-broker/dbus-broker.mk:71: dbus-broker-legal-info] Error 1

Could you fix this, and send an updated version? Please don't blindly
update the hash: verify what are the changes in the file, and summarize
them in the commit log to explain why they don't change the licensing
terms.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
