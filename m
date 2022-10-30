Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8470C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FDA181289;
	Sun, 30 Oct 2022 20:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FDA181289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyqXFQLM0T_0; Sun, 30 Oct 2022 20:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B1681288;
	Sun, 30 Oct 2022 20:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1B1681288
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0277B1BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC38481288
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC38481288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuMZsADyb75x for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:51:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBFC881280
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBFC881280
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:51:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D441560003;
 Sun, 30 Oct 2022 20:51:02 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:51:01 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221030215101.47713626@windsurf>
In-Reply-To: <20221019133511.1717939-1-angelo@amarulasolutions.com>
References: <20221019133511.1717939-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667163063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WoeRsjoNHXN4l5coSXYd+I7LHPrc6hLXoBZQ8pVxXNw=;
 b=RBypXF/pXv2I91t6FES0LfvKuF41jS1B7kUelYDlXT3bzq9kHnDWfqe9d8v5sjQMXEgWNV
 2FSQvBRsmBDXnjQpXT3XoM1MDixlcNV25SnKAiiWJFyxgqZFehhlGj49C1NjLfTSHBhd92
 xGzGpGPG68okikxEyywFSPNkAVmWXG14xqWqxAj92hVQ1lcYLzJriuRxBhfRW2RFbi2aT9
 h3ID+i3FdMXh3vD177zTDYl5n71uekHCrLAf6NnTXgwNGZXS7PYlV21V3uin37DLUI5rHC
 6FUl/+fIeKP1k7kVeVFxG3dc0zmnI7/NlsGH0ubOg0MD7usR8h5JUVDQFenjjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RBypXF/p
Subject: Re: [Buildroot] [PATCH v3] package/python-minimalmodbus: new package
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

On Wed, 19 Oct 2022 15:35:11 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Easy-to-use Modbus RTU and Modbus ASCII implementation for Python.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Applied t master with one change, see below.

> +PYTHON_MINIMALMODBUS_LICENSE = Apache License 2.0

This is not a valid SPDX identifier. The correct identifier is
Apache-2.0.

Committed with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
