Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB27EE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8004098D;
	Mon, 21 Aug 2023 13:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F8004098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y7nsCXODtgbB; Mon, 21 Aug 2023 13:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F8640984;
	Mon, 21 Aug 2023 13:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F8640984
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7FA1BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D85CA81E7E
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D85CA81E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wh_bK0IZfYbI for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:06:02 +0000 (UTC)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C0BF81E7D
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C0BF81E7D
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4108cef5a6cso12285231cf.1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 06:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692623161; x=1693227961;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6T0wosZOliqkQFykGLihU/elCq4iM8oX5E8yXy4ippc=;
 b=Vd6WiD6tHZzfHGOoUCVBwP5VPBgoImEo8gJM6yOiA8FRKz/FQmi81CyRcyElK0+43o
 v+zPR93gUsfpwQh3md+CEsqDztkiHbzQO4mGobisMZ3La70Q8UQMksekPUUe6Nd1gnSU
 ALiZTeb/+9/T3NrcqJ+ORvc/Yux11iofTH+YYwrfLhkdTRbJZch/mpppn7zExkVt+FKM
 YMUm0QIHzvE9IzgC2pPKkjEYE942SLmd7QoxjEQcTXvCSiBEq97uieRJII5EQlh2z324
 +w3zvhK0Om91lPpvBONCJ+S8hfX4dj5MTo0TZ0KYOpcHmZ1ihUHDiTofo3TalSZsvvgi
 Efrw==
X-Gm-Message-State: AOJu0YwXDiWu/jTNSC5WZniUSeNhwfxrboFdSsrihpW5wDCiIAD0U5GL
 MmvbfcQF9SxAEEImEXdBTRcXxfiu253VvEzQplwNSg35l7g=
X-Google-Smtp-Source: AGHT+IE1n1K0/5WDs1Z/PWhVrImiZIzozVhsz2CWem4NhiSeO0u4GY5R6vKYsNhdo6KLGIoU+7ZuPSr5144gb4jvVmc=
X-Received: by 2002:ac8:7f09:0:b0:40f:d98e:ccd2 with SMTP id
 f9-20020ac87f09000000b0040fd98eccd2mr9680825qtk.38.1692623160926; Mon, 21 Aug
 2023 06:06:00 -0700 (PDT)
MIME-Version: 1.0
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 21 Aug 2023 15:05:50 +0200
Message-ID: <CADYdroNOpNJL2SLgKchHB9KitfEbQRv6gA+v+jGt=tdRSwA10Q@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692623161; x=1693227961;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6T0wosZOliqkQFykGLihU/elCq4iM8oX5E8yXy4ippc=;
 b=FsHmmR1I1y27+RqhBWvZwXWOS5aqpODk39eReQ4nfB9+1moT3i7iiVv/PqWLM4LCU5
 D3UhW59wBIAs7+el/rg/4M9a9tFGJZQclFnhTt3o4MxCf9SvM6/nG4++pOKh6eUB6C7t
 9mkU2SCik/DsYPr7jqUtNamACAybYX+xawEpUqr7uQD8sKiTptdhBm1Tk6pKKT1wvjUL
 TFFJI0Gs0cqpGxiquTWR06JoZvhfRHTL8YQgn59wo8GZMANfr9bLVnp4k0mLytyAbP5o
 CcfaYQ8OEkn959xyDC17LVzzwd5QX95oJM7S18VdpqdtCqo5eXtEMh1YVMplujk46GO/
 kolg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FsHmmR1I
Subject: [Buildroot] util-linux-libs still fails to build with kernel < 5.8
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

commit 898bdbca1f11fe81e8be7924371326f85f466a27 added a patch to fix the build,
however this is not applied to util-linux-libs. Means this package
still fails to build with older kernels.

I was able to fix it with
ln -s ../0001-libmount-ifdef-statx-call.patch
package/util-linux/util-linux-libs/0001-libmount-ifdef-statx-call.patch

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
