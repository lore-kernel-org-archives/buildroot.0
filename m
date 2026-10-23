Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20F606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hzuLdpUu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C91860A4B;
	Fri, 23 Oct 2026 19:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-TXTDW9z8kK; Fri, 23 Oct 2026 19:34:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3E90C608FE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792784085;
	b=c5T7F4RKYLNAC2OdsbS8ZvipzKvT8qMDCmamWT5aVlmMYLQcZvWShSXOgFl3WtQd7kW4
	 M/X+CUN2TXU+5Y+dW0IwppNeWUCR7V7se0qteEDCGH4VR1QNBvY00pPIalS0U4jPP8GO0
	 MUALk90TqqePioLN5Ssak2Jbp5+ckRKuhD1WYEBYIKTv/qjHidHjgDkb+uf3Ne56XgWs8
	 DrgeNnFw7/oD4J789/GPvhAD9UlFBBrgmfQCFzLaWHehXfXhMpuu9LOYo4qHhQuIj/+tA
	 QEySIJ/EakJsk+yC/BQsxnecYrYWtTr+qN8/N0weicZn7ALdyAFN9b1MpwYFWexa4Hw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792784085;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=auk3a0RbKZMKXwsQS39KHV4NVHOhr1XlK6wNgDzGT6c=;
	b=hrqbx12hinTxdaa5J6OanwLVrgeyx17DgsHaeLAjN/szkLxUfqW9hIWIDVboAbJ2nQr5
	 mr3og4PfSqSZmvQPjGijvkjf490Qv0rXTB7RNZBBBSEnIdZoDrCDHIx7OozoMBFMRFLFO
	 2lEpS8iNM0J7y84aehMi5mBotOFsdOvIeeyx9f9kBZItqXlK6RlVd4pY99y6/beWbMpH1
	 ywROzGeK+she1MBbUzAw6JXY/O3gvmU9lRHNM9LGd4cKd0Ho8kQ42XkPSX59BYheBOBAL
	 Lx1/g7YUVyn9PVnR5wXLYg5wVx7QJ2nlJNfOEFq4rcqnP0chGqp6vDN74aHUNSDTwxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792784085;
	bh=auk3a0RbKZMKXwsQS39KHV4NVHOhr1XlK6wNgDzGT6c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hzuLdpUu5qQila3f4Ak5d+l0NnFrcu+NnhajfI9WrnzC5lpPTvXQjUXNXMs39vfOh
	 8Zb+5QDZI9YbFNs1Q6d3TmS0tUR1yXdayeXthIXEZvN69+1FIK+SzgmLtLbHP8pe3t
	 4+LbWYyLZJjP8h8YDxP7CRuOdGYxXkoz0GbGD5fQJupQMeKrcqV7tetEU5UaxLOobN
	 40oHCpujgoim/jgue9IhYDNtuBtO3gRxDrsNTNoX7U9n+ma5ND+J7BBXfQr211F5gX
	 tWDUMdbtKjjSLJoqIiMD/By00gyrseZIcu4WfUx/rOZB9wkcxxQM+wUO8b5nLn4Bja
	 405n3yaBYSyrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E90C608FE;
	Fri, 23 Oct 2026 19:34:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 57119235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CF178154E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3OaIcosJ7z6 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 19:34:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 459CD8165A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792784082;
 b=XGprQtaqG1v2AHlMdkfvnrZpeU0ORA2t6Uy8v6n21woELVIHZ9B6GZ0URn4rQXVzG55G
 xfCtR4ZNcD9ZKl/RQ6pcikyBU5TDVhg5HqOKgcrabS95hjiqCb3SaL6o0C11HPdCZ6IMd
 DepFR5PS3O4zg0xDuxnglbT/Qdxd/3BWhsl5rnmDl/WzO+SOzRNlgj2bsSyY8VNqfcW9T
 mcELrZV333oof7EpOswh/us8JNU2Skq63qwcM2klk4cyMaezBexmYBbu4q1ndJzqSJ0QB
 Vsu+hsyP6l6RDIOezjdKO8V96J5CKONdpRZyB+HORyakt/G5BbO75qKG8xLX1I2JJcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792784082;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=1qb7qC+2cE9ujgi5SOGpbAV0WrpAG13rYwHfStRwlEw=;
 b=lUirW00veedTu3D/PeobNkCZeCbC1M+BHcJMDdN6fEjHM8PkKfcT6AltOFSWZS6PzKH1
 LzdHiXajctfDOKAEjZ8JfIWtZtZgYrxpqYv3D5zPJ9+mnLWhr+dB1OH7nL7pTv3KxIhXe
 WRsNB0Kl2K8GiUA32MFK9zse1lRUyePjAiHpdqfO3hx4nylh3iM2gjORdLPhLAHTKbLF5
 g7PUem8ulekx3gyBhVSGOe7AACSUZxE8EN7jizlVJXvl10RwqMb41cax2WYT3NJKyPn/F
 mjuDE2gTQGFnMl7L/mcZWNy9CBI+n6qUv4FaSMW9azgsz4nR0QUluVLs/PTkaCT8qSQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kq2VGZqy; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 459CD8165A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:34:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 31604B0053D;
 Fri, 23 Oct 2026 21:34:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 21:34:38 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 21:34:38 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023162216.4015396-1-giulio.benetti@benettiengineering.com>
References: <20261023162216.4015396-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <6870a80d92fc6047bb8fb2114f0456de@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 15.0.0
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

On 23/10/2026 18:22, Giulio Benetti wrote:
> https://github.com/harfbuzz/harfbuzz/blob/15.0.0/NEWS
> 
> Deprecated API:
> -hb_font_set_face()
> doesn't break any Buildroot package.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
