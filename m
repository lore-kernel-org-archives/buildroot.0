Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C8EC79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A2C74061F;
	Sun,  6 Sep 2026 09:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uUvBUQ2pMAG; Sun,  6 Sep 2026 09:29:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E04FD40620
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788686962;
	b=dTINRZe9lMGDVLQ8N7fSv5ph15lYTyIeCWI6DgIyEubXb8FbN0Rbv5jJmo+79HjPEFKQ
	 //CbLQKYuFrQsUN83v6S7Jsn77W4YVJpso/sJ4uTI9Y8uwC0wH/TfpWjiuSOWMpLpRpzB
	 o71155E/obM8T+w59oAfMZu+mYKWIX86/tHyWgaN/UDe4ZyxihUEsqE/2GeEluzZWZ4IY
	 f/pDFLkevJGjixq1Cc6TSxAN85IHCLppqvpB4iU5YwixiNCY8NAtEyh5dLL1m/BS9DRh6
	 0A1r7Csc1l4EHtDgooJGjywM66oIx4WRGTXair9I9XlwADXW37kknkaxH6NGr8s2iZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788686962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=tLecRQXA8Woj0KEx1CTDHKDkJ7vAaqvHgM6ZYrZJhfc=;
	b=n9171hdkF3xc4NWcsJu9M3NJu/4GHTcgGrkzR6RW/iH5jQEpcgy8KxFVa2W9djbrwsBh
	 N3dIoPeWjtWua28UXC1L6SAa3d/s2dy0KlKXDuA10UDvnSNQbDPg4RiZyeICUA2b6jj1p
	 Qp9ybUb/V9nkpdvtAjM696IhMUam08/fma6kefzyqi4DqIYynVBi702RZpAMx+yj8M+4W
	 p++C6OBjRyd5+g5un561aKEcy0nO3E1C2slNdy75vftgOpjKypzsq6NwCgjzYhrVneQU5
	 mIOdXlo13werSbvyVGEaD4yR/IZPX8Gp0eeA+zFLKqDycsgwl30Ga7/wh/q85f0RduQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788686962;
	bh=tLecRQXA8Woj0KEx1CTDHKDkJ7vAaqvHgM6ZYrZJhfc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PferBp5JWPL4MrAsS+kbnBN1PKRpnjS6SXBwpKXruCT4wWSIZnhoepmEcKjwvPLd7
	 sUhYpR50TYRjVPzL0VztZoIW/VTu4IH+bMCggifnW1qvOODmlNHkhssHX6DoX8xaLy
	 fZ2I98v6aaSVUWiu9wbOmRTejumJeCHRK47ER74Ai3HAKsH57MuYF6KKwFH+5WnEeU
	 mfILNwRMacjI8PDsd56T0zO7Zc3gts6VZ5Bpi6ggX3kZrKzLO9AnB5eyPboG2rrN9h
	 HvFE5jEb1jzUEX4AJuxrzqNnzW5H8L9zHWMSVf01TAaKbjdfwU2XapZIcwXJOm2bNB
	 /ox/ilpFGDo6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E04FD40620;
	Sun,  6 Sep 2026 09:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC96A372
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA0844008B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoYOeVt6rQPc for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:29:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org BCBA94007B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788686960;
 b=AuISYrF0UeoN/mxFw/bt7Hv+0J7Q71g3QgMwcLaexraMUtzhWsNkVMNHEQYlzvBOXmYy
 ZtYMYbKUoCNMFucsKEGRQpAbXZWMxFXa5u4yti+VSntWWn0gno57KsyCaODRJI0Z1pFxO
 zaBkh2daXOZbmd7T8zmZxTyhMAAWiR7ZXgJP64KrnQSBChTGmHDWF9Pa9cR+u7mbALg4h
 /uN0jhZc6IZO4mX28OX0Uh7tLY1Rvdowp8VMqisgUs5ggViB494sNbnQHpdfgGvz0De4A
 dmRJGEYjwpghQjaF6FE7T0U0ULBMruqE3dFNrrp+u8uHGUKXwTTo745TlnQ1GMcTosg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788686960;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=mqqLApYySGFXdiw0dCEL9vUDbDVtBsMtGYEIc+xVVZk=;
 b=LUMA1sRUdy+LwnLOzrFV5Pc/Su7/7MzFRScF2FGcE3BI+0PyTAy0P/HXIEVsuawLZYvI
 4zC4YaCvyhqFU11wVpaGcqi2D2mpISUDsdB2ITd5V9z6Wr4wMLUanxZccaOIru8H0TnQS
 Qbxr6mxMcRzDRAyxxuvoyyw9j6TAeLs+VUycd/rjDEF9H44W2YZNoEWouHfqvG3AXNeIM
 3quckhbeG9Y2Us8tPg/9vJOE11lKTOE2Uej1haxIg1LKZ9Eapt7U90p7TUb5vkmeOPsp+
 fJUV81KxaEzThtZBkX5u0w7jNgaTil9xqDJyPfI3HHiW1czqmKARprWDvsgyobCeWUw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M8Qvf4r2; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCBA94007B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:29:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9CE48780383;
 Sun,  6 Sep 2026 11:29:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 11:29:14 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 11:29:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <20260904185057.877269-1-bernd@kuhls.net>
References: <20260904185057.877269-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <9755c156d60695b6703ac0c37b0c0907@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera-apps: needs gcc >= 10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/09/2026 20:50, Bernd Kuhls wrote:
> Buildroot commit 9a43bf6593aa981040e5ab91e69946af4fe0cee2 bumped the 
> gcc
> dependency from 9 to 10 but forgot to propagate this change to the
> libcamera-apps package.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
