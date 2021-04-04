From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 15:40:34 +0200
Subject: [Buildroot] [PATCH] package/micropython: Define
 MICROPY_NLR_SETJMP for xtensa
In-Reply-To: <20210329072828.13989-1-judge.packham@gmail.com>
References: <20210329072828.13989-1-judge.packham@gmail.com>
Message-ID: <20210404154034.004bd3a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Mar 2021 20:28:28 +1300
Chris Packham <judge.packham@gmail.com> wrote:

> As suggested on https://github.com/micropython/micropython/issues/6551
> define MICROPY_NLR_SETJMP to avoid the xtensa specific implementation
> of nlr_push.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/5fc8669b5c768ccfc02bd20d1159bce7fe43683e
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/micropython/micropython.mk | 5 +++++
>  1 file changed, 5 insertions(+)

The build error really looks like a toolchain issue, but fair enough as
a temporary measure what you proposed is fine, so I've applied.

Could you perhaps e-mail the issue to Max Filippov
<jcmvbkbc@gmail.com> ? He has been maintaining the Xtensa support in BR,
including toolchain fixes, for quite some time.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
