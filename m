From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Oct 2020 20:55:10 +0200
Subject: [Buildroot] Compiled in kernel drivers.
In-Reply-To: <CAFHUVmQYxsnrxRnHgXntxxEt_jJTfqd4TKb14mnzMzinoB-6Aw@mail.gmail.com>
References: <CAFHUVmQYxsnrxRnHgXntxxEt_jJTfqd4TKb14mnzMzinoB-6Aw@mail.gmail.com>
Message-ID: <3243c998-9260-64bd-a887-7533406b5428@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi LWATCDR,

On 02/10/2020 15:31, LWATCDR wrote:
> I have written a driver that must be compiled into the kernel. It can not
> work as a loadable. It is in my br_external and I have changed the make
> file to make it build in the kernel. vs a loadable.

 AFAIK there is no way with the kernel build system to have an out-of-tree
module built into the kernel binary, so how did you do this?

> The problem is that it
> just does not seem to work in build root. Does anyone know how to make it
> work? I can get it to build and work as a loadable but only if I remove
> some needed functionality so it must be compiled into the kernel. It works
> just fine if I copy it into the drivers folder of the kernel and do a
> traditional kconfig kernel build.

 That's the only way to do it AFAIK: patch the kernel itself.

 The normal approach would be to make a git clone of the kernel, make your
modifications in it, push it somewhere, and then refer to that one as
BR2_LINUX_KERNEL_CUSTOM_GIT.

> also does anyone know how to search the
> mailing list? I did not see a search. .

 The mailing list archive on buildroot.org is pretty primitive. People usually
use a plain web search engine, or marc.info or nabble.org.

 Regards,
 Arnout
