From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 22:55:25 +0100
Subject: [Buildroot] [PATCH 1/2] package/openssl: Enable parallel build
In-Reply-To: <1416146446-27060-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416146446-27060-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141118225525.6e8b4e02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 16 Nov 2014 15:00:45 +0100, Bernd Kuhls wrote:
> Patch taken from Gentoo, tested 50+ times on buildroot with make -j80.
> 
> Comparison of compile duration:
> 
> make -j1
> real    1m24.464s
> user    1m8.620s
> sys     0m9.661s
> 
> make -j80
> real    0m27.774s
> user    1m34.234s
> sys     0m13.441s
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openssl/openssl-005-parallel-build.patch |  363 ++++++++++++++++++++++
>  package/openssl/openssl.mk                       |   10 +-
>  2 files changed, 368 insertions(+), 5 deletions(-)
>  create mode 100644 package/openssl/openssl-005-parallel-build.patch

Unfortunately, this patch is a fairly large patch, which is more a
feature patch than a real fix. Could we instead get it merged upstream?

I discussed this with Yann, and I believe Peter will agree that it's a
feature patch that we shouldn't take in Buildroot. The solutions are
either to take this patch upstream, or in Buildroot build in parallel
and then fallback to serial build if the parallel build has failed.
Something along the lines of:

	$(MAKE) -C $(@D) || $(MAKE1) -C $(@D)

(Suggested by Yann).

So I'll mark this patch as rejected in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
