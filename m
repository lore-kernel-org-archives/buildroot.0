Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDF2E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 18:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 300EF403C3;
	Tue,  7 Jan 2025 18:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IR1XA4CqriAS; Tue,  7 Jan 2025 18:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 111D9403D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 111D9403D2;
	Tue,  7 Jan 2025 18:18:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F7777AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 18:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D942811FD
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 18:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvXSuiUCIyOM for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 18:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 681CC811FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 681CC811FF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 681CC811FF
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 18:18:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7FA0160134;
 Tue,  7 Jan 2025 19:18:41 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56322])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Jan 2025 19:18:41 +0100
MIME-Version: 1.0
Date: Tue, 07 Jan 2025 19:18:41 +0100
From: Julien Olivain <ju.o@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Semyon Kolganov <semenak94@mail.ru>
In-Reply-To: <20250106105220.918014-1-buildroot@heine.tech>
References: <20250106105220.918014-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.9
Message-ID: <76e3c877d5b42f95394eeb7e7e1dc020@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736273923;
 bh=poxV+mwRqMVFmJn+noiwFt/lu0P8hGPfTfSdaMqyLRc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PfFvrlEU2HRUA4DiQoGT1FwQ3VdDKmRBQpOAdslTsB627G+OqE6x6Na25wy4Bg1n0
 OkvUg+W1MV00kP7YDOI6sEaBiUJ6Dp09v4OznQkgXnjJfByoB1xjaF2RVqGDJFb9OY
 ZQczN9E+RmqlN7s9gkNsSLlq9O8bcaCeh/DqM1YG8nB3cZXRiRP4r/b62D0pT2IuQ0
 OGHp0C0KbmzfzZr6BGPg1kavL6WvpcNo1fSzXK/l3qBpoLGXFi4rJ+CVJ0B+y06VX9
 wMBG0NNNKOteWQH62HGWI6b1gvZtPzf4yUxk9RFR1o/CTAaNIw3uDkurxZyI7k/pRr
 RR4Xo73OCSVgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PfFvrlEU
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 11.1.1
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

Hi Michael,

Thanks for the patch!

In the future, when a release note or change log is available,
could you add it in the commit log please? For example:

"""
For change log since version 11.0.2, see:
https://github.com/fmtlib/fmt/releases/tag/11.1.0
https://github.com/fmtlib/fmt/releases/tag/11.1.1
"""

On 06/01/2025 11:52, Michael Nosthoff via buildroot wrote:
> -FMT_VERSION = 11.0.2
> +FMT_VERSION = 11.1.1

Also, this fmt bump to 11.1.1 alone seems to break other packages
using it. For example see the runtime tests:

     utils/docker-run support/testing/run-tests \
         -k -d dl -o output_folder \
         tests.package.test_gnuradio
     tail -50 output_folder/TestGnuradio-build.log

and

     utils/docker-run support/testing/run-tests \
         -k -d dl -o output_folder \
         tests.package.test_mariadb
     tail -20 output_folder/TestMariaDB-build.log

I tested with this patch applied on branch master at
commit 5d7ab60.

Could you investigate those build failures please?

You can check for fmt user package with:

     git grep -F 'select BR2_PACKAGE_FMT' package/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
