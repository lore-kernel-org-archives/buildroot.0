From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:18:20 +0200
Subject: [Buildroot] [PATCH 1/4] support/testing: make treq tests to
 ignore warning
In-Reply-To: <20190811013538.26614-1-ricardo.martincoski@gmail.com>
References: <20190811013538.26614-1-ricardo.martincoski@gmail.com>
Message-ID: <20190811141820.34bf0f21@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Sat, 10 Aug 2019 22:35:35 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Newer versions of python-treq display a warning at runtime when
> service_identity is not installed:
> "Without the service_identity module, Twisted can perform only
> rudimentary TLS client hostname verification."
> 
> This warning message confuses the test that looks for another string in
> stdout. Make the test ignore other messages while still expecting
> "Connection refused".
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/269139449
> https://gitlab.com/buildroot.org/buildroot/-/jobs/269139450
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/270022950
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/270022951
> ---
>  support/testing/tests/package/test_python_treq.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Series applied, thanks! Thanks a lot for coming back so quickly with
fixes for those runtime test issues!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
