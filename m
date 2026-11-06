Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CD4606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Jac3Q9/6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAC5781687;
	Fri,  6 Nov 2026 21:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d10CB_1MLhk1; Fri,  6 Nov 2026 21:19:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DB0C481671
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999993;
	b=cPnvlRZ8t31AXvPRK2DbT7q7UBVNCqEIzuyMz0fkznhSdlD+51rVcCbL/qiEsHx5H7I3
	 f3RDUGWVJHvA28PFoRAg1T+Uo7r5RDBcrg0ZlF3UpbyW2fk2UOJwm7vGdWS30u54bbhKj
	 10mSDvk/GwqYzJfT8FDYv35j2gQJ87Vf2/nUF2no8HmQDOm45Ar5aagRwBgUnjdIuNvGB
	 YiigHTrKh86c2KYf5iakIbzhrDzn45m4M9kRxArhf/6NvBk1UICXsgPT9a4+05NjsHAWw
	 eD2tmXHpNRWY2vN2jPqdPbRydmPTeuUPi7oxZUSx4F3JRZNyNvTHTIe6wdSg8llUudg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999993;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=W/rtGiugn4P7SUNRZkgsyKVRVDGYMnGuONCJyBFKnsT2BUVo9oyMR8X1jfhIk48u717d
	 Rihe1kEMnuioAgWwSZsvq7vtYDWlRXp0/CCLXjA5nNb2ZBQNH3VIjTjvtfBdAwLd3F6OP
	 TLCOX591IplGcFCzvuqAp8FZHuiSsvtkWhyjjYTRbk6nPg+cFCBsgXXnCYkKAzFv8/I5/
	 sgMtfAb9lmPmdZ1s6THdbcLfaXvT+j08qxgyebW3MfJcncC0XFKI7FBGl1ruPYIhdK3V2
	 g14Df5jBkYtbJXvkKGq6vOWFFi+UakQSTR+AXyXAsb0SLiaSGbt02HE+1ohfeXs/Iwg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999993;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jac3Q9/6xBKgvyfjp9FFP7YcYNvaFy7/pssphkXUEXbpxTryMf3VZlo+jR5eloT3e
	 QCBNdpQ70zgvZrY5FUQEJ7R9Aoh3v9kX4aB9xtHRcRAj00hWWPjlwQGPsyp/9+RnVa
	 IplUn6Wf8/h+ep3fMbyk6MQtuZB7llCm1lGGbYd/IsFgUFnISn2O1jL5EQDn/CVvqa
	 9R9LTudk+9INtbFcQHC6CslfwWx6B7ES3wrPP144AUPii3o+u9WrLjHs5R8rTFkszf
	 c578GwfmoNUqCYSw0oWhroH9OqPGNlDlSmAYCeNS4aAqzyzcY9eZew45QCS7WRn2cQ
	 Yik8yc4EoIxuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB0C481671;
	Fri,  6 Nov 2026 21:19:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6517531F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5727D4094D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hF746rF8FNRp for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:19:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B0B3540907
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0B3540907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8710E78035B;
 Fri,  6 Nov 2026 22:19:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:19:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:19:45 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-19-james.hilliard1@gmail.com>
References: <20261106191536.2120153-19-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <ae030c57e7159f24aa271a170f07fd9c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pip: bump to version 26.3
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
