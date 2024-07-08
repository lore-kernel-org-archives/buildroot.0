Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84207C3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 12:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D3F80C09;
	Mon,  8 Jul 2024 12:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJa-9T3N3fmi; Mon,  8 Jul 2024 12:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 592F580C4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 592F580C4D;
	Mon,  8 Jul 2024 12:54:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A30291BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E8E380C4D
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 12:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7-J9WnkXXYo for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 12:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0962080C09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0962080C09
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0962080C09
 for <buildroot@busybox.net>; Mon,  8 Jul 2024 12:54:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.108]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD2Y-1rvKxT2FE2-00g7dJ; Mon, 08
 Jul 2024 14:54:37 +0200
Date: Mon, 8 Jul 2024 14:54:36 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240708145436.55ec576f@gmx.net>
In-Reply-To: <87ikxgqjxj.fsf@dell.be.48ers.dk>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <3c9f622a-18c8-4331-a594-4a8b39639d93@mind.be>
 <87ikxgqjxj.fsf@dell.be.48ers.dk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:5xa9yCtWLeKoTcVOzobm+mpZUu+rQeAwHwPVNlJn4sIqd+tauNd
 R3WfmFfH6qvQUc+WsT0Jkt7/iek1SRZWHn7z6EPkAOeclrCRrJh1ajRWfXYMA1I9UMHt2xT
 5sIb+n3olrjj/yo3GDml42+D/UukBIDQPJIdgZjO7rFs53iHZLCEt1WeTJ2gQ9wA9RL9Igy
 4Pu67n2mVzRpAiZ9sJ6VQ==
UI-OutboundReport: notjunk:1;M01:P0:HIBP0DesIyI=;cTw6AClVEZxDBDyVM6QmBkN8ixr
 JaG3Cpbq7DSTN9KSZ7l4wNsYBJvBwgza2L8U0GUUTZ+85kWU4IWoup180gtU0DxrI7KYS+uY/
 jKDUU9THp5iO8XSZ/8Uztt5zNp1JK529YO246ycPrvYRAHPZ6rLgOdk20dXOhBGTkjp6sZE+Q
 /IYXTn9xXO1g7ydg8HawxDXQ5bsGr0uP4piPqFeiES7I8e2KM/e0aJZZ1gMOUtNHQBFBneDfY
 nxKaGrXvCImKVuyjMAadNfw4eKskjKyjgWk9UKTNA3iBwGiLKVncD9YUaYnWfOAgRN/RGjcHv
 NuWQ1DY/oELKA4g+BRaJOY7a3f9T3pxGu126q/345rbppaEweop5tamh15K5Bon+APWmgRpjG
 gxFCMr0BkZ1drixFHx6Zb8QO3e0/N0Th4M1ZGrBNxZ6TXAxY1xYrmDH+J+u73Ku5fuNa/91yi
 tCKwRbYwNXRmFm7tZrU7QPXbxR1bnwg2bVcS9sWXYXhox8I5dCDkf+dSrwwpvW9ElEKjT+ITB
 tDMtPtLf6FY3PES009W9Nh/zZ9Dlp9R7zbozF8lnLlvLN+GPhOz2avW5l5clveR41wKgg1C9b
 y7Tq67eDTyv0nUEqQqTkj5/y3rkrrbqNHjcu/ucmTtuWzY6EsFYFUJx+F+0qhdZPwGNJKmWOH
 qcZdqdXYD6OA5C0C/celxqCwMPeLi5bKzUDlcnVjneQBQnTXQT+wfkWflbFOxk9sdvdIg+6p0
 tD18jfIDAa7eY9RTRrxkSfUBZCXxfQNHzaEyyvOwN75+5YoVdJlXkj1MBZBZoQHD/Ba5wBstn
 Erp/itqYQa+GeJe1GCIyyZYIwiYUGcDDoudUqtMe0zCpM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720443277; x=1721048077; i=ps.report@gmx.net;
 bh=cPyBTfKAv1vNKTQngpsWlU2pJDBXEWHk5Q9nl/67Ff0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=o0lyBW1s0b8XIYTn5S6m/O5xCPpw8Ie5T/FAaWOJQ+ZRrMWLT8xVH1hCh9MYikkh
 YEc2/MTxk4WPjx9Y3z3N826Drtv5Ku9/eVFvVZkHxgw696N1bTG6nmB3n6QuOI0Xc
 taR66QOpx2PHof0H+NJ5hycThCU3WuUTxB5sKqKaM/RPi73kPj8hsshnjtpMzdAn1
 LmdxcFoQ1xcE8GQ1npXNkcHu5CIt3LBwJrEEH4xjshta/B0F1QUGMx3gjq5v8JhbN
 z6RrdEyrIti7qJM6hmB1tkU2jTUhb7tPfnfuz1qsjoW9ITnXf1NMK9MyBrdViIUiv
 wF9i5mAJ8i91P7u11Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=o0lyBW1s
Subject: Re: [Buildroot] [PATCH v2 1/5] package/xz: bump version to 5.4.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter, *,

On Mon, 08 Jul 2024 12:04:08 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>  > On 12/06/2024 15:57, Peter Seiderer via buildroot wrote:
>  >> - add key hint for download signature check
>  >> - update COPYING hash due to [1] (change of home page URL)
>  >> For details see [2].
>
>  >  I've added a statement here to make clear this is not affected by the backdoor.
>
>  >  Peter, this is for 2024.02.x and 2024.05.x.
>
> OK. Looking at https://github.com/tukaani-project/xz/releases/tag/v5.4.7
> I see a mention about a shared library regression on mips64, but I am
> not sure where the mentioned patch can be found?

Do not see an upstream issue nor an suitable upstream patch..., the only
linking issue I know of is from the buildroot autobuilders see
https://lore.kernel.org/buildroot/20240703105013.1bd207f1@gmx.net/
(affects 5.6.2/5.4.7 but not 5.4.6 - and could be fixed by
'XZ_AUTORECONF = YES')...

>
> The 5.4.7 bugfixes do not look very critical, so we could alternatively
> also just not bump the version on 2024.02.x / 2024.05.x.
>

Fine by me...

Regards,
Peter

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
