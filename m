Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07CBCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 660D24087B;
	Sat, 10 Oct 2026 14:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HiodBobo03F1; Sat, 10 Oct 2026 14:27:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 73636408D3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791642429;
	b=Jry739sPxKC+FCMfg26Myp/BmRn3y13KsBY87wLFDlzmsZpzQu87dJ6Q1BAlplSIkuKK
	 nDLuXgumzzQj6k/Gy9tNXUY4FJ/mXzML9NkThSXEJRs+SCDlhwMaGnw6arrh+w5PK/gOp
	 qdbmopwMnC5LVSTyUSJLdWJbr+dDJ/nRSTae3a7RcFkeqsblP2INzSZA4Knvblasv87Rm
	 QZtdXeWQXOO+lAELDZs1n+l6KZvwt8SZPpD8K2fkoI2/5UUwS9Txc+i6lgKTEzmQ9ZTz8
	 hEvxW2IgUfGOizlxppmSzheTJrdr1GpS0zkNys31Du/qLmGl0puJ2J+sGnZYK2pEWbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791642429;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=7ToxNzbjrjsybExR1u6ve0qiq3Hr3YuuEdHWHNkeNSg=;
	b=NyqjDR7f+yrzPGIvjysxcG4nwXNaUG8dnys/Wi7GWyqPAYv6sAgmM5E7O17z5N6S9j7O
	 AOFDNKe0yb0mX6eIiwEBBjEGPZYtFo5wpFq/pNUDnT6KC94UJMVKBp28QeAGTSjvJgHuy
	 PmyFuDEGyzUxBcnlNqLs8/Y+gsA+WWysxjtOZdwvlRIKFOIZBfoxXC4JxQtgjINxdyk2f
	 H/5KTlRq4RgF8UoqjqgfYsiihAElPRIhnCWB+Pt0tWxdE5Yipxa6UUlxdhD0vTI+26SrJ
	 0WtYzq0/SYMUH1mGOTIQUjr2Yn4JwDAiJ1raX+KrPn9RQjAOW4HRIfa++ylQCZzuXSg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791642429;
	bh=7ToxNzbjrjsybExR1u6ve0qiq3Hr3YuuEdHWHNkeNSg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xl2qwtLS7vrYfYK+n3Ck6+V0rsA9+EAAONBz+6t4H2YH+VOwfas8QWayC6Lw56S+W
	 xquTZnETNY5/ti7Z5lTYQN3rfpEnx0NJfJ7lpRo9V4wTgZ24gRq48Tu0PsisXPhpbe
	 L92MfzlsVJg5KesNLg8mJ2Fwp78TkoDI4CZGf6l6iyH7uRXrIVLomvGX6VIJelyuH9
	 LbMQ1VA1ru2kDanAqHHx0v5YFdmb65grh86StwAx/NLhZ8jMQtEa0aboi1tPyMrm8R
	 YRrqUyyZ6+1vmPIY7cbT+HIZkpdDvidIjxvrxA4XqhDbDg+1erVGE6CDSfumbhdH12
	 MP1mRFRFGeKGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73636408D3;
	Sat, 10 Oct 2026 14:27:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E55B1105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB66660639
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxHJXen3laKW for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:27:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DBD016064F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791642427;
 b=BnjEihv5A0ymBx5JWkRuqBg9eJtKgy5FJ0YplAnBBuKvlCtSxvcjQny92swvyLMiXS42
 zv91f+ZkBBPAexRUCnoUkcZBKoAfrCC4QACGYAFuYrszrzC00UrehJmkIx9axjMel/IgP
 xwXzHQ3mMueusJ/QHKM9U7CU0k2w5yQZFxEZZfsnMV+imgYpGreZXDeWDL5rKn5WjRbY1
 3JBwmFrD77rXcIfsMbmbxwwsXf4uhKRM/cGGk6OIKkQPYdc3qyIkDgnLik/HzARK7tATO
 40sKHX0nD4eKuwxkBUgbnM764dnEfrH/YTGvpIhR2ZmRlh1RhPaurFLaRZOe35ufdAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791642427;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wN93wmHZLVe7o1kohJJTgXVlGRr5+xkWuCjAym2OmYY=;
 b=evUavFQyxUohgpW06erCAiUkNbK5kA1zM0DjhAYPzgFf08/uoNg+IG+Rn2Nm1ZIEXVt9
 Fgha7Y17fvEVZpaaoVtMZk6BN95qdLLg9uEvqo98AvU8mBLpjXocC2tBFhguReNrnNxIk
 lgAnBpe9q1X29nuwyxMVgNy/eGSoDj3/kVYPaD75UEC3BOY31oZTSSBt4e5A4K4UWTjb1
 r5yOwJ5oHZrBhgHEBTFrgCp1awMblp9k81TZvXmck8XKIzxAE1hp2k6vJ9dQq4IfEFsia
 nQZ/AkiKQQ62pHvGFgXIsx4IqzqHVtjQGCpQLjxdzEOPIYAuyNcmmu++qKJ57eo91Uw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="XU6WMa/A"; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBD016064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:27:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7184EB0054E;
 Sat, 10 Oct 2026 16:27:01 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 16:27:01 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 16:27:01 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <4948b524-7666-4f1e-8a27-39afcb8ebcb9@gmx.de>
References: <20260928074641.1017968-1-thomas.petazzoni@bootlin.com>
 <4948b524-7666-4f1e-8a27-39afcb8ebcb9@gmx.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <4a7d8104053cee7588f2ba9665e03773@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] utils/docker-run: add NO_NETWORK variable
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

On 28/09/2026 20:35, Fiona Klute via buildroot wrote:
> Am 28.09.26 um 09:46 schrieb Thomas Petazzoni via buildroot:
>> It is sometimes useful to be able to do an offline build, to make sure
>> the build works properly without network access, so this commit adds a
>> NO_NETWORK environment variable to our docker-run script, which for
>> example allows to do:
>> 
>> $ ./utils/docker-run make source
>> $ NO_NETWORK=1 ./utils/docker-run make
>> 
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> ---
>>   utils/docker-run | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/utils/docker-run b/utils/docker-run
>> index 27c169db72..60a12455d9 100755
>> --- a/utils/docker-run
>> +++ b/utils/docker-run
>> @@ -21,7 +21,7 @@ declare -a docker_opts=(
>>       --user "$(id -u):$(id -g)"
>>       --workdir "$(pwd)"
>>       --security-opt label=disable
>> -    --network host
>> +    --network "$([[ "${NO_NETWORK:-0}" == 1 ]] && echo none || echo 
>> host)"
> 
> I thought we're trying to avoid unnecessary Bashisms? At least that was 
> part of the discussion for my still-pending BR2_EXTERNAL patch [1]. 
> Plain POSIX shell for that check would be:
> 
> [ "${NO_NETWORK:-0}" -eq 1 ]

I applied this patch to master, including the suggestion to avoid 
Bashism.

> 
> "=" instead of "-eq" would work, too, but it feels a bit silly to use 
> numeric values and then do a string comparison. Looks good to me 
> otherwise.
> 
> Best regards,
> Fiona
> 
> 
> [1] 
> https://patchwork.buildroot.org/project/buildroot/patch/20260405185608.1357633-1-fiona.klute@gmx.de/
> 
>>   )
>>     declare -a mountpoints=(

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
