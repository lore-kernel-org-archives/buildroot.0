Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64366606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kL+AnbsI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38ADF81687;
	Sun, 25 Oct 2026 09:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blGojbKrzGcZ; Sun, 25 Oct 2026 09:51:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 47D1481656
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792921897;
	b=Ix4z9PdCuAJpTc4YbcGFkzIT4a7+7vB4V3q3Fwti2b/BorBmkoeKylCq2NrOXwHID18+
	 4OGLQVlzZGwun1Qw392KIvIc1xgRUGqHr84noiMco295sKpAuZiUotzOomUbUfAvueF10
	 9jCV+g3tN9SJ9TMejNKysdtKxhNcZMLJx7J2BBb5SRe1d4DCGTOCW/7qqnULMIem5oUcx
	 y7hC+V+Wii6ptCBMtyWK0inRN+oD7mPaedOExRTMV4UWcMpprhxz89ux2j3UOQf7cnyA7
	 9Bnwb9/MBMRgxCGh5k3YzonfyrI3It/VgUnJ8I8OSDeb2uxGLvLn8q+LgLAmC3vhcfA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792921897;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=/7yHCvwnW50yVi23KkdRUlxnzzLlYlYxzgFRnjlDXzA=;
	b=A4per1VNdXK1E8p4kRhVtxcek6mT5kQ373vSyDaDO8BjNNrvooluttQybs5MGVJGUXYm
	 9UxC0Mv82UUsXryhkg6LIZdjhwQFkkNeGNl0Rhd1HgQ2aFuaXIToJlN4kfXH8RYwHJIdh
	 SQxIUvrkzjXVgfmIfNA+0dV3EG1XcuZh8h/lcceCxxQ+84NUivqrwbD0b5m8humooXTOK
	 68ewTOFRuec7T82TjNrR3K/mRt8ASMXvTjJ4VdKJ8QJOaMUCI8zOu7lc4JblCSJuZM3o0
	 rRg0u1IaxlZGrqrnOVjSwSmGQ8jolAhhf0K0cyLe7yeMQdj+K4og6eD2ex+nJxcu/zw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792921897;
	bh=/7yHCvwnW50yVi23KkdRUlxnzzLlYlYxzgFRnjlDXzA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kL+AnbsIwCusl3PtuVVX925EyFw0sAbKoZs5GP5/UKUDibozTUpbHrkdR2A82lup0
	 fG/YoO56QyDeCIWC6mwp9KgXM5OBKWP2sPsg10T1LXst+/aG1kTVkAjO0cE2Eds6ku
	 SKNrePQ1Bd/fTP4IaqgWUwGNtf4Ky70VJyVgU0gTNnwIQ8TNC9Vt/s5g5zWWR+WdO1
	 D8X9hdFjNRJ4trcyH8SFsvRLpy6R8ZfFhwihuxVcdPbR4MFcjRMJspmFivIrzZGAiW
	 pmweCnXDu56y6DtIZ3YQqI5YdP1vfIXXehcIGJmhjXeJ6qOzaGiyDo9qGiEhiajH3m
	 u/V/iKH4SZmYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D1481656;
	Sun, 25 Oct 2026 09:51:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADDA02C7
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F80F60615
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1Q4KPhFXft5 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 09:51:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AA0576060E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792921895;
 b=oqfeDqRFHMmn5joSyQBzfJS0DjJpOERllcMJoloOkEBfcW02DzFfFDY+XZXzuRi0rFdW
 14QYjRSlIKjlsLpex2enbMEMPh/TWm3T4kB5ShFQU45VPaVH2QW9G7H3k+zmmPl44Ehhv
 TDLCRPXdOoysMdL25rKdNnNU4KAaq5sL7A3xaC6YWjxTwvkUqF+wyF7LBMA9EwOXGC1q+
 DvXJehDmyjI5VSE7BdDCMi1wlWv/qL6vxsO9YjpF3PwAAUE3rWsjLi52EZkxQVjPnXgbW
 5RLkt+Xf+h4+xTrwUrsvg2JSyXvNaNA8YR1P3Cxes0gipN4H8/lsMWNayPW2I9k0TAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792921895;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=v5hhfP0NA+fYyMN8MSgLpnz1hfXvW4e15mou9GXEB+k=;
 b=cEvA+cdMWPPZN+oPXIlytCxDanm1uUi8o6lw+IvcScluPAAbkPPInJtX3BG6ay2vLVOz
 IdY3HXTInZDJX1h6q+zureiIUEYajklA1YiBDPTri0AxA2njixhmYRXjB12Likt6mwjok
 y0hiPJzjKUBNHguWV/9HVw6910U7VSHkibkD/SqLT+rERaPHxsusfRGN30p7hB+QWNaqW
 mzSKabNT8NH0+QkdfCd9ZkgFmnOCrOmY5O07LeMLB1YXb/kq4qz4fRj/ip9E+3CfSMFHT
 q/HzNBovHC1ce5rFok4o75u1CWUfUG0rd+mJM+QmmO3GXbvpZ9Zu+vpi31iS11LMfzw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bOBppPbx; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA0576060E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:51:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 84256780504;
 Sun, 25 Oct 2026 10:51:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 10:51:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 10:51:32 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20261025094056.71854-1-thomas.perale@mind.be>
