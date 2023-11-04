Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B87CC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C7474036E;
	Sat,  4 Nov 2023 20:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C7474036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rD6f-i6um-kN; Sat,  4 Nov 2023 20:17:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A737E40354;
	Sat,  4 Nov 2023 20:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A737E40354
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30EA11BF5A6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6E424031C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6E424031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWF_V9ELvWgU for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:16:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FCB440360
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FCB440360
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29FAE1BF203;
 Sat,  4 Nov 2023 20:16:51 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:16:49 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104211649.6e10a0ef@windsurf>
In-Reply-To: <20231001191522.1799946-1-fontaine.fabrice@gmail.com>
References: <20231001191522.1799946-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699129011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KT3Od2FLcx/Ie0O4pm4i3hjU/gVnUqlDQ1qHcm/2uhk=;
 b=RwtFS13ihbL1ehRvueBGkEgNvw9lla2sNLQjxsoUtHou/K3LBTjkOJd+yVrhqtUVg44q1+
 StPrLAweMYpfwwqYkq211HHL2ntLX95iMiC4odmArFC+WWahyIvtjeQAlL9RXjGTnMqtvU
 0V6QRJUuv8++JAyFYUa++KdEJyV4tCjq3FIJ2MssXoZMpZrrUkm+DUd5GEzQHEFSga/TDM
 vEKLSf0xlFM9/4S5XnEZkpn9bKRJJHda0SB2MNFKlsbzIer51TZwB07Qa+ialnEFOVylrl
 VAB3cWi/7snk+gOWx0Aeq59tDBJraq0YkrbaclYTz6dD+EIE4uy1kT4yeTGPoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RwtFS13i
Subject: Re: [Buildroot] [PATCH 1/1] package/cups-filters: fix CVE-2023-24805
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  1 Oct 2023 21:15:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2023-24805: cups-filters contains backends, filters, and other
> software required to get the cups printing service working on operating
> systems other than macos. If you use the Backend Error Handler (beh) to
> create an accessible network printer, this security vulnerability can
> cause remote code execution. `beh.c` contains the line `retval =
> system(cmdline) >> 8;` which calls the `system` command with the operand
> `cmdline`. `cmdline` contains multiple user controlled, unsanitized
> values. As a result an attacker with network access to the hosted print
> server can exploit this vulnerability to inject system commands which
> are executed in the context of the running server. This issue has been
> addressed in commit `8f2740357` and is expected to be bundled in the
> next release. Users are advised to upgrade when possible and to restrict
> access to network printers in the meantime.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ecv-instead-of-system-CVE-2023-24805.patch | 208 ++++++++++++++++++
>  package/cups-filters/cups-filters.mk          |   3 +
>  2 files changed, 211 insertions(+)
>  create mode 100644 package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch

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
