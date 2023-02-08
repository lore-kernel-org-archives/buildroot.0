Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62DDC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 12:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A6046105E;
	Wed,  8 Feb 2023 12:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A6046105E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CgI8ZxxkB7ap; Wed,  8 Feb 2023 12:28:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CED16104D;
	Wed,  8 Feb 2023 12:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CED16104D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3DE1BF5E9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48C6C8148A
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48C6C8148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9h9H5_P9n2t for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 12:27:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C74F9812C8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C74F9812C8
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 12:27:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F115920007;
 Wed,  8 Feb 2023 12:27:54 +0000 (UTC)
Date: Wed, 8 Feb 2023 13:27:53 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230208132753.7895f68f@windsurf>
In-Reply-To: <20221114232254.3970611-1-james.hilliard1@gmail.com>
References: <20221114232254.3970611-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675859275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EaMQ2cx5nsOwEBiohVCIM1CNFRKhL1rz7fXBlG6o+X8=;
 b=SDp+JvIXl81w4omIg32uitA6KbUC5xZdwmCIFtJH80zslWTXkV3UVzr6VUd5mYGYuKZEsC
 d9KTzFQMO9bySTgBFPB9SUVmxH1rOdWrUhvC6RVBx5/b04klAAMf8sQFuM70+bIiaF+18T
 5G7Rqw6bttYv+rF0BKzYUmp1s2aR887fxmWHL72756aIW6lCV8SDwXOy6cIwbYSGIdNkL+
 9FXXmt9xr28am332flrw1hObX0mIDz+5Zo+HApD/Q83jrTG2M7jXf9eHVCW6GAnxjqehOc
 8qqO+pVucZZgDeR+wfj6ZaO4asIDhFN/rY07FLfBN82KVyJ2uKAFJ8sG0dwwpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SDp+JvIX
Subject: Re: [Buildroot] [PATCH v2 1/2] package/zxing-cpp: bump to version
 1.4.0
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

On Mon, 14 Nov 2022 16:22:53 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patches which are no longer required.
> 
> Verified license remains Apache-2.0 after hash change.
> 
> Rework config options for 1.4.0.
> 
> Add new host-pkgconf and stb build dependency.
> 
> Drop optional libiconv dependency which is no longer used.
> 
> Add optional python module support.
> 
> Add optional qt5 support.
> 
> Add optional opencv4 support.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - fix makefile pybind check
>   - add comment for qt5 required config
> ---
>  ...bs-private-not-exported-to-the-users.patch | 43 -----------------
>  ...akeLists-txt-add-BUILD_OPENCV-option.patch | 39 ---------------
>  package/zxing-cpp/Config.in                   |  2 +
>  package/zxing-cpp/zxing-cpp.hash              |  4 +-
>  package/zxing-cpp/zxing-cpp.mk                | 48 +++++++++++++++----
>  5 files changed, 42 insertions(+), 94 deletions(-)
>  delete mode 100644 package/zxing-cpp/0001-Link-library-with-OpenCV-make-libs-private-not-exported-to-the-users.patch
>  delete mode 100644 package/zxing-cpp/0002-CMakeLists-txt-add-BUILD_OPENCV-option.patch

Both applied to master, thanks! On the first patch, I have changed to
disable building the examples, it doesn't seem to make much sense to
enable examples by default.

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
