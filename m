Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E86606A32A
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 01:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nGW2QxoN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC54B80FB4;
	Tue, 10 Nov 2026 01:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8T79LaTJL9sc; Tue, 10 Nov 2026 01:39:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1F81580D1A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794274789;
	b=b+oL3TAkeNq8ih5E0NwljZPunXv2EpYi8dW/ucG3p3XevfGzkD/QMGW/O+3TkaNtgBYS
	 H/nGJB3m6wPCioHTqCvqI8v3JsGRyn8ldcLbPo2DxUrUJxRIf9AEag8axp3naDaQuHl87
	 CEi7hR9AF53L8luXyvVVpA/z5y+ULyPp/wacyCUBa6s7tcqmdtnoT/OXqHVyPFgj/y0CP
	 YJVJ3LiCpTvil9j380j3r+k20DQHaZ/bj9nLg3Uczxm50KMJbDKTDwzwNlb+5EOoHP/uR
	 cBAeb1OHQ6iNyj8lDy2GibQzmCJ379aJ9j8TWnTTZnEcs3Oz93xC4+ZLESBi1/R7Lzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794274789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3MQhab1XO9jaJx9pSmPMn0ouFNFLZj6FKGKbvveZnKs=;
	b=Slq1XZT8CzbqcXHeCZnu98NCAk4PeIB8a1P9taBGmWvj12VXAAvRndd+ypZzYQvy8dpw
	 N4fCbVOBXc39P1f/vsglxgc9Vz1Jnx6jpKrRkQFx0jj4x9CBFpy3G3z6hsY7bpVpLIlgm
	 A1kilxjRZh/c+ZNcjKs3SAY1zNn27m0IZdlMZxo1k4HlHpTZceaFE2+9sDY7eTqeOmO3m
	 oGbBUVdTg3Vq9g8eZ07oBEsxeObGkwEZrhRj7X6F3BvjchRIyAFPaXnb1zUFyEvhT0wFE
	 uGPMYdmxLo1BO4ybXATS6oLHLl7slAMYXuvIqeZPGeyNWQA9q/sLPcQVbQSjrsqVflw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794274789;
	bh=3MQhab1XO9jaJx9pSmPMn0ouFNFLZj6FKGKbvveZnKs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nGW2QxoNZ0f2kRib0W0ynuX3OM0vkVjqgp/l/b9oWcphjI9y/bxV/YRsG3YyPhsLN
	 sY4bvlLsTCiRn5z+HJfGPdYOJAH7mv1UHoChlntYaSX2L/IJQq/ry0ynQhO6aDNNrY
	 gA87/RD4RJQVwPC6+hT0akPCfOGyO2H4WfqOnKXzH7t+ncArvaY53RUaNhhBxR2QjM
	 B5bQ1Ck2NPM/gwJzCYTBP1A94u4jzhyuv+17sSUv+zKZ2jxirNVMQ7FYz+PJ2iwDoO
	 jV1XMq3nmuNQIUdUviskorPIoGo8mNOS67uWR1uu0QD7IaNBfHmvNM8qJMf14KGdbj
	 LRfKJhnH1V9CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F81580D1A;
	Tue, 10 Nov 2026 01:39:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51D76CC4
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 01:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F0B760755
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 01:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41p9nG6yyHeI for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 01:39:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1E8466070F
X-Greylist: delayed 402 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Nov 2026 01:39:45 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E8466070F
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 01:39:44 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5E5172C82189;
 Tue, 10 Nov 2026 02:33:00 +0100 (CET)
Message-ID: <2ddcb597-c667-42be-8ccd-66f51ce9e382@bubu1.eu>
Date: Tue, 10 Nov 2026 02:32:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
References: <20261109183317.1852200-1-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20261109183317.1852200-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/zstd: disable optional
 compression libraries for host build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

On 11/9/26 19:33, James Hilliard wrote:
> host-zstd auto-detects system zlib, liblzma and liblz4. Updating the
> build host's LZ4 to 1.11.0 breaks compilation due to the removed
> contentChecksum_t alias, even with an unchanged Buildroot tree.
> 
> Disable these unused codecs to avoid undeclared host dependencies.
> 
> https://github.com/meta/zstd/issues/4897
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
I hit this as well, but didn't get around yet to send the fix :).

Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
