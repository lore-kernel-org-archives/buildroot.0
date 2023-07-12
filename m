Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3247EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F88740856;
	Wed, 12 Jul 2023 19:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F88740856
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cp6_iNrxRfH; Wed, 12 Jul 2023 19:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC7774086A;
	Wed, 12 Jul 2023 19:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC7774086A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A66031BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70B444086A
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70B444086A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNIOXhtGoZMv for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:46:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADEEE40856
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADEEE40856
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:46:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7839C40009;
 Wed, 12 Jul 2023 19:46:14 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:46:13 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230712214613.32816a8f@windsurf>
In-Reply-To: <20230712214357.2e04f24d@windsurf>
References: <20230609174955.409551-1-romain.naour@gmail.com>
 <20230712214357.2e04f24d@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689191174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=blWAYWyhs0eWcXJH4VyeRjlD6KRd2TX1+vu+cm9aMIc=;
 b=B068lrRty6bqLOdt5Gd8yI9iY0Jw6JDjQlGlnma9hVm3Avdp9vanzuFIpMRIe+rwF7JFNU
 c5i+3ClKV2+91ltjN84o6cvBQhb/Oo6tvzgp1TfiAK7Jjc7dRpSK+c3ir/cf1dDPZN2quf
 1e4+J+rrp8HV2LI2Svz3tYvDjFI6ORf0vMXEeRNOZjJ6XQP4kHZimhBWOJuqtlf3jh2IV0
 kkhMifqyuzkdzDUGgZSrzVIqSajbICxE7G3Bc5VfmZ6hJB0B1eOVtg3SkCzyP5cpI4LHuV
 S1rtKaDnkmWd3iAutwQtpJOiufTEPfzJ//zc3WdFD+T8kwF2o+Ww8sODJSulkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B068lrRt
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

On Wed, 12 Jul 2023 21:43:57 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I might not have grasped the full scale of the issue, but my feeling is
> that:
> 
> - python-mako needs markupsafe unconditionally, as demonstrated by your
>   test TestPythonPy3Mako. So python-mako should unconditionally select
>   BR2_PACKAGE_PYTHON_MARKUPSAFE
> 
> - python-mako only needs pygments/babel as optional dependencies so
>   your patches 2/4 and 3/4 are fine
> 
> - in order to fix bug #15628, we need to ensure that the piglit package
>   selects BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN, so that
>   python-mako is installed with pygments support
> 
> Does that make sense ?

I got it wrong, your basic test shows that both pygments and markupsafe
are needed for a basic usage of python-mako:

$ ./support/testing/run-tests -o ../outputs/ -k tests.package.test_python_mako.TestPythonPy3Mako
21:32:04 TestPythonPy3Mako                        Starting
21:32:04 TestPythonPy3Mako                        Building
21:34:55 TestPythonPy3Mako                        Building done
21:35:01 TestPythonPy3Mako                        Cleaning up
F
======================================================================
FAIL: test_run (tests.package.test_python_mako.TestPythonPy3Mako)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/thomas/buildroot/buildroot/support/testing/tests/package/test_python.py", line 137, in test_run
    self.run_sample_scripts()
  File "/home/thomas/buildroot/buildroot/support/testing/tests/package/test_python.py", line 132, in run_sample_scripts
    self.assertRunOk(cmd, timeout=self.timeout)
  File "/home/thomas/buildroot/buildroot/support/testing/infra/basetest.py", line 95, in assertRunOk
    self.assertEqual(
AssertionError: 1 != 0 : 
Failed to run: python sample_python_mako.py
output was:
  Traceback (most recent call last):
    File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 287, in _install_highlighting
    File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 271, in _install_pygments
    File "/usr/lib/python3.11/site-packages/mako/ext/pygmentplugin.py", line 7, in <module>
  ModuleNotFoundError: No module named 'pygments'
  
  During handling of the above exception, another exception occurred:
  
  Traceback (most recent call last):
    File "/root/sample_python_mako.py", line 1, in <module>
      from mako import runtime
    File "/usr/lib/python3.11/site-packages/mako/runtime.py", line 15, in <module>
    File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 292, in <module>
    File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 289, in _install_highlighting
    File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 277, in _install_fallback
    File "/usr/lib/python3.11/site-packages/mako/filters.py", line 14, in <module>
  ModuleNotFoundError: No module named 'markupsafe'

----------------------------------------------------------------------
Ran 1 test in 177.157s

FAILED (failures=1)

So to me it looks like the patch from Sebastian is correct, and
therefore your PATCH 2/4 adding an option to enable pygments support
does not make sense because pygments is needed unconditionally by
python-mako.

Thoughts?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
