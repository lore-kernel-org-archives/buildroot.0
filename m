From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 24 Nov 2018 00:00:06 -0200
Subject: [Buildroot] [PATCH/next v2 1/8] support/testing: add perl test
References: <20181123043110.5353-2-francois.perrad@gadz.org>
Message-ID: <5bf8b0a668e09_35e13fa1a212dbc0547b7@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Nov 23, 2018 at 02:31 AM, Francois Perrad wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/124872328
 and also I tested that calling module_test with a module that is not in the
 built image fails the test case as expected]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

> ---
[snip]
> +        self.module_test("IO")

This is the only one that generates a warning.

# perl -MIO -e '1'
Parameterless "use IO" deprecated at -e line 0.
# echo $?
0

But the warning is harmless. This usage is marked as deprecated but still works
(command below succeeds) and therefore the core module *is* being tested.
perl -MIO:Dir -e 'IO::Dir->new(".");'

So my tags above stand.


Regards,
Ricardo
