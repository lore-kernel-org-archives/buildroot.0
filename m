Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D9CC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 16:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84C3D811A6;
	Sat, 25 Jan 2025 16:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQLujVuf39Z5; Sat, 25 Jan 2025 16:04:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E62A8118E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E62A8118E;
	Sat, 25 Jan 2025 16:04:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74BBD94A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 16:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6292E40442
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 16:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99lVRb2hdv8M for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 16:04:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 480574017A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 480574017A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 480574017A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 16:04:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 89FD013F8A7;
 Sat, 25 Jan 2025 17:04:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57966])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 17:04:24 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 17:04:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20250124211325.3873333-1-james.hilliard1@gmail.com>
References: <20250124211325.3873333-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e17353d3f79802f74900c122c2c2b9fb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737821066;
 bh=ueanRZvk7tfcczxAtyDjhyGny3O2zX/lsQSz/qBmZdE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LeGDAySJgopzUm5DZswm1E3R8/SOvllxkRks8C5K3gTJ4xJYKaITBX97lWMEnJicl
 LwOA4d07dFIhE8Y5TIsU3xrLV085BegkpwRtntd/J2eQdqOoXTiUwe1sCMSGtlZ5wG
 3wtLrD1p1pcwsGBV04jWCXTcaggc0dbRndZfkLIiY7AJRXjsDq01AjwFfDgJTP7Y4j
 Y4yN+8p9XOLh9VrVBU9Jz7RklDKzvfYMxbj9fPYV5y/XKmBQ8sAFir860bH4oK1VVA
 5UZEk5GAZGzT9SXMB03Z1Ff+0FNEiGuZy/k0v6hvP4mBbcLdprgYTMGvc4NZmEGXRG
 Ys8IkY/cygqZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LeGDAySJ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-web2py: bump to
 version 3.0.11
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

Hi James,

Thank you for the patch.

On 24/01/2025 22:13, James Hilliard wrote:
> Drop patch which is now upstream.
> 
> License file renamed without content changes.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Trying to build the package with this patch is failing for me,
with output:

     >>> python-web2py 3.0.11 Building
     /buildroot/output/host/bin/python -c 'import os; 
os.chdir("/buildroot/output/build/python-web2py-3.0.11"); from 
gluon.main import save_password; save_password("web2py",8000)'
     Traceback (most recent call last):
       File 
"/buildroot/output/build/python-web2py-3.0.11/gluon/__init__.py", line 
143, in import_packages
         sys.modules[package] = builtins.__import__(package)
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     ModuleNotFoundError: No module named 'rocket3'

     During handling of the above exception, another exception occurred:

     Traceback (most recent call last):
       File "<string>", line 1, in <module>
       File 
"/buildroot/output/build/python-web2py-3.0.11/gluon/__init__.py", line 
148, in <module>
         import_packages()
       File 
"/buildroot/output/build/python-web2py-3.0.11/gluon/__init__.py", line 
145, in import_packages
         raise RuntimeError(MESSAGE % package)
     RuntimeError: web2py depends on rocket3, which apparently you have 
not installed.
     Probably you cloned the repository using git without '--recursive'
     To fix this, please run (from inside your web2py folder):

          git submodule update --init --recursive

     You can also download a complete copy from http://www.web2py.com.

Can you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
