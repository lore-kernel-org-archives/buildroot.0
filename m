Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37E2C77B7E
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 01:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2357C40522;
	Sun, 28 May 2023 01:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2357C40522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gU8roLEFrYL; Sun, 28 May 2023 01:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEC92401DD;
	Sun, 28 May 2023 01:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEC92401DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B6501BF947
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 01:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF69E83B90
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 01:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF69E83B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VcesG1_OyvlU for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 01:54:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE2F483B8F
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE2F483B8F
 for <buildroot@buildroot.org>; Sun, 28 May 2023 01:54:26 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96ff9c0a103so302398366b.0
 for <buildroot@buildroot.org>; Sat, 27 May 2023 18:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685238864; x=1687830864;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mxd2INTGk9QrXSXMevj66TmdvjhJz/ntMVqzpVD9QBA=;
 b=KLIFel1sqjTrNM4CMNTJaLrb7lYI1Q6+m5PqqQwRCHGipWNJDFh+zw5OzsFEkBn3ac
 SaiSvXggD3mpt1tDorqm03v32ng6qwdzawXIQgZlJ4BMpFGn5fWnkriG6mJ9gzcCd78X
 2d3NM5QMWGfZB3iWLnHh76ImYqyFNA2zvUh2NXhy+JvJ2imcXWreUu5gTwx4+t75O0/a
 oAQ//Ybqf4aUV5wZ1EauUEnjzgNX+tFBVY/+kdVWq4ZWpWbOgmIM4Lg7pQxaEBit4dSu
 E2uQ2E0W2iDdM5lwVZiPbGHau1ZnLqXBARaj2u0m1DF4KCnYIJ8jDlXufRUnuqo700q0
 Mnig==
X-Gm-Message-State: AC+VfDy6YbtvCXX6qgi+rL00vhi8JrZZM1giFAV5dt0xX3Stl+5PhOz0
 jdFdRr0f1knBeEzpJ4SCd/yaZTL5+sWHur6GWPw/p5/Hfjgqag==
X-Google-Smtp-Source: ACHHUZ5UzthCpCB970KvKmH/7T+QWgqsS2ZuQMGsQvXQIRrozJFMnD3pKve35F4670CPFwue1nGKe1wZxYcM7knZi14=
X-Received: by 2002:a17:907:3e0c:b0:96f:de0b:847a with SMTP id
 hp12-20020a1709073e0c00b0096fde0b847amr7114996ejc.37.1685238863809; Sat, 27
 May 2023 18:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <6471963e.df0a0220.90218.04d6SMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <6471963e.df0a0220.90218.04d6SMTPIN_ADDED_MISSING@mx.google.com>
From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 28 May 2023 13:54:11 +1200
Message-ID: <CAFOYHZCy4CO+Db++9iEDQMRh58STDiLKDU1KRQLEEdCNz6W4WQ@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685238864; x=1687830864;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mxd2INTGk9QrXSXMevj66TmdvjhJz/ntMVqzpVD9QBA=;
 b=M6+QVqwxacgQHrAQCReMnIaAdWACrqj8dEHBUA5tUmwmzUxiWDeAYZlov7Vb/HAPqT
 yqjpWhlCmZC95/SyeM70P2MaM9RNWEsAhrnUqwu9ILrPJxDLdzUnzhHWMmOF9QF6iiT0
 qlG3c1ERprQLWKFs56WbbQNBoG69mjOICOiq0beppqBLO0zBvLGALFctZhsxhqojGPB0
 Uv/O+CtjmiNlN3Mw3QKFDstPU/BfGpzXihdu5mjL4fhAMqsCJ0ylH+uYBK84/q0lnZQs
 CMflUxFUj7XM0trXqvx2tWV3ULH+6M6QRm2Tn3gu9WHGNrmF6rCqqWQrukz9AowREIMU
 9X/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=M6+QVqwx
Subject: [Buildroot] syslog-ng failures related to python modules
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

I've had some time to look into failures like

>  powerpc64   |        syslog-ng-4.1.1         | http://autobuild.buildroot.net/results/e9d3aee88c6da2a490c349e218adbaa5ea826d27

The failure is

WARNING: There was an error checking the latest version of pip.
WARNING: pip is configured with locations that require TLS/SSL,
however the ssl module in Python is not available.
WARNING: Retrying (Retry(total=4, connect=None, read=None,
redirect=None, status=None)) after connection broken by
'SSLError("Can't connect to HTTPS URL because the SSL module is not
available.")': /simple/cachetools/
WARNING: Retrying (Retry(total=3, connect=None, read=None,
redirect=None, status=None)) after connection broken by
'SSLError("Can't connect to HTTPS URL because the SSL module is not
available.")': /simple/cachetools/
WARNING: Retrying (Retry(total=2, connect=None, read=None,
redirect=None, status=None)) after connection broken by
'SSLError("Can't connect to HTTPS URL because the SSL module is not
available.")': /simple/cachetools/
WARNING: Retrying (Retry(total=1, connect=None, read=None,
redirect=None, status=None)) after connection broken by
'SSLError("Can't connect to HTTPS URL because the SSL module is not
available.")': /simple/cachetools/
WARNING: Retrying (Retry(total=0, connect=None, read=None,
redirect=None, status=None)) after connection broken by
'SSLError("Can't connect to HTTPS URL because the SSL module is not
available.")': /simple/cachetools/
Could not fetch URL https://pypi.org/simple/cachetools/: There was a
problem confirming the ssl certificate:
HTTPSConnectionPool(host='pypi.org', port=443): Max retries exceeded
with url: /simple/cachetools/ (Caused by SSLError("Can't connect to
HTTPS URL because the SSL module is not available.")) - skipping
ERROR: Could not find a version that satisfies the requirement
cachetools==4.2.4 (from versions: none)
ERROR: No matching distribution found for cachetools==4.2.4
WARNING: pip is configured with locations that require TLS/SSL,
however the ssl module in Python is not available.
Could not fetch URL https://pypi.org/simple/pip/: There was a problem
confirming the ssl certificate: HTTPSConnectionPool(host='pypi.org',
port=443): Max retries exceeded with url: /simple/pip/ (Caused by
SSLError("Can't connect to HTTPS URL because the SSL module is not
available.")) - skipping


The basic problem is that the newer version of syslog-ng has some
additional python dependencies but its install process can't resolve
the dependencies.

I can see the problem with the following (after a failed build)

$ . output/build/syslog-ng-4.1.1/venv/bin/activate
$ python3 -m ssl
Traceback (most recent call last):
  File "<frozen runpy>", line 198, in _run_module_as_main
  File "<frozen runpy>", line 88, in _run_code
  File "/home/chrisp/src/buildroot/output/host/lib/python3.11/ssl.py",
line 100, in <module>
    import _ssl             # if we can't import it, let the error propagate
    ^^^^^^^^^^^
ModuleNotFoundError: No module named '_ssl'

It looks like something (not sure what) has conveniently setup a host
python wrapper (this config doesn't build host python3) but however it
was populated it did not include the _ssl module (which looking on my
system is a dynamically loaded .so). I'm a little unsure as to how to
proceed with this. I could unconditionally disable python support in
syslog-ng or make it depend on host python3 but I suspect this isn't
the only package that is doing such things so I thought there might be
a better solution.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
