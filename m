From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 15 Jul 2017 01:24:40 -0300
Subject: [Buildroot] [PATCH v2 2/6] testing/tests/package/test_python:
 refactor TestPythonBase
References: <20170712024009.2366-3-andrew.smirnov@gmail.com>
Message-ID: <596999087ea8e_a573fd7aa652f2c57244@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Jul 11, 2017 at 11:40 PM, Andrey Smirnov wrote:

> Convert TestPythonBase to a true base class that only provides code
> implementing various tests without definig tests themselves in a

s/definig/defining/

> "discoverable" form.
> 
> To retain correct testing functionality, add TestPython2 derived class
> that uses code from TestPythonBase to define actual runnable test.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

with the typo fixed
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[I executed the test and checked the -run.log is equivalent to the old one]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Below a note to be read when applying...

[snip]
> +class TestPython2(TestPythonBase):

The runnable test got renamed, so the entry needs to be updated in
.gitlab-ci.yml
-tests.package.test_python.TestPythonBase: *runtime_test
+tests.package.test_python.TestPython2: *runtime_test

Regards,
Ricardo
