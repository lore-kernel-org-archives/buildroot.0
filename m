Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B37606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 20:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TEVt8ETD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B450A60A5E;
	Fri, 23 Oct 2026 20:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6RnxfvZHIVo; Fri, 23 Oct 2026 20:26:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E3E1860A59
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792787185;
	b=Y0tDHJ0Y3MBgsWCT4xDpcsybNvsonDnHztNpv6n6H+NqdQaJnPYMhgTlGHShxuYp/Adq
	 coEgl8Z6YlVrO1R33grDbEIk+UK2rXD6oeuMaeKhddjWJanzc1a41XRT5yFERO56S2o79
	 +87y0QnYu6HTqPSgSRLidNJp2sknI21pSB3NkAa5SuFbtj/1StxzqapJHFEQaLNAw3dc3
	 Htth2WJLvAPlSddjIeQL5tkn96OUsw4PsXFOsrHtPxd+79G7QQwytifpQmqHWhzC/UbTT
	 WjPsrcF68BOnWZFTXItKz1FRJsH7T0V/s0+Nf1T2aG0FpgseOxDrPB/q8QAcoirkxQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787185;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=Owt7f5aoU/tAsls6xXXgj+JX5MPlUrxGg/tuQ4PF8LUJpQOQLJeG/sTV8d+4hJYd+eFj
	 paTRVjZ3/+gIZ0jBBlrJgaCJ2Z9HsE9hX6w3RslANuKxziJsFI4WTokeummS0eLbVlGvg
	 P3/ax1H3I7HGlH44Cg76soPAdHQNyNPKvmS5uarobbyY33j7TFH3PhjleSL7bOfJU3GTt
	 A33RD1AxrOq11GG47y2H/goLb2GQHtgzjTsIZVAXeT8if69dpDGzBKekQhIKb8m0+fQex
	 UCbbVymuC5XeGKEbEsHegCYTIwr9AW95qne4uOSObeCC1FewhZLLbx70789GDXsT61A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792787185;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TEVt8ETDbUZEHPbMfLFLazfzu9mdJZ+/OWeocYTcg2fwAWWuMW6mxPbJD9WNiC6xx
	 7egKIO1gGV5aEQNUHxjL4yKSDG5ksXdhIw0OG6ET2mhu7BnDi1NgCWSK5CbrZ5SPZN
	 w4Tc9/eZM3bInAxHBYRjxXYhcdlJLQNafLvDzZ9NOg6cgXlMmQvvnKO/KlnGqAu3vX
	 GTHMUQ/TnGDwUYMayOPN0nA11pP9gWh4Td8dStx//f6HKBrb8smT/dvYkMS2YIqfwe
	 rNolvgIRwrSymLilnJFxfTKkAtkWG6gLpl12x/R0IggcZ4zfONJB9EAwanr/F6i11D
	 Z+LNliuKn/FdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3E1860A59;
	Fri, 23 Oct 2026 20:26:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0D53356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DB3E40A7A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6i6sKzJwRMK for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 20:26:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D15B640A58
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792787183;
 b=MR1uxVykOKGK49DQ5FCZd/f3cysjr83QwZk17VVBme/9O+2WNlQiD2t5MLmJsEbrZV1v
 n9jswcPdDv13LiNpA7DsftZPrUYAUjCR++biN0DMIoC0W0Ohoc7Cl/+4b5XT3evxxWJ8m
 V6LoU1FAje6Jilq8UERIgt02C8tS9WlyB86wR6CKrZYHSHL7ZeeujdiwjD887VKcILxYj
 zosQYv8ywDkylGbGD9pXYnWRXLj+N/PZYKLt7OwEpFsM5uxxhNKYN+cz4nxjCDybO7iQl
 ygQKKZizBm+Vvj5orkd9/v2wnR0Co5mn3rq80Uvqs45ey4mKhcWxG3vmmdLLHVDZLWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792787183;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=cVlcEnlX1bWl9g6mal+ZI4mjGUGd+JR0ueWCFwytzjgMl08Y947qwgga89JsyyGGmyFd
 K/Dg++iZfGoAcXaUZx9JSBXuO+MJaSqwd6gVZnhKcv0VJSySDeSdmg/fY2HJ5xTOD829r
 5HCjXOqlRi6XrPCe8Hy8R/ZMSJKQE5cIN2InRlZS6iRb1BNQhRkQb5iE3FOeFcUYxhjHt
 QCtyswaMlPEuv7SeJSAU3qxAY13Mf/mveVqUXUpgv0Q5px4jgQPczjKM1qWpzIj9CS70m
 ifhy/nnk9DpJsJGaRYKVrLIlc8TMF1GHqM1FLmPJymeYlyzlUmmbSUKsfzzv5hIoG8g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HFp42AEe; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D15B640A58
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:26:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4D39313F899;
 Fri, 23 Oct 2026 22:26:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 22:26:19 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 22:26:19 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-3-james.hilliard1@gmail.com>
References: <20261023181818.920329-3-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <db97c47db8a5906f9801d30fd3a69cc0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-autobahn: bump to version
 26.10.2
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
