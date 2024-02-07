Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA54C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EDDC8138A;
	Wed,  7 Feb 2024 17:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixZ74g_xIvzx; Wed,  7 Feb 2024 17:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E0CD81392
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E0CD81392;
	Wed,  7 Feb 2024 17:39:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 495671BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3727660A65
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUbuaikz3TV7 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:39:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F89C607F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F89C607F0
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F89C607F0
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:39:41 +0000 (UTC)
Received: from [172.18.252.108] (ip-185-104-138-44.ptr.icomera.net
 [185.104.138.44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8E6F92C83776;
 Wed,  7 Feb 2024 18:39:32 +0100 (CET)
Message-ID: <e09ad3db-7012-4e52-afc4-bbc4ceda8d4e@bubu1.eu>
Date: Wed, 7 Feb 2024 18:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
 <20231126180840.2081945-3-james.hilliard1@gmail.com>
 <9dcac81b-522c-4ea3-80ed-7d9544cea12f@bubu1.eu>
 <20240207112058.37534f3d@windsurf>
In-Reply-To: <20240207112058.37534f3d@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707327579; bh=3C+Ui/z3xWwcWMGFwwWG/mhv6+mboq1iQ8fd72NyTNI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=O4xYiY6ISB2r1U8MJieKmE32qMWVJXE/KV5CCSvfWmYBiZpjsywGEXNCvANyv61y0
 LBTaNOion61foMkc0Q5PbWya3IqsncEaQ9ztSmXKBLslLPCJ0ZOvFPBhqSpE1kGako
 fWEApFKDOzzD3j/MMkcny8X0B17Nqt1r1olrYxmCm4IXCmW7EPnl2wfPo3KDcI3a8k
 Z5JN6TbtQyN3AFNUckWUb5IPbdeXbxL6qTWqz2OQvThEIhMuIHL0rkmcPHbTqhLNEO
 cT1FTE1H/5v0ahdgBdVGxNK/8kF/yq8g0HNQw+HZL9irYLjp7fmPYx1k+4MxPdB581
 j/UpovnTTBf6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=O4xYiY6I
Subject: Re: [Buildroot] [PATCH v6 3/5] package/python-msgpack: add host
 cython dependency
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07.02.24 11:20, Thomas Petazzoni via buildroot wrote:
> On Wed, 7 Feb 2024 11:16:27 +0100
> Marcus Hoffmann <buildroot@bubu1.eu> wrote:
> 
>> Unfortunately msgpack 1.0.7 which buildroot has now requires cython ~3.0
>> [1], which we don't have yet. cython 3.0 and cython 0.29.x (which uvloop
>> still uses) also seem to be still developed in parallel. So maybe we
>> need both as build host packages? Or do you see another solution?
> 
> If we were to have both in parallel, then the big question is whether
> it is possible to install them both in parallel without them
> conflicting with each other.

They would conflict and there's no easy way to avoid that AFAIK.

I think the best path forward is upgrading to cython 3.0 and passing the 
language_level=2 compatibility option[1], which seems to restore the 
0.29.x behavior? I've yet to understand how to pass this option for a 
pep517 build though.

uvloop at least also has a pending MR to support cython 3 directly [2] 
but we have a bunch of other packages depending on cython.

[1] 
https://cython.readthedocs.io/en/stable/src/userguide/migrating_to_cy30.html#python-3-syntax-semantics
[2] https://github.com/MagicStack/uvloop/pull/587/files
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
