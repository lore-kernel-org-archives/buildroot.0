From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 01 Mar 2017 22:53:08 -0300
Subject: [Buildroot] [PATCH 4/5] support/testing: add package tests
References: <1486467363-19881-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <58b77b04d1511_1c373ff16a9c4f1492552@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 07, 2017 at 09:36 AM, Thomas Petazzoni wrote:

[snip]
> +++ b/support/testing/tests/package/test_dropbear.py
[snip]
> +        cmd = "netstat -ltn 2>/dev/null | grep -q 0.0.0.0:22"

You could drop the '-q' here.
Since the log is sent to a file it will not bother the user.
And when a testcase fails a verbose log helps to locate the problem.

Also it will be consistent to the use of 'grep' in all other testcases.

[snip]
> +++ b/support/testing/tests/package/test_python.py
[snip]
> +        cmd = "python --version 2>&1 | grep -q '^Python 2'"
[snip]

Same here.

Regards,
Ricardo
