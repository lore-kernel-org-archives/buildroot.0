Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CFD606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XZ9OXEHd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 829B0815C5;
	Sun, 25 Oct 2026 09:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4FRV3VGGNfj; Sun, 25 Oct 2026 09:30:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C649A80E86
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792920635;
	b=LBZZxoPBOfb+qL020UwvGNbdUV3UrpPwfuVajLB/h8HTdIPxMEBSerOxLvJUKtv488qQ
	 luQ9jNEeA7uwFY6sJSV3bPftJqRh9LhGshGf2H19m9nqERzI5/rdUtnb0yMivW56EzhJS
	 GREOqMPJUOy/mDek+Aur4owNw+qLif3yp78i5HswXHqSvpYj2fUxBUnxKqQCt3zUFFoTt
	 0xGa2XqBRJmdxFa5HjtmaHyC6Ndj4kdzP9x6iuVOz0EdaRnZw9KrMz4aEKQUaGZb1f0nt
	 kSv9eYlwsUt/n1Y7ckiZpeR7QHSHbcf8Q9k/nmTH+H9rJKx2iaxXrye3DOsbCvsWfwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792920635;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=ok8BsxhNjrpnphDdzq9gDGNL9qRc0yJe3u23h8fKPnLUBCYm2JyGaWHq3DA5dn03YyfD
	 LWO+MhXMYJlBsygT19XvcYNTdqKOSZo9SCilNvir9nSr5wuxeDvbVlCQv+6Dzir5VKRNY
	 nwjS7YU7WR9tzXiNAr2l0MREWM1KQcRtWIXlHNfz53N4Oj8AchTcYmy68jPXy+m8C2W93
	 hdJEG1wrUfoaUnyp6HaU1OSYecV1QCWnVJzsvO+5p6gIO+LBEyWxov0aOzfzx1wzf/MrT
	 f/4pKGJPhYISm8y5tr0wIEapw97+FUzrXMQSIem3z1XMe2G9VY+50U0wnL/EXzvcWNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792920635;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XZ9OXEHdx8o1QoTtIVTA+Nf4M4RF3bkJFAIzl/5ErIR+LLQ7zCM0ytfMdbJEJRUnk
	 pPcJaom9W6h1SR5J5i//zxbEaCqoGUUwgSSUz7oUO2DbR2NTMoWqBSCzn7tXX3ww8T
	 StEB3LDVFWU8nHm/DWJpAbYCf1ELxFe1zvLi05hrz8DUaWz8H24ZmSESn0f2u1IUWZ
	 wfvJ65XsdtOOqAPpfVqpdubO46EVZHm6+xu5EeN5hWqiRyTrhHLraW7qUQ1PbLTrZ7
	 GoOM44SadTjomWWJsSS4XJ63af/XYfhQTiQI3wYp5IXdRER8y9u1y7hhNwFWNzN+ch
	 GS/wNLuxXM8pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C649A80E86;
	Sun, 25 Oct 2026 09:30:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D668D3AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC69860615
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwqP8YFw8BzL for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 09:30:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 982AF6060E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792920634;
 b=tIiqBJLb/kV/HmSYRLWrbK2Y+vABfpjTchK3e1l7Nxf1kZHzCtZSZH2hfT41nXvszAGm
 rBNIQO61vRxgqT96LR4J0EGh4VbbZEhln4pN6e9A6IPzFQN6424DKxp3wFaV/IoLlCmeR
 R3JyczECChuhpUKs9TXwLvznw99FS6aIOcu9sgjJ5zknDvV0uzCUEfGI85mRfnyrxeMun
 vGRuTSa+zk0rdZcZjqT8LUDS+GVsD77KGVR01Izbvh2q4CmudOtj+F9GJK/oOL8Olra7g
 p89m4CHJY7RUPMwIS0/iYM+Kbcd+K3m9W4njiMMjjEe3h1/REvvGSRYQycWToxiA2+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792920634;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=JLT/hKaXRUk8yH65WcQx+rXkdP/Ia9rQkdqUuKY068VhvgK5rLQA/7RK0MB/IvrvSFcY
 UfuGG8zcNwlplWjT48ZczZVIBB0DyQhYgWETNCyvksnwiZsm21qd5TJvdPpkKubHWxpmv
 2JFfN+yHZlP0v0yH4WPN/c3kJnvUUkZHvTU7DcEjgEPPVoIj+HsGRXr59LNMjFt7w+keH
 FMa7p6es93efd8Y4O8ofjY5m2HH+LlyJNkzkQE360sDJIosOo3V/8bi0aUXiVsCOcal+g
 A2ZMlSXr/NdTAMpeupR/Uf5zk6WIUxT2jV1Z2+ItEzKcNEmYFX2h9SJFF7Q3wlxFL8w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="Z/ypL11Y"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 982AF6060E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:30:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 52C4C78035B;
 Sun, 25 Oct 2026 10:30:29 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 10:30:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 10:30:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-15-james.hilliard1@gmail.com>
References: <20261023181818.920329-15-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <cb594c37eeb26ee54be6bc98f9ef3176@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pycares: bump to version
 5.2.1
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
