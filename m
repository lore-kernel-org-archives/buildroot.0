Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3276C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 12:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BD216063A;
	Mon, 22 Apr 2024 12:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbqMdaRxaid8; Mon, 22 Apr 2024 12:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A189760647
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A189760647;
	Mon, 22 Apr 2024 12:14:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3730B1BF322
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 12:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23F4640AC4
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 12:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HJMiJbBU7WB for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 12:14:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78E6B400CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78E6B400CB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78E6B400CB
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 12:14:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([212.114.183.37]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDkm-1swKpy3hPs-00xZBm; Mon, 22
 Apr 2024 14:14:06 +0200
Date: Mon, 22 Apr 2024 14:14:05 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <20240422141405.10ed2e21@gmx.net>
In-Reply-To: <CAGm1_kv4F+h1KZOiYTJ2ZActM6FMekfUc-OSQYt+ABEjdCsncA@mail.gmail.com>
References: <CAGm1_kv4F+h1KZOiYTJ2ZActM6FMekfUc-OSQYt+ABEjdCsncA@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:QQhGRZCqB1LlhVclkmT1FsjJMGWSIn4hClKZvJNCayl+meRQPAM
 0A6mJeFlmlmP04Gvgj6vguxS6TIU/XVR0YjXVUEa4K5+1MAW+JzWvYk6zW985Sz0909QEQk
 Rg7Np4z96x9uclxVVSFgJdsIhrrKvNrKEfHjDFpi1+z+L1ggtxzWpVmCc1xAbaghTnvgv+q
 8iZVcwjIAIHsI534XitUQ==
UI-OutboundReport: notjunk:1;M01:P0:Qq1A4sKWbRk=;vZ5lkQMluK3WQh++Ob04259WGvv
 8CVdVBnwj3MV7JCB/f4O9r6hIHQfUH6Wzr+B87cWu03H5FE6DV8VJKE27WBi8LKmcI/m3rp9k
 0//uCfPWFWYqtEful0Ok2K5JzTdUCSKLc8Q3ooNOeYIXXB7D2HhuIZcsOsrt2I9yQGF6+/Z6N
 cx0VMiSjYI+Cns9B+NZVdbpr2EBKZPLJVNXnZaRf6WySmbxJ3UdGodAA7KfZxuJbRX+mLuQPN
 3q+CcUdNPZfLATvstj+i6fnxEWlhNEO1buN/leEremGzxKGmtaP42SVicoUdS/imcel3YuECv
 T+N+jZwTXVRPaQQO6lolcxmfBLwnVv6CkeWZcheJZh/SrHgtEehv4tFCSTtFlM8/uY0QJVP2m
 jj4YZr6ioXqMvJyoPT6urgf876F1niArGMW2IOJP4eJiVbIZzF5bSRaJxG0eyyIb16V645tF9
 SJoij1qB0b2rdAEE3n0wwoYWue9t8/IuZ4v2QgZxRwyB60CY2WlWgBUJBwoP/Ll+SPq/c9flc
 4qPlQFTD381KHoBAX7FvAL3pYbWnadlHplpSHFVhmvsEtWr6r+YgYppYpYRPdzkxK3Rs619xz
 v6iAaR5XTKrNKwevRF4Fa3rjipygBvlW7mUdcYma0JRulwU77et+42C0cKvKKuQf5LClGr29J
 ++fGwQ76GF2mQmnROKZXjYceZuaMfdmTGtnM52bzjPv9545SAK5aup/WAaC37I3Hp55mBpXOs
 262kxJdtPBj+l0ENfJPvpLcrGuJaeoPzshk/SwiSjCjnUNHY5ORx8J9cAFj/qmt0+zZWdwaKS
 vjFCxy7nuq1tz6Ejpq1sPP8McFRBaGqdcEflGvBkPDrPA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1713788047; x=1714392847; i=ps.report@gmx.net;
 bh=ZBdCYHkmN2TB37dj8lydGCE2vODMxj8ouf+pu259M9I=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UyyvyeGMtCb8GyEq0frxFdCJDQ75OHt6ztwoNR8pSo3zsLVnNLtXAZnRojG+/rM5
 m8cdanhp1XJVu9A7+O8clbsTVxC7760q/8LTFPyp5mKG1wwgQZjq024fzrBAYPqp2
 H4ez/zdV6Woy2vLaXegNy13R6BRMVNSYVT2ZT5Y/UptXSdAjcpsBSGqVBhFYFfSEh
 COZoztLH02Bslw5n8SAoaasDPydQhKPRFYCZjbMzXe/mv1MTpd0f4TmbD+yGnAjCh
 puv4RG+HrVjXyLUJtiUIYmBB6tUlzLRy8BIoMeYZlWYT0+bXj3S6yUTRyp/3LLP7T
 G80/WAz5CXHgT6yRNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=UyyvyeGM
Subject: Re: [Buildroot] pkg-meson.mk: support for the host python packages
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Apr 2024 12:46:04 +0200, Yegor Yefremov <yegorslists@googlemail.com> wrote:

> libglib2 2.80.0 requires host-python-packaging to build the library [1].
>
> What is the best way to tell meson/ninja where to look for our host
> python packages?
>
> [1] https://gitlab.gnome.org/GNOME/glib/-/commit/fc6f06127cff9fe3e464b5be8c92ea08a679b620

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index c06ded2a5b..819282910a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -34,9 +34,11 @@ HOST_LIBGLIB2_CONF_OPTS = \

 LIBGLIB2_DEPENDENCIES = \
        host-pkgconf host-libglib2 \
+       host-python3 host-python-packaging \
        libffi pcre2 zlib $(TARGET_NLS_DEPENDENCIES)

 HOST_LIBGLIB2_DEPENDENCIES = \
+       host-python3 host-python-packaging \
        host-gettext \
        host-libffi \
        host-pcre2 \

Regards,
Peter

>
> Best regards,
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
