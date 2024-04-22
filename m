Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5344AC07C79
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 19:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FD1560ABE;
	Mon, 22 Apr 2024 19:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBi3xAMqXwdI; Mon, 22 Apr 2024 19:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 232F66077B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 232F66077B;
	Mon, 22 Apr 2024 19:43:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1D141BF31D
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 19:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA66780C1A
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 19:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQM8CxIWpjpr for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 19:43:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.152;
 helo=mout-p-102.mailbox.org; envelope-from=hypnotoad@lindra.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 178BD80BFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 178BD80BFF
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 178BD80BFF
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 19:43:50 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4VNbK94gCBz9sl7;
 Mon, 22 Apr 2024 21:43:41 +0200 (CEST)
Message-ID: <c8c31e73-4ede-412d-9f77-dcc0a31864db@lindra.de>
Date: Mon, 22 Apr 2024 21:43:39 +0200
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Ralf Dragon <hypnotoad@lindra.de>
X-Rspamd-Queue-Id: 4VNbK94gCBz9sl7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1713815021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xGqPMW7/KVU2osjoK2RPrFP9mQX4wjjcEoxip71OeG4=;
 b=FOl63RjuXZ7omn6zzbRpomO446LupOb70B0QO0FiEXTu3QrxN5g4Byy/kff5iYLN4ywYdH
 csYErdWWT2W7JGu6CeF7zL4+QOHV3NvThJDBzLIZXmvy+LFPwzA8hfzZ8qeIp6Io6wkUjk
 OnfffjISHIq3Khxg+FsS9P4dCXI3j/PMzEuorPBGOxewCYKTgLlEX+xFobJHObEljAa6cL
 hU7r2+nJiCginOkWbgFmFq0YaZocvK5UQ0xqQjJOpFXw97y0B87diJFRps8cIOjLN2mO9d
 x2el+HlxJod2e56XHqOhLrdxt23WdzNsE1lSE7NtOv52bUAjyfwC4GQ8rvlydQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lindra.de header.i=@lindra.de header.a=rsa-sha256
 header.s=MBO0001 header.b=FOl63Rju
Subject: [Buildroot] fixing PyQt5
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear all,

since it seems like my v3 patch [1,2] was overlooked, I would like to 
summarize the situation:

- since approximately a year, PyQt5 in buildroot does not work
- the fix to get it compiling again has been merged in [3]
- my patches [1,2] are still needed during runtime and are not merged yet
- there is an automatic test [4] not yet merged which makes sure that 
this will not happen again

It would be great, if [1,2] and [4] would be merged to finish the topic. 
From my side, every issue has been resolved.

Best,

Ralf

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20240405175454.14431-1-hypnotoad@lindra.de/

[2] 
https://patchwork.ozlabs.org/project/buildroot/patch/20240405175454.14431-2-hypnotoad@lindra.de/

[3] 
https://patchwork.ozlabs.org/project/buildroot/patch/20231212160112.94272-1-hypnotoad@lindra.de/

[4] 
https://patchwork.ozlabs.org/project/buildroot/patch/20240309213348.1646094-1-ju.o@free.fr/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
