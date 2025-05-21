Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0D9C54E71
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 19:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4449B80CFF;
	Wed, 21 May 2025 19:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNMHWgGz3g2X; Wed, 21 May 2025 19:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 466D2801DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 466D2801DA;
	Wed, 21 May 2025 19:07:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4585758
 for <buildroot@buildroot.org>; Wed, 21 May 2025 19:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA016405DD
 for <buildroot@buildroot.org>; Wed, 21 May 2025 19:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YD2uwf-iumwB for <buildroot@buildroot.org>;
 Wed, 21 May 2025 19:07:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5715404D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5715404D4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5715404D4
 for <buildroot@buildroot.org>; Wed, 21 May 2025 19:07:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 50B9113F88F;
 Wed, 21 May 2025 21:07:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 21 May 2025 21:07:13 +0200
MIME-Version: 1.0
Date: Wed, 21 May 2025 21:07:13 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 thomas.perale@mind.be
In-Reply-To: <20250519150314.4117224-1-titouan.christophe@mind.be>
References: <20250519150314.4117224-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <e8e97e2086c469e0c1b93d6455f6991c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747854436;
 bh=I+LnWsLc+N0y731Ds9SY0xhPm+MrolbIbDIF9bZxfhk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LPXThSXh5U+MWYN1dMkxuAdZOL1w/n9Xs3Hu6wAltwoXIiFhIjj9AGV+uMp3rWQNa
 MU+DMD9b3ToM2HPMcOPbBMbhC4ob1QTTtAy8vJ0e+QvGTbULLBAhcbkTGt2RTZbu0W
 NaApoiJejArYXz2aP2/HbHLh9ydPFgZ4hUXZmq2/a50EWL05cOLhGcjSpDHMuPQEf4
 uNacgoPdgiLIGqqgzZGd2eICJabHaYL8vWVyvpE5lhHKXR+8G5yo1tTIjmKasPILAf
 UiVA2s80DSObOpRfFQO+noEUU9ntgOFr49YPanYPdFm+b3qPbTw0C33APrD3AGDgky
 O8+ln9c7hTDvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LPXThSXh
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-tornado: apply
 security patch for CVE-2025-47287
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

Thanks for the patch.

Unfortunately, the package patch is not applying as is. See below.

On 19/05/2025 17:03, Titouan Christophe via buildroot wrote:
> This fixes the following CVE:
> - CVE-2025-47287: When Tornado's ``multipart/form-data`` parser 
> encounters
>                   certain errors, it logs a warning but continues 
> trying to
>                   parse the remainder of the data. This allows remote
>                   attackers to generate an extremely high volume of 
> logs,
>                   constituting a DoS attack.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
> The patch herebelow is an alternative to the version bump of 
> python-tornado
> v6.4.2 -> v6.5 proposed in my previous email
> (https://lists.buildroot.org/pipermail/buildroot/2025-May/779833.html).
> Indeed, we may not want to perform a minor version bump of that package 
> in
> Buildroot LTS 2025.02.x; otherwise simply ignore this patch
> ---
>  ...l-raise-errors-instead-of-logging-in.patch | 234 ++++++++++++++++++
>  package/python-tornado/python-tornado.mk      |   3 +
>  2 files changed, 237 insertions(+)
>  create mode 100644 
> package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
> 
> diff --git 
> a/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch 
> b/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
> new file mode 100644
> index 0000000000..ee8942ea6d
> --- /dev/null
> +++ 
> b/package/python-tornado/0001-httputil-raise-errors-instead-of-logging-in.patch
> @@ -0,0 +1,234 @@
> +From cc61050e8f26697463142d99864b562e8470b41d Mon Sep 17 00:00:00 2001
> +From: Ben Darnell <ben@bendarnell.com>
> +Date: Thu, 8 May 2025 13:29:43 -0400
> +Subject: [PATCH] httputil: Raise errors instead of logging in
> + multipart/form-data parsing
> +
> +We used to continue after logging an error, which allowed repeated
> +errors to spam the logs. The error raised here will still be logged,
> +but only once per request, consistent with other error handling in
> +Tornado.
> +
> +Upstream: 
> https://github.com/tornadoweb/tornado/commit/b39b892bf78fe8fea01dd45199aa88307e7162f3
> +
> +CVE: CVE-2025-47287
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + tornado/httputil.py             | 30 +++++++++++-------------------
> + tornado/test/httpserver_test.py |  4 ++--
> + tornado/test/httputil_test.py   | 13 ++++++++-----
> + tornado/web.py                  | 17 +++++++++++++----
> + 4 files changed, 34 insertions(+), 30 deletions(-)
> +
> +diff --git a/tornado/httputil.py b/tornado/httputil.py
> +index 7044aca02..ef460985e 100644
> +--- a/tornado/httputil.py
> ++++ b/tornado/httputil.py
> +@@ -34,7 +34,6 @@
> + from urllib.parse import urlencode, urlparse, urlunparse, parse_qsl
> +
> + from tornado.escape import native_str, parse_qs_bytes, utf8, 
> to_unicode
> +-from tornado.log import gen_log

Running the command:

     make python-tornado-patch

fails here with output:

     >>> python-tornado 6.4.2 Patching

     Applying 0001-httputil-raise-errors-instead-of-logging-in.patch 
using patch:
     patching file tornado/httputil.py
     Hunk #1 FAILED at 34.
     ...

Could you send an updated patch addressing this issue, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
