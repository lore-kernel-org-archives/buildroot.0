Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084C606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FyR+s48b
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E429460F11;
	Sun, 25 Oct 2026 11:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZkJ8bAEqf3h; Sun, 25 Oct 2026 11:59:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CB33160F07
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929547;
	b=nY861YTxbGPA3IfV6dLwb7td8LKWjjlHz0/35YSvHb+wcn2pILAxrdpzjWGDHl6iIBu3
	 z1AXUqkPp7iCSRhKZF2hnAtvyQQJ2WznbESac1RwzAZSKHOZfV8a/SiYJBuhb41YuslUg
	 C/SWKoXfvtcTPI/NHe35YTpwXLmi7alGYE82fokkO2rouYuYdhgJjezlGqoPcSLu8KyZn
	 YbIJEx/+i9qo2N/R6XUI6OpQb5DwrrdOQdDRc1T5Ean/VdnaXek3Gbxi6IZsOZ5Gxav+9
	 /Z0uGPNuueVfnYHdwLxwnrDWRNj1ZkWHNx752vOu+6TSsn1OfVvFoNY222WNLqbgUEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929547;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=tcb73frC+hYz6xGuxSaj1LCq7kHDhvWUOlKa31sCcGg=;
	b=f9pS/F0Wtx3YbMeDt4OXc7W4Nq2QETxFrKoeVRkIgJOmTVOF3LwCmfGCfaTWw2ZaQoa4
	 Ur+Wv/6Zjcb/rma7gCJEWw9uKcEeOfpANmc93WmGjyfq1GHcx0qJqKLuk0/X/0SpO3C1S
	 UfnWMejKQfWGwVJviArWIhMTN1cJWQvDxjRiHaKwexKldxkpa/ihBvJgoKD/ws427kyN9
	 3Eo6K+6DNhUELHKuGhhpujUp+O3j1K+IEzd/PfYwh80DUODvz1Bdp0Bo8KpgdC6usW80a
	 2P2RLUunHvysBfyBFqpEwst5liPZD9CDaNbwBmabzT5AV4myjJDaAYQ7BP2itZJ6WGQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929547;
	bh=tcb73frC+hYz6xGuxSaj1LCq7kHDhvWUOlKa31sCcGg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FyR+s48bPBoapBau4BOCqK/otjRBQReJ1NwdC/vycjprAH1OyFzp6HY/MJ5sudjFL
	 vkASa9R61JdtMfh5nqPS9Aa68H97HYSBpXM7csTtyLvRQcfa6s0WjxxJ/g/f643fro
	 Q258Fs+h9XtV0aH1unwOEee2+SbmsGRnNv5yF15mfHBrJ2Y2Sh32K8g7AzZDzK6Ndm
	 yN3wTzQs0lZFPqZ9V9OBmiQlNisx3mpgpzL1qumBA8/HzpeWcvxeYnf/+cLkyuyoNw
	 C2mSDhHXeQzHrW4KJCinDOOECj8ARhCZTcUe7Pzzc7ykgK6T/Lw6eGQPIwA2bbwETF
	 VuDzfMwtSCuTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB33160F07;
	Sun, 25 Oct 2026 11:59:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6265343
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 540C740537
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWuaGPQmRKIP for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:59:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1AB8A4052D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929545;
 b=F+5V77hddNgizbBpq9CUpqXZ1Amk1g39oB9tYJClv7VdgMFIEfMdAPJENp15QFAGMjp3
 AKUzAMK2qx3ajLeFuJA808B0RNJsYy/4pbz6CU5yrSN2fJsVnA6StRBjFBqnuungf53eZ
 YbzTlJb6hoEPmeKm1IjdtN2rp74+6xSBEc/o0zSjeTVhmtImxzBBqyPleHy4c6C4m3Stc
 +tpgjPPYGy0f5ovnwO+08T/jK/TMtRyb/RR5yifQ5MGn2pqZSt3O19Af2x6ugfLd1c7sG
 QcUx1XG3f/YABSTlF3oGwouwvz5esNNw1Mw4iJyFd/cG1hYtG5GIP5VD1IunAZyYfjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929545;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=QmYn6d+L8cgMQVhMS55vMMzMU1676dDAG/CD+dL20Pg=;
 b=PRPr9tWZaBXdc/134H1wSCdN3QeUsBwVjLAuCZfQDAjQj90Bm/J77bITU4iCk7FWuyGR
 5c6JZ/HDj/+Gcspage3W/CbNsUDmnN4nS0fPCcttIM0ijHMLFnvy2DqDv6SrLBDKBwqaQ
 P9kigBQ9e543cNgmfG8P6gJVYh5tWDrYzGdbp9t6juwMjqqqri/MtCEyAUtG0rnLlYX7x
 Yk6DRwMVSw3+RoV3IK5EPuIXh30LgDixYNL2KlJ2i9i4zxWgICgCYsCrI3eGV4uRDP/me
 CeyHPsUsOy6KpxJE7fpaAaua316GZ3TEIpdm5hJtDF6ajcS+jVzIEIcTczyufG1BzNA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mUpdBfgx; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AB8A4052D
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:59:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F1DEF13F8B3;
 Sun, 25 Oct 2026 12:59:00 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 12:59:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 12:59:00 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261024182913.1957467-7-james.hilliard1@gmail.com>
References: <20261024182913.1957467-7-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <0dbbc7679e7ea9265288597aa2eb5613@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-types-setuptools: bump to
 version 84.0.0.20261006
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/10/2026 20:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
