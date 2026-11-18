Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598B6606A325
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IY4QzpHi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2282360664;
	Wed, 18 Nov 2026 18:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNRC-8269kmp; Wed, 18 Nov 2026 18:12:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B175D606A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795025562;
	b=Q6EtGPEopX97zhvXm4SPnJD9E9qE1Tldp/Mrq42Vq3ZS6KnjYYW3WLQAyW4RzWsN0KCY
	 N7fPYrZtyhTIhFaKs5WMhsfKVipB2c/X81g3pq2KRMxChd39lQRJ8jtNo8HTvVg01lBO3
	 QJQoIsivURPaArkoYQmXBbBpgFiVxevr8oLfKZVu4SVVdbQjDHytuYcI55czvt0eVEZsS
	 7GeqMo3nMIjUVZc6fHMAqJB2TFCMFZKkz+k1XF2wDU0mG7OUclOsWPzVUJQTY8ykQDOFq
	 IMPKED2tpJDiMTeUCHIwOOAuQK3FxvBaN+DKSrw5iZjUW+n60UVHuRiG9ZFNsaV9rPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795025562;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=VtRmBbS8or80mGoVDUGp1EDzSwNfkrZ2Qi/Us6v6YVo=;
	b=Ih8TqLNtxUwTODDOP6tkiUNvw5WOioVSJ6GcGCEjbq0npfOf5YNcLVzWdmNTOvVC0/7o
	 2kEVSfQso0HLJhJCHdYO9UHtoFydvCwd/VmcXVmVFK3j9b6ScmBxgVcajdi3ENpgmYEqR
	 1anLhUdizuMGd0rtff9tkhS2WBi5lzSzxIyC5wUKTCDgUIeHyEYof2oAtvcFLr9M8ZKm2
	 la4ghciNCs9ZK2HHcv6K7g7gjNDSx0TulMoFmVHvovGptr2dkqG982OYHy2bY31W169d9
	 zr4Lp0r1vmIVthq1GeNVHVlHNHak134kW2Befy7EGKOh/d3Pj4RnyhY8GbA19gMh3Vg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795025562;
	bh=VtRmBbS8or80mGoVDUGp1EDzSwNfkrZ2Qi/Us6v6YVo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IY4QzpHi7asVJT9U6btDwrnmZ/fJbu25U9gCVkQPMOgcHwTZ5YbRbArYAebjgFkfE
	 CxcSPUFeWVuW98L/HUaZ9SQKSgAzJn+8ffgFI1FR5mPlg3lVngvVN2GNtOZUT//ws+
	 7v+4uIh4hzo+8U9i06E1QK1mkBZCB44qtDP7qrg+UipyKjxnhMyG2dFLNX9GQmkF6U
	 gjP87gtsgwKR33W1sKtWZ+MAntw9kbefWwPgWzjPem/8KLfEtDVXNP+7Sx9cb0H9KQ
	 kDk/mC+brZUSsX5RhyxbyNElRQDndiHVWn+EuJPCOJuwkJPyLUtDWL1YoonnjAJ6LQ
	 e/ZDtC5jJfgpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B175D606A5;
	Wed, 18 Nov 2026 18:12:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9933061
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F519606A5
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nU2p69DBkM8B for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 18:12:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A7DD460664
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7DD460664
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:12:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BF0D613F861;
 Wed, 18 Nov 2026 19:12:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 19:12:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 19:12:33 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20261117221209.3984234-1-yegorslists@googlemail.com>
References: <20261117221209.3984234-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <896bd62e95665ed6758310df96e5d9cb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/balena-engine: security bump to
 version 20.10.44
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 23:12, Yegor Yefremov via buildroot wrote:
> The vendored runc is updated from v1.0.0-rc92 to a balena fork of
> v1.1.12, which fixes CVE-2024-21626 (container breakout through a
> leaked file descriptor to the host's /sys/fs/cgroup), and containerd
> from 1.5.0-dev to a fork of v1.6.6.
> 
> Other changes include more resilient image pulls and delta handling,
> a libnetwork update fixing a port binding issue, and AppArmor no longer
> being enabled when apparmor_parser is missing.
> 
> https://github.com/balena-os/balena-engine/blob/v20.10.44/CHANGELOG.md
> 
> The LICENSE file is unchanged.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