References: <20261025094056.71854-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.20
Message-ID: <bfec36668dc36557b3410eb1f8edf454@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/c-ares: security bump to 1.34.9
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

On 25/10/2026 10:40, Thomas Perale via buildroot wrote:
> This align with the version of python-pycares bumped in [1].
> 
> See the release notes:
> 
> - https://github.com/c-ares/c-ares/releases#release-v1.34.9
> - https://github.com/c-ares/c-ares/releases#release-v1.34.8
> - https://github.com/c-ares/c-ares/releases#release-v1.34.7
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-33630 - GHSA-6wfj-rwm7-3542: Use-after-free / double-free in
>   c-ares' query-completion handling, remotely triggerable via
>   ares_getaddrinfo() over TCP.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-6wfj-rwm7-3542
> 
> - GHSA-pjmc-gx33-gc76: CPU-exhaustion denial of service via unbounded
>   DNS name compression pointer chains.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-pjmc-gx33-gc76
> 
> - GHSA-jv8r-gqr9-68wj: Memory-amplification denial of service via
>   unvalidated DNS header record counts. Please see
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-jv8r-gqr9-68wj
> 
> - GHSA-wpr3-8q3r-4q8c: Memory corruption when an application cancels 
> its
>   lookups after a connection failure.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-wpr3-8q3r-4q8c
> 
> - GHSA-fqh5-3x7m-wp44: A DNS reply that arrived from a different server
>   than the one queried could be accepted.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-fqh5-3x7m-wp44
> 
> - GHSA-97vq-4mxv-7vhm: Use-after-free of a lookup after shutting down a
>   failed connection.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-97vq-4mxv-7vhm
> 
> - GHSA-rf6g-ww74-97qh: Use-after-free when an application cancels
>   lookups from a callback, or shuts a channel down.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-rf6g-ww74-97qh
> 
> - GHSA-mw23-pfg6-2x9r: Use-after-free of a connection after the
>   socket-state callback returns.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-mw23-pfg6-2x9r
> 
> - GHSA-v33j-65h4-4ch8: Use-after-free when an application cancels
>   lookups from a server-state callback.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-v33j-65h4-4ch8
> 
> - GHSA-pj7p-v3cw-hq66: Use-after-free of a server record when an
>   application changes its DNS servers from a callback.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-pj7p-v3cw-hq66
> 
> - GHSA-grv7-fq5q-9vfc: Use-after-free of a cached DNS answer while the
>   application is still reading it.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-grv7-fq5q-9vfc
> 
> - GHSA-ph6c-3cvx-mq6v: Buffer overflow when ares_dup() or
>   ares_save_options() runs while another thread changes the servers.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-ph6c-3cvx-mq6v
> 
> - GHSA-cfcv-8v2j-qj6r: Uninitialized memory returned for a numeric IPv6
>   name with a prefix length.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-cfcv-8v2j-qj6r
> 
> - GHSA-wrgc-prmw-27xh: The query cache could return an answer obtained
>   using different EDNS options.
>   
> https://github.com/c-ares/c-ares/security/advisories/GHSA-wrgc-prmw-27xh
> 
> [1] 728ea9f901 package/python-pycares: bump to version 5.2.1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
