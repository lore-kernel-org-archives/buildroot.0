Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F53BC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 21:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9106605C4;
	Sat, 25 Jan 2025 21:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKhLTeUblAgR; Sat, 25 Jan 2025 21:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E403E606DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E403E606DF;
	Sat, 25 Jan 2025 21:18:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4722B941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 263278202E
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dxg8Z5t_XtC for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 21:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32EB382035
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32EB382035
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32EB382035
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:18:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 66B6B5FFB7;
 Sat, 25 Jan 2025 22:18:13 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33336])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 22:18:13 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 22:18:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250106134554.2668609-1-troglobit@gmail.com>
References: <20250106134554.2668609-1-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <695fc5631e72071876550a3dae9a8ea7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737839894;
 bh=EUuUP85cWXwN8ClsBj54nYgyweHm9W5tRM2y15LRfek=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hwh3IN4GZUknoA8QXafL8Xbra8razM8sarfYyg7GTQhg8NbsbvcriErIM7+uodFe1
 u2f5npaZ/CkvY8MrjkwIicFvq2AAcSsTtZmgiL8eA0+BuQjBQEbiYWByXsRA1XCLdU
 B9//M0T4R5oPtEN2NjOVPGn5UeA4gEcWTVgd5ZuqAdwYtuHKOj+fbPOI/f05h6dQzR
 Dt47oeiy1H+nfhkwVrAPLJuE4WK6uxHfXXCiZA6bmWxB/21gwXBRATGO+pM4g3KWkC
 hTeVkZeawd+Pcwumxiy62j8QQ1F4s5iu5MuBAb/2jOxpZCLD2Pw46z5iKhZ0KTiaJS
 7omqFRTsjsiKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hwh3IN4G
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.7.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/01/2025 14:45, Joachim Wiberg wrote:
> From https://github.com/troglobit/sysklogd/releases/tag/v2.7.0
> 
>  - syslogd by default now cap forwarded messages to 1024 bytes. This 
> can
>    be adjusted using -M size or the config file setting udp_size
>  - syslogd socket buffering has been reduced from 160 kiB to 80 kiB
>  - Allow slashes in process names to support, e.g., postfix/qmgr
>  - Support for extended message filtering based on tag/ident, hostname,
>    or message property. This allows sorting of messages based on their
>    origin (program/remote) or content in any of the available message
>    fields: exact match, case-insensitive substring matching or extended
>    regular expression
>  - Support for remote logging to a multicast group, as well as acting 
> as
>    a multicast group receiver of syslog messages, both IPv4 and IPv6.
>    Forwarding to multicast groups support two new, per action, options:
>    - iface=IFNAME to set a different outbound interface
>    - ttl=1.255 to adjust the TTL of outbound multicast (default: 1)
>  - libsyslog.a support for egressing multicast, two new struct members
>    .log_iface and .log_ttl control how the syslogp() API works
>  - logger support for controlling egressing multicast using a new 
> command
>    line option, -o iface=IFNAME,ttl=<1..255>
>  - syslogd now logs the hostname as the FQDN in RFC5424 output format
>  - Fix parsing of IPv6 addresses in listen .conf directive, as well as
>    command line option -b [A:B:C:D]:PORT
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
