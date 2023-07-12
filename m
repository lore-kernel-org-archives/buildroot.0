Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44EFEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51B004062C;
	Wed, 12 Jul 2023 19:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51B004062C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Cu3gvgC8S8D; Wed, 12 Jul 2023 19:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1727D4067F;
	Wed, 12 Jul 2023 19:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1727D4067F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4941BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38DB882211
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38DB882211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DG7dO_HLN7BD for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:44:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F2982204
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7F2982204
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:44:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB7431BF205;
 Wed, 12 Jul 2023 19:43:58 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:43:57 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230712214357.2e04f24d@windsurf>
In-Reply-To: <20230609174955.409551-1-romain.naour@gmail.com>
References: <20230609174955.409551-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689191050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tByytbo8EXB2YNtM3P31euz7VBaglpkJAAJk8zPcmkg=;
 b=GuQKVeCOLujFtEarZnZDyNFasJihRGYTSzhcirFGfH14rMp7Z0eeUN3MCCs5dMO+mgDoDS
 /q8lMQ8sae/7FtR37Srv1D1USsfx64NUqeXu2WqK04GJmc0YQ/1d4EVKAe62dymroyNNYY
 UlUfvqt4i1Q+7gu5EK6BDOpcoHJ1WazjqPdTNCKIoGsQ8hTx953ONPq7q0VntvFeBr3ybu
 +YPJcVP7rL/mxKYwe4qDY3sxS/as41BVyo/hmf6K3KWUmnxswxJOI/VyWiLBSXRG+c5TvQ
 CA60hQqyx9xRPIsrG07fwpXuiphYT8pZHlHIEzxdyZSmISK1zvQ4TF5rWgJZ5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GuQKVeCO
Subject: Re: [Buildroot] [PATCH 1/4] support/testing: add python-mako
 runtime test
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Fri,  9 Jun 2023 19:49:52 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> This new runtime test allows to reproduce the issue
> reported by https://bugs.busybox.net/show_bug.cgi?id=15628
> with a simple python script.
> 
> Traceback (most recent call last):
>   File "/bin/piglit", line 107, in <module>
>     import framework.programs.summary as summary
>   File "/usr/lib64/piglit/framework/programs/summary.py", line 30, in <module>
>     from framework import summary, status, core, backends, exceptions
>   File "/usr/lib64/piglit/framework/summary/__init__.py", line 31, in <module>
>     from .html_ import html, feat
>   File "/usr/lib64/piglit/framework/summary/html_.py", line 37, in <module>
>     from mako.lookup import TemplateLookup
>   File "/usr/lib/python3.11/site-packages/mako/lookup.py", line 13, in <module>
>   File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 292, in <module>
>   File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 289, in _install_highlighting
>   File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 277, in _install_fallback
>   File "/usr/lib/python3.11/site-packages/mako/filters.py", line 14, in <module>
> ModuleNotFoundError: No module named 'markupsafe
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

I'm unclear on a number of things:

- How does this interact with the patch proposed by Sebastian at
  https://patchwork.ozlabs.org/project/buildroot/patch/20230608140933.1814667-1-sebastian.weyer@smile.fr/,
  which takes a different approach ?

- How does your patch series fixes bug #15628 ? The patch from
  Sebastian fixes it, but not your series as far as I can see.

- I don't see in your series what ensures that the test
  TestPythonPy3Mako properly works. It would work with Sebastian patch
  applied, but Sebastian's patch collides with your series because
  Sebastian patch makes BR2_PACKAGE_PYTHON_PYGMENTS a mandatory
  dependency of python-mako, while your patch series makes it an
  optional dependency, enabled when
  BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN is enabled.

I might not have grasped the full scale of the issue, but my feeling is
that:

- python-mako needs markupsafe unconditionally, as demonstrated by your
  test TestPythonPy3Mako. So python-mako should unconditionally select
  BR2_PACKAGE_PYTHON_MARKUPSAFE

- python-mako only needs pygments/babel as optional dependencies so
  your patches 2/4 and 3/4 are fine

- in order to fix bug #15628, we need to ensure that the piglit package
  selects BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN, so that
  python-mako is installed with pygments support

Does that make sense ?

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
