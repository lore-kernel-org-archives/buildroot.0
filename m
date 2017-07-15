From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 15 Jul 2017 01:21:57 -0300
Subject: [Buildroot] [PATCH v2 1/6] testing/infra/emulator: allow to
 specify pexpect timeout
References: <20170712024009.2366-2-andrew.smirnov@gmail.com>
Message-ID: <5969986552e2a_a573fd7a8943328570e7@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Jul 11, 2017 at 11:40 PM, Andrey Smirnov wrote:

> Some commands take more than 5 seconds to complete under QEMU, so add
> provisions to allow individual unit-test to specify different duration
> to avoid false negative test failures.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[I executed all tests in the current master with this patch]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

[snip]
> -    def run(self, cmd):
> +    def run(self, cmd, timeout=-1):

Indeed.
From the docs: "When the keyword argument timeout is -1 (default), then TIMEOUT
will raise after the default value specified by the class timeout attribute."

Regards,
Ricardo
