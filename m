Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3335C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 13:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A7160D59;
	Sat, 23 Dec 2023 13:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A7160D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ponrfueq3TnE; Sat, 23 Dec 2023 13:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3499D60E4D;
	Sat, 23 Dec 2023 13:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3499D60E4D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0591BF280
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 13:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB27740399
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 13:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB27740399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2yV3y0tjOLz for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 13:54:29 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 523F7400CE
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 13:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 523F7400CE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 66C19B00573;
 Sat, 23 Dec 2023 14:54:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Dec 2023 14:54:22 +0100
Date: Sat, 23 Dec 2023 14:54:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Colin Foster <colin.foster@in-advantage.com>
Message-ID: <ZYbmjjPUjwx5b0qk@landeda>
References: <20231222232251.12786-1-colin.foster@in-advantage.com>
 <20231222232251.12786-2-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222232251.12786-2-colin.foster@in-advantage.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703339666;
 bh=JNao0fI/gAVvhbe7N4akcOqYObEUQUsWXjWMwysY0WA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PxwqcJSdnlFRKhLVFRrMUsTJl9FYa0M0OyJaD9uncf4wL6lZQnrMcG6fnHFBbKJvQ
 it6Z/hZVuqBOYTZk/P9qCBi3g0nRy2b3suHNgMC88+dZS1vNRMSUV/+sWRv3Kbr1Dg
 oIGLO09BdoLELOXhi/HLwtIioLcRhVT6UyX2r2ZdHaZ2HmejAfPkhM4Se5S/elGn8/
 18Ku1KGygMlAGBwKp+LdmkQoHIScTZzlpSyzkgM9NnNmiRKoUBprOqPB4qS0QrkPD9
 PpGwKkofVQ+X3Ax7aTeE17KJgnKzubD3IYCVoFDb1yNb7CKvpKbNkFt/jRBgOC79wF
 4W+adc4tZGPHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PxwqcJSd
Subject: Re: [Buildroot] [RFC v1 1/1] support/testing/run-tests: add ability
 to run tests from external
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Colin, All,

Thanks for this RFC patch! See below a few preliminary comments...

On 2023-12-22 17:22 -0600, Colin Foster spake thusly:
> The BR2_EXTERNAL variable can be used to keep customizations outside of
> Buildroot. There was no support for writing tests in those external
> environments.
> 
> When the BR2_EXTERNAL environment variable is used for running tests,
> include the tests found in ${BR2_EXTERNAL}/support/testing.

I'm a bit conflicted about that situation, to be honest...

On one hand, I do understand the motivation for trying and reusing the
Buildroot infrastructure for one's own tests; that's great and means
that what we have is actually useful to some people. :-)

On the other hand, I feel like whatever lies in an external tree is
custom packages for nternal use by a company, and so in such cases, the
testing infra would be better served by having CI running ad-hoc tests.

What I mean is that the runtime testing infra in Buildroot is meant as a
way to validate that the package is, at the very least, properly
integrated in Buildroot, e.g. that the runtime dependencies are
accounted for; it is not meant as a generic runtime infrastructure,
while what companies (those most likely to be using br2-external) want
is actual testing, with full functionality and non-regression suites and
what-have-you.

Also, the rationale you provided, testing the tftpy package, is not
appropriate here: tftpy is in Buildrooot, so its runtime test should
also be there, so writing a runtime test in a br2-external does not
make sense in this specific case.

Of course, I said I was conflicted about this: I have no strong opinion
against the feature itself; I just don't feel in favour either... Other
maintainers will have to weight in.

However, there is a case for looking the code, so let's go there.

First, don't forget that BR2_EXTERNAL is a space-separated list of
directories. Your current patch only considers a single directory will
be used, which is generally not true.

Second, and most importantly, I am not too happy about the need to do
some copying around. It is very often that I hit Ctrl-C to quickly kill
a set of runtime tests, and that would not be caught by the try-finally
clause (the first Ctrl-C would, not the second). So that could leave
quite a lot of directories around; for long-running machines like
build-farm servers, this is going to be a problem...

Also, tempfile.TemporaryDirectory() uses the same rules as mkdtemp(),
which uses the same rules as mkstemp(), to decide where to create the
temporary directory. On many machine, that resorts to using on of the
TMPDIR, TEMP or TMP environment variables, and it is not unusual for
those to point to .tmp, which in turns is very often a tmpfs, so does
not get a lot of space in there; even if only the infra scripts are
copied, ad those are not so huge, it is still not very nice to leave
around...

