Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D341C606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=idy3XM5Q
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE7DA40556;
	Sun,  1 Nov 2026 17:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DddGYzpKxwq; Sun,  1 Nov 2026 17:36:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F243A40574
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554610;
	b=qy403GQPyBFCZ8h8zGiucJ46cuNIeUOBZjSmwlRXAPK7kbax29GNZ6g+JgUUrYj0UsGd
	 n0lINx+QSDanedp5PzX73If8NxrGneorhJGgIcAvGVqXEOCWHAAzahYwRWq0Y7cT+6n8l
	 d6SSrR3tnUn0nPHySXk3WEBZErcRHpV+B67JEXmu3jKujx4DKbs5Zd5GuFaKRDmXKrk9C
	 BmhukcRLW7feEu45FC8XfDMb77Qkj60u+NWmcibuRLF3sM9gVMHrP+HlkQ8/+ptXl9Kn1
	 z6+WsfhifIvyy3KQPGHC0uhC00oIZkJFgZ6ungtwfcUStWLrFTNeyJ9w7dRMcY2ospA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554610;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=t91Cdq5Y1u8ovlbVIV4jVL+4g3XY8pb6Pqz4UX4duSg=;
	b=dfr6QbWp+uayOPmoqPjYmRKsVDLj78b6HSR/5y76un2UfLgQsVWujtjpoxRRvrOosdHa
	 sqAzwUaNGjLpIzxrktJ2eEdL+fCt5sEIL0UZlPiG7bR3gNtltl/dg9dOF3KXK0DUFT35x
	 nmOUzK9rw6kozGsJBTT7BcBcQqHrCTZ+lS2xflwxjVyCwrrF/yze2DvuyhwJLOM1VSCgi
	 QPjHBiWmqAGe1u/+JCnDcacDl9Zqq8P6GDUN1I1mhhRL7lLIb+Wr6cjPQ7hwYSTAa72OZ
	 j2OwipvR+9zhKnpKmeKaniXlDDtsiEsmNffmxoS6rll/Y975n9m7Sa7waVeEnrzyI1w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554610;
	bh=t91Cdq5Y1u8ovlbVIV4jVL+4g3XY8pb6Pqz4UX4duSg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=idy3XM5QJPH3Oq5mMxV352zd5wxtl3lY6Ky20Ns2HkDK5toLuQBr3Klh6V0CSFYTu
	 ihXNcnK+AGtOuq9YQcyDzGqaREqM3x2G3bm6GP3jPgUKbuEB3xXRMVlKv/UgTFofsK
	 YrPDsq4Bce42YFfNKRrk5HB+mGYz6O9HBNA/BsEuBgjH01dXs4GzgwK6b85A2PS5ws
	 5eyqXmNtOL+32aT3WReX+JDBjgjkb9QchZujRCF+EtqO7uX4dNGiQa/MKRSSX8s1rA
	 l77uUNoDS1FDlVUGJUAu9RIrqZ6M1Ud/9qz7DIWK+OPrCZeg/SnqTiTfgZUjVv0nU/
	 dOZBsOiARUtbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F243A40574;
	Sun,  1 Nov 2026 17:36:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 316E7323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 170EE60612
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEWTXuZU4d7W for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:36:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6F5F66060D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554608;
 b=q8dcLPMqkjH+OredOf+hD1hMrccEgNR8FgkGt0PXlKboeSe7DIZRUiWDueNHSU3tvTEr
 VprdL8n+nq7jdZGlt7a4y/yVTEeSW4jOjdY39J+OAntCZxU6eNGTyIXlcA8VDvClg3J8w
 /ERuO9x+kxSHV/rlj04daXU9FRcYUQ3sNvk3p6DIePq3F2w/5Pt/OEb2QtLYpGJDmEG+Q
 lVmWJFoz7dpI+4h/ZGqXcbxUKYskbIljSeDIvH5rJm2zDZL3SCT/iZyZg4+CvKGaMTtQV
 WzGWnB/a5IqSc2S+IMW6iCLQOOkjbcEJK/dm1LN99TldBAUUbJDtTT/KghCys+Psq1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554608;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=htFdZkg12WxDEYY/QrjFWRDR+FJ6PpmbRxnOpaPVsIU=;
 b=kyFP04HfU1W4J/WSJCVV5PwOa/bcLoFSwnYOR8Diz9c6po8hy/ZuwbOLHy5BJD/OsZpl
 p/IhtdKXGK0tjjTK/Kr41+8v+g/XHYFHIHy2/qpnpALSPlB98TzE2cfVQvPXx/OeHzEe5
 T2nO970QER1VkNOkidpC2M85LlVWjh7rkoyB4HwvZZD27br1fPGX9/0fa9yKbEge3zbog
 KTYvKHdejK8ybo7jqN+tbBd+FKkjBKflBm7PHrWjc8itSHO9pNZDCjBPnDd5LDUukXr2r
 cvVDnctrTzrQxQIuoCc5ySecvt15XB0MM5DiB4vIhQsiIYGbpRLYb+dZmD7o4XDuZIQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ul0lQyhx; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F5F66060D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 675C613F88D;
 Sun,  1 Nov 2026 18:36:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:36:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:36:45 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031201918.2850153-3-james.hilliard1@gmail.com>
References: <20261031201918.2850153-3-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <a2afb80f9dc9bd7716d21d7ff2c7fc94@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-filelock: bump to version
 4.2.6
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

On 31/10/2026 21:19, James Hilliard wrote:
> Add the host-python-hatch-fancy-pypi-readme build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
