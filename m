Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584ACE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B8E3402A2;
	Tue, 14 Jan 2025 20:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iUxqzoGOZ_c; Tue, 14 Jan 2025 20:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B42840224
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B42840224;
	Tue, 14 Jan 2025 20:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E06894B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F56C60BDD
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aGW3b9rp0rl for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CAAD60AF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CAAD60AF8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CAAD60AF8
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:57:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0AA5EB0053E;
 Tue, 14 Jan 2025 21:57:44 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51276])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:57:44 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:57:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20250113185750.3035094-1-james.hilliard1@gmail.com>
References: <20250113185750.3035094-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e0f36cc19ceda1496ce23fb8ebe2fa78@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736888267;
 bh=Fh/RijaimLLeDwjheEJV3MIpni04j8AMjAZlgQNDofg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uOHdLjM81xTdlnsSmh4Y0ctdR/BV9YWI3wnwX+Tk3HsoAILUgYuDfWy6cGG1Jcq+A
 arffNQvZ2TfGPZp5gxgfRmQeohguF8dpslNFJ33GAZJrq3Ohgv8cdMF89WyR36aNdi
 AAcEzkZ21cZWAOLXtpuhViS/P3e8N8xw+LFs2hNy+5qU6bpGuPTaOhM8cdUDrHJKHk
 21Mk9eUKORGrvPVezV9JVlLdvEZdhJfpDl8w+Abh9BZrWxi7Hk4rBc3Xi8V3ofHuJ4
 xO/ugRt4TA72IuJSdhFeKNbPqagYsWrHQAGREXE7FpQwB5OJ4JFj9UDrJHzhn+Yu/6
 4x6osGexWhUuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uOHdLjM8
Subject: Re: [Buildroot] [PATCH 1/1] package/python-botocore: bump to
 version 1.35.97
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

On 13/01/2025 19:57, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
