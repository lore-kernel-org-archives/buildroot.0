Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA05C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 07:56:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8041B60EC0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 07:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8041B60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B8F3613A5;
	Wed, 22 Sep 2021 07:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUOcZplhMMOp; Wed, 22 Sep 2021 07:56:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8EAF613A9;
	Wed, 22 Sep 2021 07:56:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D31BA1BF59D
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 07:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C36B9613A9
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 07:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYwz04w58SZZ for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 07:56:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B638613A5
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 07:56:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD61D1814B9; Wed, 22 Sep 2021 09:56:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1632297411; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=KMb90bwxJVuBLriOiTDS9FxKM1/pueBQ6kDE3vD5PrM=;
 b=nDqdCz+KgB0gXIYP4Pr5Acw9j7npndO4F796Vu/7qJJdHxBwxsQKyFMQmxiWixas4k8RJe
 ZThk/VmesTZVWZK6s9KWihUyR/O4Qyke6VnUS66u5ZgdsJQoogx4j6u1wl7vzufJn/OzAn
 cDg11/wA8n9QYXWXqbrTDhkgwGtCxzw=
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210922065707.440894-1-james.hilliard1@gmail.com>
Message-ID: <24f90dee-41b4-5f42-99f6-4a9a35324143@heine.tech>
Date: Wed, 22 Sep 2021 09:56:47 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922065707.440894-1-james.hilliard1@gmail.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to
 version 3.18.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@lists.buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi,

On 22.09.21 08:57, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/protobuf/protobuf.hash               | 2 +-
>   package/protobuf/protobuf.mk                 | 2 +-
>   package/python-protobuf/python-protobuf.hash | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> index 2a65156cb3..777f19d6b9 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
>   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -sha256  51cec99f108b83422b7af1170afd7aeb2dd77d2bcbb7b6bad1f92509e9ccf8cb  protobuf-cpp-3.17.3.tar.gz
> +sha256  7308590dbb95e77066b99c5674eed855c8257e70658d2af586f4a81ff0eea2b1  protobuf-cpp-3.18.0.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index fa8ea890e2..bb9c6bf37c 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,7 +7,7 @@
>   # When bumping this package, make sure to also verify if the
>   # python-protobuf package still works and to update its hash,
>   # as they share the same version/site variables.
> -PROTOBUF_VERSION = 3.17.3
> +PROTOBUF_VERSION = 3.18.0
>   PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
>   PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
>   PROTOBUF_LICENSE = BSD-3-Clause
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> index 8eca476884..e9a5ac4904 100644
> --- a/package/python-protobuf/python-protobuf.hash
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  3253c6d17ec0bb6f6382e555cf5ca0a9ffab8d81b691f100f96ce9f5e753018e  protobuf-python-3.17.3.tar.gz
> +sha256  4f792034070915819065c162a310142d66835333824e2e0a2ca26ed54b013408  protobuf-python-3.18.0.tar.gz
>   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE

 From the Release Notes:

Python
* Drops support for 2.7 and 3.5.

So I guess we should add a
depends on BR2_PACKAGE_PYTHON3
to package/python-protobuf/Config.in


Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
