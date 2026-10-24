Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB8A606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jHHn6fqf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B34160A97;
	Sat, 24 Oct 2026 11:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wohW1ijMHdvB; Sat, 24 Oct 2026 11:55:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C39DD60735
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842904;
	b=XnM+7SAoWMDzyeIdLbJmdWHVg8wvK/Glwn1Kw1c52skHuBHGeF1T09Y5ONiEfBxhh3tk
	 Ke6TyrbHl0F2Bsx4aGcIwE8mtPI6fU/+9sJk31vniWdxjFjkJrZ02yXrIXOss4EJq/OsA
	 ahBjbzYO0Z/hlBhe6j+mItcZl/acgOV+s70Y7IyoDEzQJKyzEZ/n6A6fl6Ajc2OYkMx7e
	 u5xVepkCZQ4BHX9j25U3SFwZK8Q3d4U9aV5qtrqvxnzVvdhzaTjPLbvKG/Q6ws/gaFCWp
	 A1h9BV8Nk7x7K/mgeUnLS0DntpzAu2iQSSaTFrOiyBAQcuEXKrKMZjOFS6tE0B9Fcdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842904;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=JFGab1K0We+IckCsECBDtVf58zqMS+odPBLybB0qKF3YKYNLr6D6Pb5xSMfgyrp2C6iO
	 ixnTCdbo45gmZp6hsAfSc7BowhqGM+4inGXVfi8PyvYvJjTBUJumAz7whmxZxnCViwQAU
	 JW6ql8HJiY4w+/oGM/iQP7UDWhnbZ+U4+GJnJXcXxj5bibLKCnnxGbx6v06Vvd9WTVawr
	 jp+mSVJ4Er81vN1gydgCPqXB8eOSWqgw+Z+PWmZyk+ZqhlNLaY7ETfmRPrk4cHl/AUO5a
	 MWTc2QESR/e2+9yvPPbtkEGtkidftr4xWBUefcmcXFkMLF34bur/9P5YCWrOFbit+Yw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842904;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jHHn6fqfy9egmYKQqAObdxVeqBdUcAqPyeUdHLq3/ObnIpspe9GJRb9nJ7haVt403
	 hlNCL2YKn3+YbEpgYqPenHZwbIlPuB1NQgc8u6jD7BxfOV/Urh2MTq5PuWmLOkhCyI
	 gt2OrSjb5bfd/PQBWkJD2Yf5qwy23pUrl3HSyMGPKcD5Cv0gfeNqKgjx5yZEtmWVOu
	 UaFoKZaBJVSQ+RW0HUTmH69ZmfclPBMisRiLPKU6Xp3MgQtKVaQdHvSJYU/TRxjSqo
	 yfOu62iJ37+J5dko3n1dLsmEKy2kykMMj5YEwHCgmK+lcc36rJaPuqltgCjgO3QMRW
	 YddUJz36rwrAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C39DD60735;
	Sat, 24 Oct 2026 11:55:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6EF14D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B497560735
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POaeyjti_vfd for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:55:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F39DF60657
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842903;
 b=OACI+QpPBneXPb24jcHcm9YvMZHHhChaX4bLAGWOVoH5oD7RMR+Bi4IB2rT9SyaEqDzm
 IRX8s84R7Do9/S7eXlHRyAtmdcsqGJbYmpPo0oUO2LGgypbSCl6drzQzCJsGMjOV9O0wX
 Dyd6BdHHIWXv59ay27S5DH4m91yiQ8ubjkSLovXXVYU9Lzx607MddKB3f4jikzbMzsbTM
 p8lSRFCnO4xEtzlZDDbitr69ys7Pzuhz76M9D8GWcmvaipwj9F+fbwsesYsY5igokHzLR
 tWyKDR5pnJnvJfPxFBEij8xvlEvro5dhi2IwcZF1aOPRTQqanOf8cQLj2iBrSHSJiAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842903;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=OMEFdf9sPxPdSWCxzgE718+6YTLXdQ1PhYRdiKhYtftUNlWjM3t1JUn7qq+RAb2rTBVk
 //96EY4BrWxPvddR1s+tHebYX4zq0EuoRNwunOO5LLAhjZ5TbPIt8YsnU0Ibscd1ObQf7
 K+fYJ5JdurwROz/W77MMZzysLyko0NZOJeNXqNH9WXNygSuCuj4tlegIMyOoVrK7LAwOV
 jPzTKH0RSCOBAenyWJOciDsjFMcw6A5ycsSFhpQaPhdDuXc+3iw3DqMkH3OTKz0Hka0Om
 mbZO04ljdIyWOuV98cGZTeqp3VcBEh52j+dRBTx8P53m1KI+z9F5uVIM4AO7m1y3w1g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rmWEBzvf; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F39DF60657
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:55:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 68D9F2003CE;
 Sat, 24 Oct 2026 13:54:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:54:59 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:54:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-24-james.hilliard1@gmail.com>
References: <20261023181818.920329-24-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <26b0743eb2037f07582ee74c292a6d1a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-soupsieve: bump to version
 3.0.4
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
