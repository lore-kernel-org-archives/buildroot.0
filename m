From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:31:59 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: remove unneeded patch
In-Reply-To: <f8a6a05d98b19227a150f07af7ac04877803fb4c.1504607261.git.baruch@tkos.co.il>
References: <f8a6a05d98b19227a150f07af7ac04877803fb4c.1504607261.git.baruch@tkos.co.il>
Message-ID: <20170905213159.08da8098@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Sep 2017 13:27:41 +0300, Baruch Siach wrote:
> Commit 44b5637ab2 (e2fsprogs: add a patch to link against SEM_INIT libs)
> introduced a patch that effectively adds -lpthread to the link command
> with libcom_err. Today the only libc with separate libpthread is glibc
> that does not support static build. The generated libcom_err.so.2.1
> library links with libpthread with or without this patch. Drop this
> patch.
> 
> Cc: Daniel Mack <daniel@zonque.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/e2fsprogs/0001-sem-init-libs.patch | 11 -----------
>  1 file changed, 11 deletions(-)
>  delete mode 100644 package/e2fsprogs/0001-sem-init-libs.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