So, the question is: why do we need to copy?

I guess the reason is that nose2 can only have one starting directory
where it looks for tests, right?

A few years ago, I was working on moving the packages' runtime tests to
the respective package directory:

    https://gitlab.com/ymorin/buildroot/-/tree/yem/package-tests
    https://gitlab.com/ymorin/buildroot/-/commits/yem/package-tests

Of particular note, I came up with using symlinks, so that the packages
tests would be eventually discovered by nose2;

    https://gitlab.com/ymorin/buildroot/-/commit/1d9fc876483727c77ec93b4657cd5b4884e2adbb#a66a9b8b0912024dc207cec14b32e038e0c208eb

Basically, what that would do, is scan the package directory for files
named 'PACKAGE_NAME.py' and create a symlink test_PACKAGE_NAME.py in the
runtime test infra.

I wonder if that would not be a better solution...

I have also not looked in details at the patch, because the change in
indentation due to the try-finally, is difficult to follow. If we are to
go with a solution similar to what you propose, then it would be nice to
have the patch split in at least three patches:
  - one to introduce the try-finally, without any other change
  - one to do the copy of the infra unconditionally
  - one to copy each of the br2-external trees' test suites

But please don't respin too fast, let the others look and chime with
their opinions and reviews...

Regards,
Yann E. MORIN.

> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  support/testing/run-tests | 163 +++++++++++++++++++++-----------------
>  1 file changed, 91 insertions(+), 72 deletions(-)
> 
> diff --git a/support/testing/run-tests b/support/testing/run-tests
> index 485811b746..9ed689e177 100755
> --- a/support/testing/run-tests
> +++ b/support/testing/run-tests
> @@ -3,6 +3,8 @@ import argparse
>  import multiprocessing
>  import os
>  import sys
> +import tempfile
> +import shutil
>  
>  import nose2
>  
> @@ -40,95 +42,112 @@ def main():
>      args = parser.parse_args()
>  
>      script_path = os.path.realpath(__file__)
> -    test_dir = os.path.dirname(script_path)
> -
> -    if args.stdout:
> -        BRConfigTest.logtofile = False
> -
> -    if args.list:
> -        print("List of tests")
> -        nose2.discover(argv=[script_path,
> -                             "-s", test_dir,
> -                             "-v",
> -                             "--collect-only"],
> -                       plugins=["nose2.plugins.collect"])
> -        return 0
> -
> -    if args.download is None:
> -        args.download = os.getenv("BR2_DL_DIR")
> +    script_dir = os.path.dirname(script_path)
> +
> +    overlay_path = os.getenv("BR2_EXTERNAL")
> +    if overlay_path:
> +        temp_dir = tempfile.TemporaryDirectory()
> +        shutil.copytree(script_dir, temp_dir.name, dirs_exist_ok=True)
> +        shutil.copytree(overlay_path + "/support/testing",
> +                        temp_dir.name,
> +                        dirs_exist_ok=True)
> +        test_dir = temp_dir.name
> +    else:
> +        test_dir = script_dir
> +
> +    try:
> +        if args.stdout:
> +            BRConfigTest.logtofile = False
> +
> +        if args.list:
> +            print("List of tests")
> +            nose2.discover(argv=[script_path,
> +                                 "-s", test_dir,
> +                                 "-v",
> +                                 "--collect-only"],
> +                        plugins=["nose2.plugins.collect"])
> +            return 0
> +
>          if args.download is None:
> -            print("Missing download directory, please use -d/--download")
> +            args.download = os.getenv("BR2_DL_DIR")
> +            if args.download is None:
> +                print("Missing download directory, please use -d/--download")
> +                print("")
> +                parser.print_help()
> +                return 1
> +
> +        BRConfigTest.downloaddir = os.path.abspath(args.download)
> +
> +        if args.prepare_only:
> +            emulator_builtin_binaries = ["kernel-vexpress-5.10.202",
> +                                         "vexpress-v2p-ca9-5.10.202.dtb",
> +                                         "kernel-versatile-5.10.202",
> +                                         "versatile-pb-5.10.202.dtb"]
> +            print("Downloading emulator builtin binaries")
> +            for binary in emulator_builtin_binaries:
> +                infra.download(BRConfigTest.downloaddir, binary)
> +            return 0
> +
> +        if args.output is None:
> +            print("Missing output directory, please use -o/--output")
>              print("")
>              parser.print_help()
>              return 1
>  
> -    BRConfigTest.downloaddir = os.path.abspath(args.download)
> -
> -    if args.prepare_only:
> -        emulator_builtin_binaries = ["kernel-vexpress-5.10.202",
> -                                     "vexpress-v2p-ca9-5.10.202.dtb",
> -                                     "kernel-versatile-5.10.202",
> -                                     "versatile-pb-5.10.202.dtb"]
> -        print("Downloading emulator builtin binaries")
> -        for binary in emulator_builtin_binaries:
> -            infra.download(BRConfigTest.downloaddir, binary)
> -        return 0
> -
> -    if args.output is None:
> -        print("Missing output directory, please use -o/--output")
> -        print("")
> -        parser.print_help()
> -        return 1
> -
> -    if not os.path.exists(args.output):
> -        os.mkdir(args.output)
> +        if not os.path.exists(args.output):
> +            os.mkdir(args.output)
>  
> -    BRConfigTest.outputdir = os.path.abspath(args.output)
> +        BRConfigTest.outputdir = os.path.abspath(args.output)
>  
> -    if args.all is False and not args.testname:
> -        print("No test selected")
> -        print("")
> -        parser.print_help()
> -        return 1
> -
> -    BRConfigTest.keepbuilds = args.keep
> -
> -    if args.testcases != 1:
> -        if args.testcases < 1:
> -            print("Invalid number of testcases to run simultaneously")
> +        if args.all is False and not args.testname:
> +            print("No test selected")
>              print("")
>              parser.print_help()
>              return 1
> -        # same default BR2_JLEVEL as package/Makefile.in
> -        br2_jlevel = 1 + multiprocessing.cpu_count()
> -        each_testcase = int((br2_jlevel + args.testcases) / args.testcases)
> -        BRConfigTest.jlevel = each_testcase
> -
> -    if args.jlevel:
> -        if args.jlevel < 0:
> -            print("Invalid BR2_JLEVEL to use for each testcase")
> +
> +        BRConfigTest.keepbuilds = args.keep
> +
> +        if args.testcases != 1:
> +            if args.testcases < 1:
> +                print("Invalid number of testcases to run simultaneously")
> +                print("")
> +                parser.print_help()
> +                return 1
> +            # same default BR2_JLEVEL as package/Makefile.in
> +            br2_jlevel = 1 + multiprocessing.cpu_count()
> +            each_testcase = int((br2_jlevel + args.testcases) / args.testcases)
> +            BRConfigTest.jlevel = each_testcase
> +
> +        if args.jlevel:
> +            if args.jlevel < 0:
> +                print("Invalid BR2_JLEVEL to use for each testcase")
> +                print("")
> +                parser.print_help()
> +                return 1
> +            # the user can override the auto calculated value
> +            BRConfigTest.jlevel = args.jlevel
> +
> +        if args.timeout_multiplier < 1:
> +            print("Invalid multiplier for timeout values")
>              print("")
>              parser.print_help()
>              return 1
> -        # the user can override the auto calculated value
> -        BRConfigTest.jlevel = args.jlevel
> +        BRConfigTest.timeout_multiplier = args.timeout_multiplier
> +
> +        nose2_args = ["-v",
> +                      "-N", str(args.testcases),
> +                      "-s", test_dir,
> +                      "-c", os.path.join(test_dir, "conf/unittest.cfg")]
>  
> -    if args.timeout_multiplier < 1:
> -        print("Invalid multiplier for timeout values")
> -        print("")
> -        parser.print_help()
> -        return 1
> -    BRConfigTest.timeout_multiplier = args.timeout_multiplier
> +        if args.testname:
> +            nose2_args += args.testname
>  
> -    nose2_args = ["-v",
> -                  "-N", str(args.testcases),
> -                  "-s", test_dir,
> -                  "-c", os.path.join(test_dir, "conf/unittest.cfg")]
> +        nose2.discover(argv=nose2_args)
>  
> -    if args.testname:
> -        nose2_args += args.testname
> +    finally:
> +        if temp_dir:
> +            shutil.rmtree(temp_dir.name)
>  
> -    nose2.discover(argv=nose2_args)
>  
>  
>  if __name__ == "__main__":
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
