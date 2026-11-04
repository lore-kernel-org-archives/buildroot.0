Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE315606A331
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l88ANto4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B5B380BDB;
	Wed,  4 Nov 2026 17:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOP5s7pZc5Qt; Wed,  4 Nov 2026 17:21:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D3F9E80BEA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812881;
	b=QGZkrV+y2FzxbxMxr7VU4kjCNDtTeQuFCT51CaAalqoiEoulvp1V5Xlv9FAj4T6HNHIh
	 QDwFAZcYvsW3+cFpE9AHI+rfwLyrKm5+qwp+gekKGVAi3nG7Etr31YLKm0a+GC4HIog6J
	 gioikdsVlfIVwXOtXbvujJ3HiAKmTjXnzsNvZ9HttNslfNrFDytDdkIl9143r+9EMay2p
	 nxsY+u+68N+chdE7MKHgwOfHO4gs/YS4mtmCIz5CkWboS2/u50q7XnloTYeuYLJIZQWi4
	 TGR/UaY5D6IU8Rcy6nq9vq9BHuwdh05okA32cm/rsM5CmwW5N0/yJX4BGSfTxGsUOyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=2UwFInu2LTxSj43znLz5kTfcyPV097cYbbTiqGo5GtQ=;
	b=NZFrayKKhcVg+g87/I+/PsrXiqW22lDT0Ik2V1lj0nehANrcdCma3/N7coOa2AT9Y0hX
	 jQfkUtgYMQIaLUnF3E0Shiqwr+yLjkOJozD9yLkQ/wgPmjAaJMjpqV2HI/iuxePBXQaAA
	 7gRn6OuZACOhf7I0VWPPn5U5p0u/2FqIRLL9Lu8xEehSBmzUw+JzZmyq+yqbuj+UxK6jT
	 +hN3PdumroWaflkJZukqNu4jmVq5968M29f9EcLG8u0TPn8YG6xoxmlicbyE1fdxpURFu
	 j1tQ4JgSIIFtnCncgR+a4ml51AwztzVjhG57/mKpRfSlGdwp1sf8oTW2tzewNnm6S3Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812880;
	bh=2UwFInu2LTxSj43znLz5kTfcyPV097cYbbTiqGo5GtQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l88ANto4zQHM8BmM5ydMAvTgd9nfNlYb3mg7t8sJSdCm7HQQclekb0VN9oiCkm/eW
	 xxWzB90TiZHlpHY5ZMZcb9/vXoszMARs75ZDFRNvaXNoGgLKlagZT4/5EJH1ykRlp/
	 uH2Lb4v9T8q607c3Ts7RiDPGjnK87ehzZHE+d5s89L+hFrmVbG4nnnRSeQnwDK2viL
	 KdYOeVotFeYKeE+pO8l5lTmtwNblLhhx3VnMoNIkY5HixGQ0eIU7GeMD6ZJrg/rsop
	 bI0S1GJnmaLkTZKJ+oaZexjO8HFbv299QmzWkuETCWTJp0DrSP1vz56kYYmTSFj7B8
	 fKQpXS6dDAlaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F9E80BEA;
	Wed,  4 Nov 2026 17:21:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D95F7411
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAE8B40211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKRP5uWkSJ51 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:21:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3FD7640062
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FD7640062
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:21:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D8C2619F574;
 Wed,  4 Nov 2026 18:21:14 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 18:21:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:21:14 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261102201145.11099-1-bernd@kuhls.net>
References: <20261102201145.11099-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <bc7028e8f64f48830c2e26414ae89f1b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 21:11, Bernd Kuhls wrote:
> https://github.com/strukturag/libheif/releases/tag/v1.23.7
> 
> v1.23.7 is a security and bugfix release. It is ABI- and API-compatible
> with v1.23.6 and is a drop-in replacement.
> 
> Fourteen of the fixed issues are rated high, so all users are advised 
> to
> upgrade.
> 
> Fixes the following CVEs:
> 
> (CVE numbers will be added when assigned.)
> 
> CVE-2026-XXXXX (GHSA-xwcv-cp39-m2w4)
> CVE-2026-XXXXX (GHSA-jx54-6rm6-2cgj)
> CVE-2026-XXXXX (GHSA-fpr5-xpfr-vcq3)
> CVE-2026-XXXXX (GHSA-35mc-3887-rr37)
> CVE-2026-XXXXX (GHSA-hpg4-g2gc-pq42)
> CVE-2026-XXXXX (GHSA-9rpf-2x22-78m9)
> CVE-2026-XXXXX (GHSA-48p4-gj45-w9v6)
> CVE-2026-XXXXX (GHSA-2g6j-vhr6-6wrj)
> CVE-2026-XXXXX (GHSA-7qm8-hj35-269r)
> CVE-2026-XXXXX (GHSA-hhg3-fxg7-3gxw)
> CVE-2026-XXXXX (GHSA-73j7-gvm9-x8q6)
> CVE-2026-XXXXX (GHSA-74mj-m37q-h3q9)
> CVE-2026-XXXXX (GHSA-rcqc-842v-m26h)
> CVE-2026-XXXXX (GHSA-pfcm-ffqg-84hx)
> CVE-2026-XXXXX (GHSA-gff5-3vgr-p8h2)
> (GHSA-r9cg-w542-g7hj)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
