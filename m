Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FC2C3A59D
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 16:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDA7881494;
	Sun, 23 Oct 2022 16:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDA7881494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HM9POx7HGCSH; Sun, 23 Oct 2022 16:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93FED81490;
	Sun, 23 Oct 2022 16:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93FED81490
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5E6F1BF4D5
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 16:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FDC94085B
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 16:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FDC94085B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kYFiqlxxkET for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 16:51:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47FEC4081F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47FEC4081F
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 16:51:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2ae:5e11:f166:1b85])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C03C5B0052C;
 Sun, 23 Oct 2022 18:51:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Oct 2022 18:51:00 +0200
Date: Sun, 23 Oct 2022 18:51:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Oguz Ozhan <oguz.ozhan@mind.be>
Message-ID: <20221023165100.GB1058960@scaer>
References: <20221021091531.2989489-1-oguz.ozhan@mind.be>
 <20221021091531.2989489-2-oguz.ozhan@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021091531.2989489-2-oguz.ozhan@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666543865;
 bh=8XNgb7oN021K2hRbIcweZemvcnB/OwvK6LQ+LD9sZ0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E8m0tX7oy16qFgYRZn1X9B4DhUErA1MJJ6WOwIGYA8JFUuMmg8zORArFrzPrD4JP5
 X7P4/uTQQzQnVfK3WIyJWXRmmucnhkz3c3atnovIm3tk9AUZbqKpYTEeDi08/hj/TH
 kpmKxGdeSOWDDSsrMmas1YbAMYZpT13MdJgU8JALsvPS5q2/oSyFByn0196L0zIwQy
 zhlg2cE0mBdBJtArFWTACgV+a4hErdACRXwGAKNlEjCxjExJKDk6dhyLEbJisHAppS
 SD3M5Jzn9wSFKw3gbkQkjsj5IkfWLNV5BA7tiwsUlnZlFDOsuofiM6v8WTz4rJvRM3
 7cGFi0wq3eYuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E8m0tX7o
Subject: Re: [Buildroot] [PATCH 2/3] support/testing: replace nose2 with
 pytest - run-tests
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
Cc: Oguz Ozhan <oguz.ozhan@mind.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Oguz, All,

