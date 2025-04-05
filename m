Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BD7C36010
	for <buildroot@archiver.kernel.org>; Sat,  5 Apr 2025 16:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89DDE81EE6;
	Sat,  5 Apr 2025 16:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tygcOYplKkSJ; Sat,  5 Apr 2025 16:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA05F81EFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA05F81EFC;
	Sat,  5 Apr 2025 16:01:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8AA81C7
 for <buildroot@buildroot.org>; Sat,  5 Apr 2025 16:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ACF9408E9
 for <buildroot@buildroot.org>; Sat,  5 Apr 2025 16:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zq6ZU-ZWixGd for <buildroot@buildroot.org>;
 Sat,  5 Apr 2025 16:01:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB19B400CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB19B400CC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB19B400CC
 for <buildroot@buildroot.org>; Sat,  5 Apr 2025 16:01:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 82CE260134;
 Sat,  5 Apr 2025 18:01:34 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54200])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Apr 2025 18:01:34 +0200
MIME-Version: 1.0
Date: Sat, 05 Apr 2025 18:01:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250404203030.2805323-1-giulio.benetti@benettiengineering.com>
References: <83efa708da680e88394c89f786e661be@free.fr>
 <20250404203030.2805323-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <0f1fe64ff6cf8f3ad3369a82540da552@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743868895;
 bh=3oueojAIUu0F7jK/n1q03w9kzEcWCMWUGItKFKDCfsU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p5++FKh4E5ZWRLXOQ0hswPTjt9IqVhfhlOviJlp4mqQWdthe/14kqcj3VN2CL8vjm
 hHXjIhzOHR0ZDOUQqnzLbx8TPSjxozgh3En2sjHX2+MuD5w8e2YItRz53Twxb2I0KG
 0jHRGCeUtpn6/6BKCxsI+MUpzL9T/mA4J50XaNQbiB7EzFujgjnefIEgpntPO+gaO3
 8vldbiHhsK3XqnhVjtH6zunzgnkUJevXQ85weF+PNmNnHxZEsweVWxP1C4zvDxiX97
 WP4F3HG/MhYqHYCaaxlcXpEdVE6HLThIeLBFZT8vYV4eBhheOAsTOrnSZxp4QseJsl
 JqL8DpNnr/cbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p5++FKh4
Subject: Re: [Buildroot] [PATCH v3] package/libfuse3: bump to version 3.17.1
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

On 04/04/2025 22:30, Giulio Benetti wrote:
> Release notes:
> https://github.com/libfuse/libfuse/releases/tag/fuse-3.17.1
> 
> Add 2 local patches pending upstream, one to fix build with linux 
> version
> < 5.9 and one to fix presence checking of static_assert() on C++ 
> version <
> 11. Let's also fix a linker failure due to missing -latomic if 
> toolchain
> has atomic.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
