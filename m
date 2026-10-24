Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C12C606A31E
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IsodCzKM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28DEB60A82;
	Sat, 24 Oct 2026 11:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgoFizo5o6cj; Sat, 24 Oct 2026 11:55:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6EEFC60A59
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842952;
	b=XrNfrZHzdmyOeR1m6f2cFSIcATsx6Ku8o+nnY0wnchlQF1ptnEt7AZZSJTsMa5OFsKNR
	 Tm3G1Wx25yudJqHBp0BwWb7W0Pym0rlf5tJgFFS7YS7d6UqgqNgFwRdRiUvlql4CNOpe8
	 a2IUzQGtpXOxTwAG0tD/x5P5lEiEvgZz9ZmQMgoD+9ErftoRuZ3eKcUAurQIgx2nfk5Vh
	 Du8rSOF08DYOImAFrwN6pO4WkfgX/eNHZs/U+6woBI52cInqJXmgQ6DwicquQB6zpkwf3
	 y3VlMHvDTt5dTqQMI9UEsy0vDTfc1qRVLfS2hI4qasrK//t7emcN0gjKMEtlmS+kRug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842952;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=lm8h+XM2oDPmBf3QgawPGPHJKy+xOLKcioiTigHmp4tc6doz2UfoT2ZMjnjdQEpnCT5E
	 0pZa22tYCu98oLLyU06nGlPXvU6lOU7ajP8bvOH6svHBoC7yNDoxiuXS4oti1c744eYI1
	 GO2kax+ycKJ1xqaRku7PvhoiiS+7vICAyh39lRM6CPe+DhfsAPd3f8mnycyUJXBgyuiHe
	 2drfdhGIv0FXaM19KSCIOrPq1HpCOtgzjmn6iNBiH+lFacfe8aQsKb3MhKprpVKl+JnW0
	 ghlVBUAh5cgd3Vomz80wA/5OjKxlp1G1N8GXqRn9b/TOHjV/00EeIJJUIjFucI8M+lg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842952;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IsodCzKM70M36l7Ri5KqAW6+egR18nUYjjmBf/cCtGGq8ri2ITN4GQxvwFgMMf83B
	 l2ImF23lagfZQMwbSFN9UcB2TL+gdQEI+TjAlwxTU54guX9/AfCYVOL+0AjE1jpJ6P
	 ukDC0/NjZp8uvaIKfU5AFtD2hGGEJTfeukVjy0ZsCp6mZbAe5KsO6vrBUO4VxV9K0/
	 6BQYf1P6WGSccqCyp+NtWRitQo+kMpACEcbHtZAifA1v7lCj9Ixgx0VVRjL4iZouY5
	 jE9suvdwLxxGmVSH4R/joQ5hURO/PN0tY06/kt9jUuKIMRxFn24/c8zu2njaWcwtsX
	 QxsBfnt01bKDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EEFC60A59;
	Sat, 24 Oct 2026 11:55:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B6CB356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D35340A84
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFrRa7oQ4kXp for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:55:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8EDD840A6F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842950;
 b=K5Bk3v+l5aPlYy6Nl2k1xRB0GtvoxCh3/palb1/acmzncXZ0bCyALM2Og0CuugAu2Jah
 7URxt/4AOMoS5eNxHRCjMLyVlQlIiGn6Nlz28qXzRV6ZU45f48lMzXesHTkQqdg7aPkpR
 wTorDhpF/ozE/ZVGucrfvtnAKkEgillB0E/RKcWzTp7xuNbk7fT/qVx8sDxhpW8tsjKnR
 BEZaIg6BUoVHz7eE+aT4zwhSXvpUddDp+yB+i2M/VfluccBqw3m80e8XJ+mcDm7mKYfT5
 vgY4BpAsSZLdAvenXmcO0oV3KEo+8DljmhpKgNhBKh8RQfQmusGc3CoSUGUYPE9znIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842950;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=RgSij0hLg726zrX6WZVpcoSyYjXbuP6CBgiexmyJPWN7lZBSNxwi5nTwUyymaGhrFQ8c
 aRFgeI1SC+MHyM/aIsXSt+cT90J4D7u2Yu6ytKDUM9rO5owbTIfgtpF9YooHUsyS9gCUV
 CspuA40/FHAqpdkEo4OMApWgIW8oMaDqX2nGl6m5cvH9Lk+mTErnnTa5+kTLf/iznxRbt
 e7MchEzwUKYbK05Rw7AuHDZpkQYn1YK00W951QPYDf0hvY7WSLBjvQuk8f3PNMNMqq5Jb
 mt+z8ksQiQ2i0U2G+lOKyIlhLi6Ouhslc5HJ98bAXm81LzLsBucEor757EkvssAgbXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OA8BzEz6; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EDD840A6F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:55:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0EC2213F8A2;
 Sat, 24 Oct 2026 13:55:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 13:55:46 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 13:55:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-26-james.hilliard1@gmail.com>
References: <20261023181818.920329-26-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <715f494b8d77448ea00a5e19d4cd859a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-tornado: bump to version 6.6
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
