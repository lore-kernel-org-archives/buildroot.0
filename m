Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D79C021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 03:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C720D80D2F;
	Fri, 14 Feb 2025 03:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Y66EkhCjvRO; Fri, 14 Feb 2025 03:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B14C80D06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B14C80D06;
	Fri, 14 Feb 2025 03:44:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C598C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4320641255
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZ-jc75NQ9uq for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 03:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AF22408F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AF22408F1
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AF22408F1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:44:27 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C0CA53520847; Fri, 14 Feb 2025 04:44:24 +0100 (CET)
Date: Fri, 14 Feb 2025 04:44:24 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Scott Fan <fancp2007@gmail.com>
Message-ID: <Z668GPE9/vZROlga@waldemar-brodkorb.de>
References: <20250212135027.759121-1-fancp2007@gmail.com>
 <20250213045050.816782-1-fancp2007@gmail.com>
 <c281fbe54e343bcc61c8e08e623e10a0@free.fr>
 <Z652OsALpn1B5OJR@waldemar-brodkorb.de>
 <CAFkzVZbMTHBqRm1ABAnqMvRBCHGqT_MK9E4wZL+ieLf__e=T7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFkzVZbMTHBqRm1ABAnqMvRBCHGqT_MK9E4wZL+ieLf__e=T7A@mail.gmail.com>
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1739504664; bh=8XeEiIr6v0wDLzBPiCHiFN3oZtZCdg7Ch+nF3cCzz2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KRQNcE2/8RliZLy6DNuzbm3x9l9VsFQBp5EmYEbn+G9QrjfgeN3xT2cdQc+cFJcBI
 aiebi0loJoKd21naZG7QDMIqDdW8i85Z/jGXOXwW12zEoP2lx7w+lIIwoCkj0pIRbi
 TJpK8BHQgHFh2sPghypmbr2RHgXLTSRbOsMsgytBsEot39oJjaHhEluhEV+REUnoZh
 Lt2zrbl+lUKuVP1aT41RireAlZ01fxwaPZFQ1HO9Eb43tB8+HtApK4LnvYdYXpbkW4
 HSAfm6gHjgCXGKDobAdmogEAQn11RJxrBI2b2Or4P3vdlWIPsMMOSBP+hgFmIok9UM
 lC53//LYGGzdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=KRQNcE2/
Subject: Re: [Buildroot] [PATCH v2] package/sqlite: fix build issue since
 bump to 3.49.0
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
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Scott,
Scott Fan wrote,

> Hi Waldemar,
> 
> Thank you for your feedback.
> 
> I have sent a new patch to fix it, see the link below:
> https://patchwork.ozlabs.org/project/buildroot/patch/20250214021416.392363-1-fancp2007@gmail.com/
> 
> Could you take a moment to test this patch for your work? thanks.

Thanks for the fast patch. But it now fails when compiling shell.c:
/home/wbx/buildroot/output/host/bin/aarch64-buildroot-linux-gnu-gcc -o sqlite3 \
	shell.c sqlite3.c \
	-I. -DSQLITE_ENABLE_MATH_FUNCTIONS -DSQLITE_OMIT_JSON -DSQLITE_THREADSAFE=1 -DHAVE_READLINE=1 -DSQLITE_HAVE_ZLIB=1 -DSQLITE_OMIT_READLINE_COMPLETION \
	-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/home/wbx/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include  \
	 -Wl,-rpath,/usr/lib  -lm  -lz   -ledit -lncurses
shell.c:151:11: fatal error: readline/readline.h: No such file or directory
  151 | # include <readline/readline.h>
      |           ^~~~~~~~~~~~~~~~~~~~~
compilation terminated.

The configure command puts out:
   NOTE: the local libedit but uses <readline/readline.h> so we
    will compile with -DHAVE_READLINE=1 but will link with
    libedit.

thanks for working on it.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
