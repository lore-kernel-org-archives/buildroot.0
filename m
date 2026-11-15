Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA4606A8A1
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 19:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=etQWxxTj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org header.a=rsa-sha256 header.s=ciao2026 header.b=PdehLnEo
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7147880E3F;
	Sun, 15 Nov 2026 19:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ys_7OD2vB4EA; Sun, 15 Nov 2026 19:32:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 876F980E45
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794771131;
	b=huE+463TxsCUqwgre+Q8PSQqV4I08pfAxHFxOSHYZOL+frkt+2dHYZkC3f/SAIv+pP5y
	 dGJ5E1a74XNextxceYeblSRn3CLba87mgUnVn3A5bUf0uB6BFotjiiV1ltCl9DedVp/ek
	 nh2K5M3IlopF5LICsLijt1y2Mm1coybfBsJVfxnJ82023mo/PDLLb5Hc+zilQaXohjFB0
	 QaGZ/CYHb0+5y5rGUX/aIv355qKQ3hjqJdSVsvTo+WnolW/W92vu+mamp53R1w9jZtQ+q
	 /ROHp3ttZvkchBT4cE+DMy2y8LiO5xrA0qRZLCP1tuPBWsjTZugRi8rkBKwgjJhJykQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794771131;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:X-Injected-Via-Gmane:To:From:Date:Message-ID:
	 References:MIME-Version:User-Agent:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Jp89r7Ifg5fnD7sKoQMJnO5B8gbB8Obtj+nshEqzvKk=;
	b=PB95MYVK6RUtMVQEmy7RoCv8Yf8JdZ8EowuyeAh51ZCtl12OAzVZg56cV5hEtwIWTS20
	 f7LmRx1dwUgFoEAvxUf/2Rw1DUe7CI2V/QSDii1UD1V3IY7Ce2ABf8e2wA4AiLb7dy48g
	 XBQbxrG8qlKOHGddAYp5wWTuF+jmu0TEoDQnoyYJG3C4FU9dVuVEKjR6XQ3WOoz+ofcgG
	 I0Lymv8ueGt8oLeEnxf6tYNFcrBhIGoMdLdMlWtTBSNbwms9UEPi/Cbb8kX8OZWsX3GQF
	 4eu0AbOaLZ4DnpbIOlkNnhnvSTuuaYvmVXWJieyF+kHdxtM8CBQjDDRC6z24JlFrZVg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794771131;
	bh=Jp89r7Ifg5fnD7sKoQMJnO5B8gbB8Obtj+nshEqzvKk=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=etQWxxTjViIz0O/xro64P9VRMVSdi0hPbXTzHHUcpgHHv+I2YMSLsTDfBFgLw+Kij
	 kCFBa2wkSNI9V/XKTx2lR+WqHOJjQ+cYoa1mkSdz6egcLK1CT+51GeS+LXsI+YQGh9
	 HoDQM1t+W6os0mPhzQlpMaPgOzc4GKN/Xr4zEWQ1bJYtiunlpMBFzxco5llKctoa20
	 SdA03pr5XPdInU60uB4gAHkBD45T+zJUA7gUp5upx2UWqU3BpBrmjSzQflA1Zp4EOl
	 d+X4DbEP+480s/CHQ5NyOmSAti9oMnIXPg+J6A41RwDJFUnz7+RHHzM0SjzH/BPthB
	 Q2hjNRpD2WAvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876F980E45;
	Sun, 15 Nov 2026 19:32:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98624D7
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E2AD40061
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 19:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKTraxxGw1zW for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 19:32:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 755AB40048
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=49.12.148.96
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=49.12.148.96;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org
 header.a=rsa-sha256 header.s=ciao2026 header.b=PdehLnEo
Received: from ciao.gmane.io (ciao.gmane.io [49.12.148.96])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 755AB40048
 for <buildroot@uclibc.org>; Sun, 15 Nov 2026 19:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=m.gmane-mx.org; s=ciao2026; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Date:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wiFUQvp6hq4FqQUM9W7KbQR6Y4deAjVkNhWv59+kcyM=; b=PdehLnEoyu2+yUJyxMFxSkJ3Pg
 o6ms+zxkhM4UnB4lmbqLmlBjx9Zi4svjz489hZi6ccu2Tyq6dQVgMEvWnyhiJizowYrdhgNi6R3xe
 mlOoxYHAJkZdg0SePHZwaqOUrCh6OjDcRLKstdmB2feKWVC5OPb4St1Os/dxFGZlJn5KhHdY5ja17
 FBauvI0jUnfrdJhQ7taOxciyehPc/tQNY2ju4fwsr8T1YeMy7yIZyLxZ4QLtO4D3M5eMrgP7aC3vH
 +kssayDdlnDvT8JwkNhcfO+eDIKIPw3v6esHy/soJgcWEo8sixXSNKO66Spfk6AxdmHYoX40QaIPH
 ASbtoOxA==;
Received: from list by ciao.gmane.io with local (Exim 4.98.2)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>)
 id 1xSfxO-0000000EYsE-0OU4 for buildroot@uclibc.org;
 Sun, 15 Nov 2026 20:32:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 15 Nov 2026 20:31:05 +0100
Message-ID: <pan$b1c4e$58403c2c$d65bd829$341f0824@ID-313208.user.individual.net>
References: <20261115174621.3986836-1-bernd@kuhls.net>
 <877biedj40.fsf__35447.6860187546$1794768661$gmane$org@tarshish>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: add optional dependency
 to ncurses
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Sun, 15 Nov 2026 20:50:39 +0200 schrieb Baruch Siach via buildroot:

> Do you have an idea how this symbol test found ncurses in CI test?

Hi Baruch,

yes, the docker image contains the necessary files:

$ find  output_folder/ -type f | grep "libncurses\|termcap"
output_folder/TestStrace/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/
libncurses.so.6.6
output_folder/TestStrace/host/arm-buildroot-linux-gnueabi/sysroot/usr/
include/termcap.h
output_folder/TestStrace/host/opt/ext-toolchain/lib/libncursesw.so.6.6
output_folder/TestStrace/host/opt/ext-toolchain/arm-buildroot-linux-
gnueabi/sysroot/usr/lib/libncurses.so.6.6
output_folder/TestStrace/host/opt/ext-toolchain/arm-buildroot-linux-
gnueabi/sysroot/usr/include/termcap.h

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