On 2022-10-21 11:15 +0200, Oguz Ozhan spake thusly:
> From: Oguz Ozhan <oguz.ozhan@mind.com>
> 
> - From web page of nose2:
> (https://docs.nose2.io/en/latest/)
> nose2 vs pytest:
>   - pytest is an excellent test framework and we encourage users to consider it for new projects.
>   - It has a bigger team of maintainers and a larger community of users.
> 
> - pytest is more robust and has more ability compared to nose2

Please see my comment in patch 1 about providing a rationale for the
switch.

Please fold your commit logs at 72 chars.

> - Changes in this patch:
>   - run-tests modified to use pytest instead of nose2 to call tests. A corresponding Collector class added for pytest to list the available tests
>   - nose2 plugins removed which are not required anymore

Don't describe the changes, explain them.

E.g. "nose2 plugins removed which are not required anymore" we can see
they get removed, and since the change is about switching away from
nose2, it is obvious they get removed because they are not used anymore.

>   - in test_iso9660.py, local test_ routine names changed to not be accepted as test_ cases via pytest

This last part should be a patch by itself, coming first in the series,
as it can be applied without doing the conversion yet.

I have only had a cursory look at the changes, they look quite OK.

Be sure to run "make check-flake8", I think I could spot too many lines
at one place...

Regards,
Yann E. MORIN.

> Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>
> ---
>  support/testing/conf/unittest.cfg        |  3 --
>  support/testing/run-tests                | 28 ++++++++++-------
>  support/testing/tests/fs/test_iso9660.py | 40 ++++++++++++------------
>  3 files changed, 36 insertions(+), 35 deletions(-)
> 
> diff --git a/support/testing/conf/unittest.cfg b/support/testing/conf/unittest.cfg
> index 4f516fb80a..0dfffcfbda 100644
> --- a/support/testing/conf/unittest.cfg
> +++ b/support/testing/conf/unittest.cfg
> @@ -1,5 +1,2 @@
> -[unittest]
> -plugins = nose2.plugins.mp
> -
>  [multiprocess]
>  always-on = True
> diff --git a/support/testing/run-tests b/support/testing/run-tests
> index bf40019362..f887bc6715 100755
> --- a/support/testing/run-tests
> +++ b/support/testing/run-tests
> @@ -4,10 +4,16 @@ import multiprocessing
>  import os
>  import sys
>  
> -import nose2
> +import pytest
>  
>  from infra.basetest import BRConfigTest
>  
> +class PyTestCollector:
> +    def __init__(self):
> +        self.collected = []
> +    def pytest_collection_modifyitems(self, items):
> +        for item in items:
> +            self.collected.append(item.nodeid)
>  
>  def main():
>      parser = argparse.ArgumentParser(description='Run Buildroot tests')
> @@ -42,12 +48,10 @@ def main():
>          BRConfigTest.logtofile = False
>  
>      if args.list:
> -        print("List of tests")
> -        nose2.discover(argv=[script_path,
> -                             "-s", test_dir,
> -                             "-v",
> -                             "--collect-only"],
> -                       plugins=["nose2.plugins.collect"])
> +        collect_plugin = PyTestCollector()
> +        pytest.main(['--collect-only', '-p', 'no:terminal', test_dir], plugins=[collect_plugin])
> +        for nodeid in collect_plugin.collected:
> +            print(nodeid)
>          return 0
>  
>      if args.download is None:
> @@ -106,15 +110,15 @@ def main():
>          return 1
>      BRConfigTest.timeout_multiplier = args.timeout_multiplier
>  
> -    nose2_args = ["-v",
> -                  "-N", str(args.testcases),
> -                  "-s", test_dir,
> +    pytest_args = ["--workers", str(args.testcases),
> +                  "--rootdir", test_dir,
>                    "-c", os.path.join(test_dir, "conf/unittest.cfg")]
>  
>      if args.testname:
> -        nose2_args += args.testname
> +        pytest_args += args.testname
> +
> +    pytest.main(pytest_args)
>  
> -    nose2.discover(argv=nose2_args)
>  
>  
>  if __name__ == "__main__":
> diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
> index 692291267e..d2390cccf1 100644
> --- a/support/testing/tests/fs/test_iso9660.py
> +++ b/support/testing/tests/fs/test_iso9660.py
> @@ -25,7 +25,7 @@ BASIC_CONFIG = \
>      """.format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
>  
>  
> -def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
> +def do_test_mount_internal_external(emulator, builddir, internal=True, efi=False):
>      img = os.path.join(builddir, "images", "rootfs.iso9660")
>      if efi:
>          efi_img = os.path.join(builddir, "images", "OVMF.fd")
> @@ -43,7 +43,7 @@ def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
>      return exit_code
>  
>  
> -def test_touch_file(emulator):
> +def do_test_touch_file(emulator):
>      _, exit_code = emulator.run("touch test")
>      return exit_code
>  
> @@ -63,11 +63,11 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
>          """.format(infra.filepath("conf/grub2.cfg"))
>  
>      def test_run(self):
> -        exit_code = test_mount_internal_external(self.emulator,
> +        exit_code = do_test_mount_internal_external(self.emulator,
>                                                   self.builddir, internal=False)
>          self.assertEqual(exit_code, 0)
>  
> -        exit_code = test_touch_file(self.emulator)
> +        exit_code = do_test_touch_file(self.emulator)
>          self.assertEqual(exit_code, 1)
>  
>  
> @@ -84,11 +84,11 @@ class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
>          """.format(infra.filepath("conf/grub2.cfg"))
>  
>      def test_run(self):
> -        exit_code = test_mount_internal_external(self.emulator,
> +        exit_code = do_test_mount_internal_external(self.emulator,
>                                                   self.builddir, internal=False)
>          self.assertEqual(exit_code, 0)
>  
> -        exit_code = test_touch_file(self.emulator)
> +        exit_code = do_test_touch_file(self.emulator)
>          self.assertEqual(exit_code, 1)
>  
>  
> @@ -104,11 +104,11 @@ class TestIso9660Grub2Internal(infra.basetest.BRTest):
>          """.format(infra.filepath("conf/grub2.cfg"))
>  
>      def test_run(self):
> -        exit_code = test_mount_internal_external(self.emulator,
> +        exit_code = do_test_mount_internal_external(self.emulator,
>                                                   self.builddir, internal=True)
>          self.assertEqual(exit_code, 0)
>  
> -        exit_code = test_touch_file(self.emulator)
> +        exit_code = do_test_touch_file(self.emulator)
>          self.assertEqual(exit_code, 0)
>  
>  
> @@ -127,12 +127,12 @@ class TestIso9660Grub2EFI(infra.basetest.BRTest):
>                     infra.filepath("conf/grub2.cfg"))
>  
>      def test_run(self):
> -        exit_code = test_mount_internal_external(self.emulator,
> +        exit_code = do_test_mount_internal_external(self.emulator,
>                                                   self.builddir, internal=True,
>                                                   efi=True)
>          self.assertEqual(exit_code, 0)
>  
> -        exit_code = test_touch_file(self.emulator)
> +        exit_code = do_test_touch_file(self.emulator)
>          self.assertEqual(exit_code, 0)
>  
>  
> @@ -155,22 +155,22 @@ class TestIso9660Grub2Hybrid(infra.basetest.BRTest):
>                     infra.filepath("conf/grub2.cfg"))
>  
>      def test_run(self):
> -        exit_code = test_mount_internal_external(self.emulator,
> +        exit_code = do_test_mount_internal_external(self.emulator,
>                                                   self.builddir, internal=True,
>                                                   efi=False)
>          self.assertEqual(exit_code, 0)
>  
> -        exit_code = test_touch_file(self.emulator)
> +        exit_code = do_test_touch_file(self.emulator)
>          self.assertEqual(exit_code, 0)
>  
>          self.emulator.stop()
>  
> -        exit_code = test_mount_internal_external(self.emulator,
> +        exit_code = do_test_mount_internal_external(self.emulator,
>                                                   self.builddir, internal=True,
>                                                   efi=True)
>          self.assertEqual(exit_code, 0)
>  
> -        exit_code = test_touch_file(self.emulator)
> +        exit_code = do_test_touch_file(self.emulator)
>          self.assertEqual(exit_code, 0)
>  
>  
> @@ -189,11 +189,11 @@ class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
>          """.format(infra.filepath("conf/isolinux.cfg"))
>  
>      def test_run(self):
> -        exit_code = test_mount_internal_external(self.emulator,
> +        exit_code = do_test_mount_internal_external(self.emulator,
>                                                   self.builddir, internal=False)
>          self.assertEqual(exit_code, 0)
>  
> -        exit_code = test_touch_file(self.emulator)
> +        exit_code = do_test_touch_file(self.emulator)
>          self.assertEqual(exit_code, 1)
>  
>  
> @@ -209,11 +209,11 @@ class TestIso9660SyslinuxExternalCompress(infra.basetest.BRTest):
>          """.format(infra.filepath("conf/isolinux.cfg"))
>  
>      def test_run(self):
> -        exit_code = test_mount_internal_external(self.emulator,
> +        exit_code = do_test_mount_internal_external(self.emulator,
>                                                   self.builddir, internal=False)
>          self.assertEqual(exit_code, 0)
>  
> -        exit_code = test_touch_file(self.emulator)
> +        exit_code = do_test_touch_file(self.emulator)
>          self.assertEqual(exit_code, 1)
>  
>  
> @@ -228,9 +228,9 @@ class TestIso9660SyslinuxInternal(infra.basetest.BRTest):
>          """.format(infra.filepath("conf/isolinux.cfg"))
>  
>      def test_run(self):
> -        exit_code = test_mount_internal_external(self.emulator,
> +        exit_code = do_test_mount_internal_external(self.emulator,
>                                                   self.builddir, internal=True)
>          self.assertEqual(exit_code, 0)
>  
> -        exit_code = test_touch_file(self.emulator)
> +        exit_code = do_test_touch_file(self.emulator)
>          self.assertEqual(exit_code, 0)
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
