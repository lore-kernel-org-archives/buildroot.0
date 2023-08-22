Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C1BEE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F090961203;
	Tue, 22 Aug 2023 18:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F090961203
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WakwuoHVdYl0; Tue, 22 Aug 2023 18:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 537B1611E5;
	Tue, 22 Aug 2023 18:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 537B1611E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF3121BF35E
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AA80611E5
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AA80611E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jb1xqx5TyKVm for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:12:42 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0710E611C9
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0710E611C9
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB7C660003;
 Tue, 22 Aug 2023 18:12:38 +0000 (UTC)
Date: Tue, 22 Aug 2023 20:12:37 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230822201237.024570fd@windsurf>
In-Reply-To: <20230814102453.102735-1-james.hilliard1@gmail.com>
References: <20230814102453.102735-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692727959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNdoxrDCNjswwBtUsJTd+05c7E5wgLfy2Q4qJ1AGiQ0=;
 b=FuQ6kxZfwC8/lZ1BgxKYFaWrmx6DutQPFrYw+SA+CbTSh1aGY6NPsl8q4uC0TrP+BiZ5Kp
 YIAq6hAG8UCZyba18w57e/UoDXnQsbXh8GS5vNnLjPYGkG3rOTPC4Tzq1hvvu4SV145uNf
 q3WafWwyhYB8M4n+yww4+E51RIZHlTOgsEya6Xe75CzVslUn7O3+o2ubN/qgbU+CSonJRf
 ZbZ49sUCivhsJBZY3FCI7uThauvWF90vKtGVlCtA5ZxcLF63PTBNgsgHS3zFKYuW3ncWaf
 7QvlTRG2WXEzepBTYcOCBb9CrJcdyDUUBvc8A5V3RQaU//48Jbc5WpuW7AVw/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FuQ6kxZf
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.71.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 14 Aug 2023 04:24:53 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Link to Rust 1.71.1 announcement: https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Did you run the Rust test cases after this version bump?

./support/testing/run-tests -o /output tests.package.test_rust.TestRust tests.package.test_rust.TestRustBin

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
