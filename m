Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94AAC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 10:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38563417B6;
	Mon,  8 Aug 2022 10:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38563417B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zk6XS9k0yelO; Mon,  8 Aug 2022 10:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8CFB41708;
	Mon,  8 Aug 2022 10:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8CFB41708
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE7311BF36D
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8921D60E13
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 10:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8921D60E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5C62C5h8vr6 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 10:20:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1323060E15
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1323060E15
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 10:20:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 701412000A;
 Mon,  8 Aug 2022 10:20:21 +0000 (UTC)
Date: Mon, 8 Aug 2022 12:20:20 +0200
To: Federico Pellegrin <fede@evolware.org>
Message-ID: <20220808122020.0c1ec66a@windsurf>
In-Reply-To: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
References: <CAM6O0Zgc_jfn+m1ZhRByLQ4QDDAYpAOQv-9aDRgruSYKWV5wUA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659954022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kp9IjKf7Xltu6RPbxIpYXfVUntb0YeH7W9WveXeqVYk=;
 b=l2gyPPj2tTJrZjyxNwxKzDepkIjM/BpqaPP0lCAD2o/DXSZ2ty0tp8nTSD5vXWLHEG+zso
 X+/kCl5MmCu5Lz/jnFvJYODglunUXeWcWFX5QhyUSxLolVYQj2XDD2uIYIYLJUqtOb5Aw3
 TGVuFoBuMkAH3XLynM/rbCHrgCheyek0Tohp77O9YuVKqLjsVs3RLs790rIgns9G9yRU4W
 eenufxb80huv+ckC+itSRVCzf8PCC+N6rNu3xsEe64s/Nhz93NVODyjLt+yoZaEwux+chg
 Lr4ikoj6ifa2Fclc4omNdr6FJjuh/IG85drJziLLxvJdZVMlMbJsg7W4PjUWrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l2gyPPj2
Subject: Re: [Buildroot] Python pyc only and problem with scripts
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Federico,

On Mon, 8 Aug 2022 09:40:02 +0200
Federico Pellegrin <fede@evolware.org> wrote:

> I've found a minor problem related to the rt-tests package, but that maybe
> is slightly more generic and wanted to report and in case understand which
> approach would be best to fix it (and contribute a patch then if possible).
> 
> The specific problem: rt-tests, besides a few compiled executables,
> installs also two tools which are written in Python, namely hwlatdetect and
> get_cyclictest_snapshot. These are Python scripts which get installed in
> the PYLIB and then a symbolic link is done from /usr/bin to them, so ie we
> have: /usr/bin/hwlatdetect ->
> /usr/lib/python3.10/site-packages//hwlatdetect.py
> 
> Needless to say that once the pycompile.py script is run and original .py
> files are removed, of course in the "PYC only" setup (which is the
> default), then the link is broken and it will not work.
> Additionally that pyc files will not work for scripts like that, so just
> somehow fixing the link mentioned above would anyhow not work, as you need
> to execute them eventually by explicitly naming the interpreter.
> 
> I could imagine that we could have some similar other cases when we are
> installing Python scripts directly executed in PYLIB and not modules. But
> I'm not sure that installing the scripts there is a good idea as well,
> comparing with other distros that doesn't seem to be the case.
> So maybe the problem is really in rt-tests after all and the location those
> scripts get installed and I may just fix it that way (and contact upstream)?
> Otherwise should it be more generic maybe could make sense to have a
> facility to list some files that should not be converted to PYC?

Thanks for your bug report.

My initial gut feeling would indeed be that it is strange to install
scripts in /usr/lib/python, and they should be installed in /usr/bin
instead, so that /usr/lib/python is only for Python modules that can be
byte-compiled. However, I am not an expert at all in terms of Python
best practices and latest standards.

But from a Buildroot perspective, it really makes a lot of sense to be
able to do the byte-compilation at build-time (to save on startup time)
and drop the .py files (to save on filesystem footprint).

For the rt-tests case, I would therefore suggest to move those scripts
to /usr/bin.

Of course, if that problem shows up in more packages, then yes we could
think of a mechanism for packages to declare a number of py files that
should not be byte-compiled, and that should be preserved on the target.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
