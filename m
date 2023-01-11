Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8425C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 21:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C17B404C8;
	Wed, 11 Jan 2023 21:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C17B404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiF9jFzZATCI; Wed, 11 Jan 2023 21:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DEDF402F2;
	Wed, 11 Jan 2023 21:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DEDF402F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F60D1BF2A3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 21:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87C7282065
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 21:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C7282065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqH35m1qHPJj for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 21:36:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34538205D
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D34538205D
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 21:36:39 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id pj1so8354097qkn.3
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 13:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I5+ZApbwrIYta8GOIgUi+uyKIm/wHhJ3RoLx8Vf9BXA=;
 b=PXvKFK19W2WQ+bzjv1RF0vfGvuxqKIvWoE16Y09MC4CEeD01fER9ZV0BszSLVff9tH
 2lFpHIOwpLzJbQOpjdB6zYaV3lKe2VTpKrL/pcS8xEdsLVb/C0wdxHtaxqcdwqXikfWL
 s2LcbJ1FHhmQSlKy4i8ZfA9xAUF3F+tWUrGFsodrnYnMuC9oHIDU1uXLEWuIHfESGRVF
 DRzcFji3sFtERTfD9yioYGOXnNFS1+amaiwWqeIpIloNfi74NUblIab2j3J78oOz7X71
 FfD4ThYLGL8vZbUwDhwoeh/UBZ/oca1QDnVCW+otyxmm8LflIwU31wLJ7xGSS7aKKmJ5
 59QQ==
X-Gm-Message-State: AFqh2krWUBZFJSUzwqYrpMynnxGQyeUTk9iKFJ45BqIgjcGVGWvE8zVe
 NIzl8uF3f7lI5ZvOLz3RHnRNChTUeHvSfTxfP9t85cbp
X-Google-Smtp-Source: AMrXdXsoDGL1lYQPZ+gcD09oQ0xyXGep8Hq5X3JQU6Qrmb/6O4XaZZQv5vSxEuCh5s9le6fplxjk70cwmT2ZZG+7X3w=
X-Received: by 2002:a05:620a:f93:b0:705:ef9d:cc16 with SMTP id
 b19-20020a05620a0f9300b00705ef9dcc16mr103281qkn.439.1673472998616; Wed, 11
 Jan 2023 13:36:38 -0800 (PST)
MIME-Version: 1.0
From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 11 Jan 2023 22:36:26 +0100
Message-ID: <CADYdroM5e4W64FXRMK9QUGXrcBOLBRUiyursiPW7mjP6bs9KdQ@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=I5+ZApbwrIYta8GOIgUi+uyKIm/wHhJ3RoLx8Vf9BXA=;
 b=mlx4HNa1Uck1Q2z6q/Cg20C+9rv9umdoPnnf3ySJELXK30iZnsVWqt8tuGkDCy1Yuo
 4JAnZhA9yS+d3O5kPu8jvHC9Jd2utMH+xVQzzEwiZlbQLNIwGQnx9vn//EJTTMDVmyiS
 mzp/JAd4X6n6USg5oOhWvQMpNpx9kBMnQvte1adya1GeQnJ3aIwGpqPOx1d+8+krQQge
 tuWCREbht/ODu7487vC2O/qAcOxA7ZQQblvj2pKo4tAsflmaP3jFLESJPWVxL+frhhb4
 gn/dGcLj6l4Hyjbbl+JXtLFGmdkYgqw4zQOQUsjijwEerXOv0oVJaI0EvNvZymavcSwM
 TZDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mlx4HNa1
Subject: Re: [Buildroot] [PATCH v2 1/2] package/cmake: disable ccache for
 host-cmake
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
Content-Type: multipart/mixed; boundary="===============0428074282408426793=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0428074282408426793==
Content-Type: multipart/alternative; boundary="0000000000009fb38705f203cbf0"

--0000000000009fb38705f203cbf0
Content-Type: text/plain; charset="UTF-8"

Hi,

Wouldnt a way simpler method be to just prepare a wrapper in
$(HOST_DIR)/bin/ccache ?

#!/bin/sh
exec "$@"

(Or a bit more sophisticated: try finding and using a system installed
ccache first)

When host-ccache is installed, the wrapper will be replaced.

Regards, Norbert

--0000000000009fb38705f203cbf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">Wouldnt =
a way simpler method be to just prepare a wrapper in $(HOST_DIR)/bin/ccache=
 ?</div><div dir=3D"auto"><br></div><div dir=3D"auto">#!/bin/sh</div><div d=
ir=3D"auto">exec &quot;$@&quot;</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">(Or a bit more sophisticated: try finding and using a system inst=
alled ccache first)</div><div dir=3D"auto"><br></div><div dir=3D"auto">When=
 host-ccache is installed, the wrapper will be replaced.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Regards, Norbert</div></div>

--0000000000009fb38705f203cbf0--

--===============0428074282408426793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0428074282408426793==--
