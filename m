Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A647C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 14:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29D45404F1;
	Sun,  7 Aug 2022 14:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29D45404F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXbB9ctLtLf2; Sun,  7 Aug 2022 14:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34D9B404C7;
	Sun,  7 Aug 2022 14:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34D9B404C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B60B61BF307
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D20D60ADF
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D20D60ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68rg2EBKOoVM for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 14:53:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F6560736
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08F6560736
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 14:53:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD8191BF204;
 Sun,  7 Aug 2022 14:53:01 +0000 (UTC)
Date: Sun, 7 Aug 2022 16:53:00 +0200
To: Emile Cormier <emile.cormier.jr@gmail.com>
Message-ID: <20220807165300.2137b391@windsurf>
In-Reply-To: <20220403221953.1158787-3-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-3-emile.cormier.jr@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659883982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMUSDYtAnQG7DKzTBNWA+nNTj3DmnyojMWgiUi9l8kw=;
 b=OvJTzgCjXfeaaVk5rLTQEQQBBw/1RmITC2WjyWwbqyKMP+tf5+deV3C9JnV+ilfCY0uVUz
 MGmTV8qtc6TwHPQFF6VF51MILCJUhQp0mCdtryY5BOidCezbHignA5+LH4+mujp5xCd4AG
 6DK9cwYVGkhYGHPe8cmQvWljhjbF/8gff7n2vvinYGffmnsB5JcxHLphzHzKJ22Ex0qRYC
 rEHBPcQkWF37vURubjKt9ylIgc7PdRNCo6qvRoBQ76EMa5h1OmhVy7pa5CXBSQQP4HCIeJ
 ibMPEA6q2tQDk6cBJw0/9qBKDGrx59XSAt2Qi6srrhhm5aocoWSa598F3RdDcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OvJTzgCj
Subject: Re: [Buildroot] [PATCH 3/6] package/python-zlmdb: add new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Emile,

I have also applied this patch, though with some changes. See below.

On Sun,  3 Apr 2022 19:19:50 -0300
Emile Cormier <emile.cormier.jr@gmail.com> wrote:

> From: ecorm <ecorm@users.noreply.github.com>

I fixed this bogus From: value.

> 
> Required by python-crossbar.

Added an empty new line here.

> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
> ---
>  DEVELOPERS                             |  5 +++++
>  package/Config.in                      |  1 +
>  package/python-zlmdb/Config.in         | 16 ++++++++++++++++
>  package/python-zlmdb/python-zlmdb.hash |  5 +++++
>  package/python-zlmdb/python-zlmdb.mk   | 14 ++++++++++++++
>  5 files changed, 41 insertions(+)
>  create mode 100644 package/python-zlmdb/Config.in
>  create mode 100644 package/python-zlmdb/python-zlmdb.hash
>  create mode 100644 package/python-zlmdb/python-zlmdb.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a66b9d7eee..7f04663077 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -746,6 +746,11 @@ N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
>  F:	package/bayer2rgb-neon/
>  F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
>  
> +N:	Emile Cormier <emile.cormier.jr@gmail.com>
> +F:	package/python-autobahn/
> +F:	package/python-crossbar/
> +F:	package/python-zlmdb/

Reduce this to just adding package/python-zlmdb/. Entries for existing
packages should be added in a separate commit.

> diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
> new file mode 100644
> index 0000000000..9eaab3a7a7
> --- /dev/null
> +++ b/package/python-zlmdb/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_PYTHON_ZLMDB
> +	bool "python-zlmdb"
> +	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
> +	select BR2_PACKAGE_PYTHON_CFFI # runtime
> +	select BR2_PACKAGE_PYTHON_CLICK # runtime
> +	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
> +	select BR2_PACKAGE_PYTHON_LMDB # runtime
> +	select BR2_PACKAGE_PYTHON_NUMPY # runtime

This one has some depends on that we need to replicate.

> +	select BR2_PACKAGE_PYTHON_PYNACL # runtime
> +	select BR2_PACKAGE_PYTHON_PYYAML # runtime
> +	select BR2_PACKAGE_PYTHON_TXAIO # runtime
> +	help
> +	  Object-relational zero-copy in-memory database layer for
> +	  LMDB.
> +
> +	  https://github.com/crossbario/zlmdb

So the final Config.in file looks like this:

config BR2_PACKAGE_PYTHON_ZLMDB
        bool "python-zlmdb"
        depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
        depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
        select BR2_PACKAGE_PYTHON_CBOR2 # runtime
        select BR2_PACKAGE_PYTHON_CFFI # runtime
        select BR2_PACKAGE_PYTHON_CLICK # runtime
        select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
        select BR2_PACKAGE_PYTHON_LMDB # runtime
        select BR2_PACKAGE_PYTHON_NUMPY # runtime
        select BR2_PACKAGE_PYTHON_PYNACL # runtime
        select BR2_PACKAGE_PYTHON_PYYAML # runtime
        select BR2_PACKAGE_PYTHON_TXAIO # runtime
        help
          Object-relational zero-copy in-memory database layer for
          LMDB.

          https://github.com/crossbario/zlmdb

comment "python-zlmdb needs glibc or musl"
        depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
        depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)

Another thing that this package really needs is a test case, in
support/testing/tests/package/. I was trying to look for some
documentation, but apart from a pretty obscure reference document that
doesn't have much explanations, I couldn't find anything.

Do you have some simple example on how to use zlmdb? This would allow
us to add a test case for this package that has a lot of runtime
dependencies.

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
