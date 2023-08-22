Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9439EEE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47BA260BD3;
	Tue, 22 Aug 2023 18:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47BA260BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t3V7nxmDl9Nm; Tue, 22 Aug 2023 18:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D5F60BAA;
	Tue, 22 Aug 2023 18:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D5F60BAA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43B981BF2BD
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E040040629
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E040040629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9eF5Tn8M-AC for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:28:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42CED40622
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42CED40622
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21B82E0002;
 Tue, 22 Aug 2023 18:28:22 +0000 (UTC)
Date: Tue, 22 Aug 2023 20:28:21 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230822202821.4b750d61@windsurf>
In-Reply-To: <20230814145413.2099039-1-giulio.benetti@benettiengineering.com>
References: <20230814145413.2099039-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692728903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZQ8C3VWmZoRNPaDAX6GvC8Us6s7IGhVVls9HcCbUFc=;
 b=HcfzG9BRvb2mze7sASo4wj+k44fohC7S0bWiE0Ig4aOt5Y6pZ3wju0jMQMjUZimNlXvkO0
 YbQU4zrnL96ChdZb38PXiqOH/5LG3K9nX4Pa2ewM/erygsy99+quzEMy7eDXiIK3ztII0u
 K+TcZTcjeAzL013xdoow+KJ0kc7/dk6DHGoMP/EnrrUeU7ZTAhIoRNS527zi0851Ml2wYv
 CX8fAOpKGQHPxgHwFw2yDQpOUXxpMMa2iR83sfBCIzVN3wv1I9LVdcuhieNXg7MMVShn2p
 JjhoHMe3fx4Nr0uBwdIYpSi1X150Kpjb4AHKI1AwCagoy0enLaal0X2oh/RH5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HcfzG9BR
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.16.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 14 Aug 2023 16:54:13 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Let's drop local patch that has been upstreamed:
> https://github.com/libfuse/libfuse/commit/b58a0014bff619f1810af49441d987d732c4244e
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...est-applications-for-cross-compiler-.patch | 43 -------------------
>  package/libfuse3/libfuse3.hash                |  2 +-
>  package/libfuse3/libfuse3.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 45 deletions(-)
>  delete mode 100644 package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch

Trying this, I get:

ERROR: libfuse3-3.16.1.tar.gz has wrong sha256 hash:
ERROR: expected: 75a7140ce2d4589eda2784d2279be9d2b273a9b6b0f79ecb871dc4dded046fb5
ERROR: got     : 17c44c13f6a123c0c13d074fcf61c230a88531202a40c864187dee78f5851693
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Are you sure you tested it? If you still have the original tarball with
hash 75a7140ce2d4589eda2784d2279be9d2b273a9b6b0f79ecb871dc4dded046fb5,
please keep it around, and compare it with the current tarball of hash
17c44c13f6a123c0c13d074fcf61c230a88531202a40c864187dee78f5851693, so we
can understand if it's upstream that re-uploaded a different tarball.

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
