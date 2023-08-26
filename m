Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE92C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 21:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97FAF60ABE;
	Sat, 26 Aug 2023 21:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97FAF60ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O2z4nORCidOq; Sat, 26 Aug 2023 21:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D08C26077D;
	Sat, 26 Aug 2023 21:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D08C26077D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0391BF283
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 21:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC5660ABE
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 21:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC5660ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nW4BgmMN5zhA for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 21:39:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73D526076C
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 21:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D526076C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 313CFE0004;
 Sat, 26 Aug 2023 21:39:16 +0000 (UTC)
Date: Sat, 26 Aug 2023 23:39:15 +0200
To: erichiggins@gmail.com
Message-ID: <20230826233915.2e1a535a@windsurf>
In-Reply-To: <CAHfxMJ6M-R8oHY-8ChxdhanpcL2_04mYARHSxW=YS_gw7Npctg@mail.gmail.com>
References: <CAHfxMJ6M-R8oHY-8ChxdhanpcL2_04mYARHSxW=YS_gw7Npctg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693085956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVI3EeRYpNnFjevVbbZT8if4XpCqYhYTc0ltpM9oamo=;
 b=MtRk2VZw6TPENHNP5DWzyMx1TBcYtD6BCw1asWu8qUc0OBIViUFLZIXtJZbCFRAA1nAUyS
 sgPAU8iISariAsupjkNif0DtPFSJv+P3zz8kdNRE1m4XmCPQ2wkOi/b3VCNKpy0iHHvR9H
 Q/tZ9rs5JExWEkvCMY3qxg1pzDduUDb1ZzRkVfks1DJSCFNAOe3iMMka81KQWswknYOSYE
 eoMON7PUNbQMEjGw53FFowdys234D9FwI8fEiU2n1s4FQPxgpI0S7EBt8N3nTBR4PmEcFH
 HhHb4fjXuAgMTx/vKVRSsJXJVzHD38tUIWfWHsMlPqmN1QT8u4mGVgW+8E/MaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MtRk2VZw
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: supply package name to
 setup() when not provided
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Eric,

+James in Cc.

Sorry for the super long lag.

On Sun, 18 Sep 2022 12:48:31 -0700
erichiggins@gmail.com wrote:

> Issue description:
> The `utils/scanpypi` script makes an erroneous assumption that Python
> packages will call `setup()` with the `name` argument. It's not
> required and not often used. This causes the script to fail to load
> many packages from Pypi.
>  For example,  `./utils/scanpypi wheel` returns the following error:
> > `Error: Could not install package wheel: 'name'`  

Do you have a current example that fails due to this? The wheel package
does pass a name= attribute to its setup() function, and it has been
doing this for many years. Looking at the initial commit of
https://github.com/pypa/wheel:

diff --git a/setup.py b/setup.py
new file mode 100644
index 0000000..09a138e
--- /dev/null
+++ b/setup.py
@@ -0,0 +1,33 @@
+import os
+
+from setuptools import setup
+
+here = os.path.abspath(os.path.dirname(__file__))
+README = open(os.path.join(here, 'README.txt')).read()
+CHANGES = open(os.path.join(here, 'CHANGES.txt')).read()
+
+setup(name='wheel',
+      version='0.1',
+      description='A built-package installer for Python.',
+      long_description=README + '\n\n' +  CHANGES,
+      classifiers=[
+        "Development Status :: 1 - ",
+        "Intended Audience :: Developers",

So I'm a bit puzzled at how you found a wheel package that doesn't pass
"name" in its setup() arguments.

> diff --git a/utils/scanpypi b/utils/scanpypi
> index 452b4a3fc3..a5522a879e 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -58,8 +58,9 @@ def setup_decorator(func, method):
>      def closure(*args, **kwargs):
>          # Any python packages calls its setup function to be installed.
>          # Argument 'name' of this setup function is the package's name
> -        BuildrootPackage.setup_args[kwargs['name']] = kwargs
> -        BuildrootPackage.setup_args[kwargs['name']]['method'] = method
> +        name = kwargs.get('name', BuildrootPackage.setup_args['name'])
> +        BuildrootPackage.setup_args[name] = kwargs
> +        BuildrootPackage.setup_args[name]['method'] = method
>      return closure
> 
>  # monkey patch
> @@ -147,6 +148,7 @@ class BuildrootPackage():
>          self.url = None
>          self.version = None
>          self.license_files = []
> +        self.setup_args['name'] = self.real_name

I'm not a big fan of shoehorning 'name' in setup_args, which as I
understand it is a dict that should contain a single key named after
the package. Perhaps it would be better to make "self.real_name" a
class variable rather than an instance variable, just like setup_args
is already, so that setup_decorator can access it. If I understand the
current implementation correctly, it anyway expects the
BuildrootPackage() class to have only one instance.

What do you think?

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
