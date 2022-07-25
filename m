Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03BCC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 21:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B4C44196E;
	Mon, 25 Jul 2022 21:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B4C44196E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsJ0WcaWut74; Mon, 25 Jul 2022 21:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF59641929;
	Mon, 25 Jul 2022 21:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF59641929
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9B91BF2FB
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 21:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4705083434
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 21:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4705083434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gj7hZVOQ6IiN for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 21:22:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD3A6833CD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD3A6833CD
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 21:22:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp2-g21.free.fr (Postfix) with ESMTP id 068B42003C1;
 Mon, 25 Jul 2022 23:22:51 +0200 (CEST)
Received: from 37-164-48-118.coucou-networks.fr ([37.164.48.118])
 by webmail.free.fr
MIME-Version: 1.0
Date: Mon, 25 Jul 2022 23:22:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
In-Reply-To: <20220721104733.3603090-1-buildroot@heine.tech>
References: <20220721104733.3603090-1-buildroot@heine.tech>
Message-ID: <0df51f09ec27a5e7a454d6d71f53ecbf@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658784172;
 bh=xq3wBPdvcUu/kIRNd/qGZ+jkvZPFFFRzJBmkybBOZWk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DY9uBAwETwYKGl7LFK5zch7lhgKg7YuNjFlAtrwl4jDzcswfvpP2dVcMsTSusOjD+
 8nVGx8RGX7kMJsragFZbwt/oolsfh/J41dnwiUUbn31W7V9Lp80/BNNYvPBvxbWsiM
 YC0neKwykodEPcf80f9aPTrBUGIh24xdS795JgXYyuUBKmFqQCKqjFtWnfEQN4Etnq
 auEMX9uqDFihBN7zshHfUvj4hXGSsWFe6ci11JW/HEzp/naSYIan38YryNQ0eNzQA4
 3QQzxNO4thMQcBhukth+yXyV0AXpfdi41blF8zuJf6WG/giAY36v9VBvHFcziAwkzL
 1vbz55TiQNToQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DY9uBAwE
Subject: Re: [Buildroot] [PATCH] package/{python-}protobuf: bump to version
 21.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


   Hi Michael, All,

I successfully runtime-tested this patch in qemu_aarch64_virt_defconfig 
with
ola client commands and Python3 RDM discovery.  I'll try to make a 
runtime
test for this.

On 21/07/2022 12:47, Michael Nosthoff via buildroot wrote:
> protobuf changed its versioning scheme [1]. The Release version is now 
> only
> the Minor.Patch version of the language specific version.
> 
> C++ stays on version 3, but python got bumped to 4. So the handling in 
> the .mk
> files changed to reflect that.
> 
> [1] https://developers.google.com/protocol-buffers/docs/news/2022-05-06
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Tested-by: Julien Olivain <ju.o@free.fr>

> ---
>  package/protobuf/protobuf.hash               | 2 +-
>  package/protobuf/protobuf.mk                 | 6 ++++--
>  package/python-protobuf/python-protobuf.hash | 2 +-
>  package/python-protobuf/python-protobuf.mk   | 3 ++-
>  4 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/package/protobuf/protobuf.hash 
> b/package/protobuf/protobuf.hash
> index f37b2dee40..1006fd3d64 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256
> 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d
> LICENSE
> -sha256
> dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9
> protobuf-cpp-3.20.1.tar.gz
> +sha256
> c98a4f17ed57e9e4dafc4a52e76ee012f9a6a13750488b20b4c370a3eb1561fc
> protobuf-cpp-3.21.3.tar.gz
> diff --git a/package/protobuf/protobuf.mk 
> b/package/protobuf/protobuf.mk
> index c4c33ba7da..5c08421bbc 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,9 +7,11 @@
>  # When bumping this package, make sure to also verify if the
>  # python-protobuf package still works and to update its hash,
>  # as they share the same version/site variables.
> -PROTOBUF_VERSION = 3.20.1
> +PROTOBUF_VERSION_MAJOR = 3
> +PROTOBUF_VERSION_MINOR = 21.3
> +PROTOBUF_VERSION = ${PROTOBUF_VERSION_MAJOR}.${PROTOBUF_VERSION_MINOR}
>  PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
> -PROTOBUF_SITE =
> https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
> +PROTOBUF_SITE =
> https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION_MINOR)
>  PROTOBUF_LICENSE = BSD-3-Clause
>  PROTOBUF_LICENSE_FILES = LICENSE
>  PROTOBUF_CPE_ID_VENDOR = google
> diff --git a/package/python-protobuf/python-protobuf.hash
> b/package/python-protobuf/python-protobuf.hash
> index ddfa48b491..06ec32c5b5 100644
> --- a/package/python-protobuf/python-protobuf.hash
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256
> d3449b4df32ca155f8cd71051db916b2bf74cc925760e269c0acf09b48ec1cb8
> protobuf-python-3.20.1.tar.gz
> +sha256
> ab5cda843c1fa2a34c5cdd30b65ae8bd148d8063e7f1b2bfe7daf23e763b0ff2
> protobuf-python-4.21.3.tar.gz
>  sha256
> 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d
> LICENSE
> diff --git a/package/python-protobuf/python-protobuf.mk
> b/package/python-protobuf/python-protobuf.mk
> index b91ba49339..8c21779faf 100644
> --- a/package/python-protobuf/python-protobuf.mk
> +++ b/package/python-protobuf/python-protobuf.mk
> @@ -4,7 +4,8 @@
>  #
> 
> ################################################################################
> 
> -PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
> +PYTHON_PROTOBUF_VERSION_MAJOR = 4
> +PYTHON_PROTOBUF_VERSION =
> $(PYTHON_PROTOBUF_VERSION_MAJOR).$(PROTOBUF_VERSION_MINOR)
>  PYTHON_PROTOBUF_SOURCE = 
> protobuf-python-$(PYTHON_PROTOBUF_VERSION).tar.gz
>  PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
>  PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
> --
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
