Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1391C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 21:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55604400A6;
	Tue, 25 Apr 2023 21:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55604400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0SLA_vxfs3B; Tue, 25 Apr 2023 21:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B19A400F2;
	Tue, 25 Apr 2023 21:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B19A400F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25BC11BF5F8
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB10160F3F
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 21:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB10160F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXfQmO28vfsD for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 21:04:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90FFE6006A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90FFE6006A
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 21:04:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.191]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC30P-1pzREP3bVl-00CTLt; Tue, 25
 Apr 2023 23:03:56 +0200
Date: Tue, 25 Apr 2023 23:03:55 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230425230355.1c7b2cf5@gmx.net>
In-Reply-To: <20230425171454.48802-2-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
 <20230425171454.48802-2-aduskett@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:PDY23GyyLplTf6H6AkpxljuV5rMggQtISPZzov5DFjcLz4+fJEe
 aLnPQL1qFrrKRVTKA0ESlJ5dDgzjBEBe0BuuSPPNs8g11GI22DOgrPtP24SnFuKqn3supuM
 VPxvHmMhTvNvCxrY1eG6b06idu8H5wiAVYtxS5tmlXcRVnxNXatWEh6WvUyFCt86whnStbu
 /Oby36VXvKRzHJLFGj7GQ==
UI-OutboundReport: notjunk:1;M01:P0:330wU+wdK+E=;BPgT0nWjS1f7soLa9Rep6WgqrXu
 1ge8e2KY60kg4Y98YIMPSG5Pf3ocSIv5KP2P/utZHoQVWQ/en14qCpg31x0W/gSQnPwyEAwYD
 XM/UE10BS1Kmblq2zR1YkVhHf7VV/CzCNzql1YIucYYahSmqYeLIbOJ+KBU2KDjuxF552J5ei
 UZl4nV2h0GE8xkht66gXwFx5kJwCcM8XBGMMUMCgtxU4HYhHHfpeDEco7LaxYRsPsfC6eWj6H
 atfBtuOK5eR7bOpHKgChEQHjptBuC2wmRmZNpmwTncldfErcoewARBYKWlVTdqqmyumZh1qQS
 Yg2pAFqnBEVk+cGioNgVpJhB0NOjU0Hb2NAbUbZxDlI2i5Y221l67tN6HY2MGiEPETnBeavD7
 Cg/ceOZCHmBmopywy4mffwONpRvho5v5wYXJM2K8wuV4Qg9adjPeB2vnUyxSKMdfiec73AnF3
 GLxMpoUEWYUSz1qrZCj3cubB+QhiTv2tJc2IiDzRUTks1J+Q8DiKNEo/Bu3xvH2S/Yo8c/OJQ
 RyAgP9g1NFjnG8n1d4+hR/DatKoJ5wopBeQT1fdNDWbi5xoypu90PBnPhmrULPKsJ3xs+sckl
 MmtY7jKKHb9aTgN+duGThtwOXGvVX276M1ZM/Ezi8W1CZpfCeSxHDuxv4BQwreloMt66ReT39
 NXL++0KXxBB0zUsrOInJ/82H26ucbK4kr12BEiY7JnopXUWjirsGzp+8937LMdmdOFKlBKN1N
 0+rj/RrrvdMCQgd8fXNLnnH01WGZPX4i3qsbhZ8bGHV9tqeKo9rXqa3GAofYj9HIqVQRGMqQ/
 C6noy/eodP8KkMx5B7LfkkwwHiabYXKklYljv0bdDg6P+Tc3+s4bJgrkUWjd2xcE9ZowQGKGc
 rFRm6rXQRZjNb4CgJpBcNLJrefwLD7x+FQP2qUmHW7lieKSnmnKJgLyU0OCEQ1yDwF2ADJ88+
 AmCy03RCtIbhr7rUrp6Rm3L05Vc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1682456637; i=ps.report@gmx.net;
 bh=rvqn08ZbnisZJIGQfeBVcjSmFmrZQJ4LFJJVagNN87k=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GaG9pNOrpC68IDbDxab7vjLJbE3OtZKahiaXJtj80gFbxvLgjBBMYPn1lx46spg0o
 PHoe0rKv+zOp17HGO67Np6+TJEmFezWXHLLbTzXOqlP8K42kknvcLN89HwC+EdQmk2
 Jh7eOzHR7LiR38VBA+q+drvUVELEcnOllZ5TwYd49U0LSkf/AyhSfOLSxVTPxJTJQi
 GPGVPk06RXBuK1bXuezesiTINcMILDmFCyDwO5q/HIOJNWK6R1In3PHPaPRVk6OpJN
 bK1P7txiUB/scchpuUZhKyvouJDf5n4/N1ZOsrDDx7zTQqtb8H+Y3TJMhT/JjbIyxt
 Rc6z1oyRV8iRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=GaG9pNOr
Subject: Re: [Buildroot] [PATCH v2 01/13]
 package/libglib2/0003-disable-building-docs.patch: new patch
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Tue, 25 Apr 2023 10:14:42 -0700, Adam Duskett <aduskett@gmail.com> wrote:

> If rst2html5 is installed on a host system, meson will attempt to build
> html5 documentation from the docs directory, resulting in the following
> error:
>
> /usr/local/bin/rst2html5.py
> Traceback (most recent call last):
>   File "/usr/local/bin/rst2html5.py", line 27, in <module>
>     from docutils.core import publish_cmdline, default_description
> ModuleNotFoundError: No module named 'docutils'
>
> Since we don't need, nor want to build the documentation, remove the docs
> subdirectory from being built entirely.
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  .../libglib2/0003-disable-building-docs.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/libglib2/0003-disable-building-docs.patch
>
> diff --git a/package/libglib2/0003-disable-building-docs.patch b/package/libglib2/0003-disable-building-docs.patch
> new file mode 100644
> index 0000000000..27a540bf61
> --- /dev/null
> +++ b/package/libglib2/0003-disable-building-docs.patch
> @@ -0,0 +1,38 @@
> +From f3b8515471aaa452f06d84da68372fcead8637d2 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 24 Apr 2023 11:52:24 -0700
> +Subject: [PATCH 1/1] disable building docs
> +
> +If rst2html5 is installed on a host system, meson will attempt to build
> +html5 documentation from the docs directory, resulting in the following
> +error:
> +
> +/usr/local/bin/rst2html5.py
> +Traceback (most recent call last):
> +  File "/usr/local/bin/rst2html5.py", line 27, in <module>
> +    from docutils.core import publish_cmdline, default_description
> +ModuleNotFoundError: No module named 'docutils'
> +
> +Since we don't need, nor want to build the documentation, remove the docs
> +subdirectory from being built entirely.
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +---
> + meson.build | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 0cbc968..28e1147 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -2442,7 +2442,6 @@ if get_option('man')
> + endif
> +
> + gnome = import('gnome')
> +-subdir('docs/reference')

As far as I read the meson.build files all actions in docs/reference
are protected by the options 'gtk_doc' or 'man', is disabling this
ones not enough?

Regards,
Peter

> +
> + summary({
> +   'host cpu' : host_machine.cpu_family(),
> +--
> +2.40.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
