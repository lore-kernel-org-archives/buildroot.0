From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Jun 2021 09:50:22 +0200
Subject: [Buildroot] [PATCH v5 0/5] Introduce bmap-tools as target +
 host package
In-Reply-To: <6e9afcd08150926a669d4df1198461e0acc7f063.camel@orolia.com>
References: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
 <6e9afcd08150926a669d4df1198461e0acc7f063.camel@orolia.com>
Message-ID: <20210609095022.4f59aa2f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Wed, 09 Jun 2021 09:35:38 +0200
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> * the target package works fine
> * so does the host package
> * the tests TestPy3BmapTools and TestPy2BmapTools are failing at run
> time.
> 
> The first error in the run log is:
> 
> qemu-system-arm: Invalid SD card size: 60 MiB
> SD card size has to be a power of 2, e.g. 64 MiB.
> 
> So I set a fixed image size of 64M.
> With this modification, the python 2 test passes, but with that, the
> python 3 one, fails with a timeout issue:
> 
> ...
>   File "/usr/lib/python3/dist-packages/pexpect/expect.py", line 181, in
> expect_loop
>     return self.timeout(e)
>   File "/usr/lib/python3/dist-packages/pexpect/expect.py", line 144, in
> timeout
>     raise exc
> pexpect.exceptions.TIMEOUT: Timeout exceeded.
> ...
> 
> By increasing the timeout to 60 seconds, I could have all the tests
> passing.
> 
> I attached my diff for reference.

Thanks a lot for the testing! I'll double check, but I believe the
tests were working here. But of course, I've done quite a bit of back
and forth, so let's double check :)

> And I have a question, is keeping python 2 compatibility still
> required? Shouldn't we get rid of this test? It'd save quite an amount
> of CPU time :)

python2 is already marked deprecated in BR, and we're more and more
thinking of getting rid of it. I think this may happen in the near
future.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
