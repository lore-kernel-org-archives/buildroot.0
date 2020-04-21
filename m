From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:51:31 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/libglib2: restore use of
 system printf
In-Reply-To: <20200311112256.2849174-2-john@metanate.com>
References: <20200311112256.2849174-1-john@metanate.com>
 <20200311112256.2849174-2-john@metanate.com>
Message-ID: <20200421225131.5411a02a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Mar 2020 11:22:56 +0000
John Keeping <john@metanate.com> wrote:

> Prior to commit 4102db0f7a ("package/libglib2: bump to version 2.60.3")
> which converted libglib2 to meson, Buildroot used to set a range of
> autoconf options to bypass tests that require running binaries.
> 
> The meson version of libglib2's build system has many fewer of these
> checks, but there are still some and these can be fed the "correct"
> answer by adding properties to cross-compilation.conf.
> 
> Add the necessary properties to indicate that we have C99 compliant
> print functions to avoid pulling in the gnulib fallback.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> ---
> v2:
> - Add Peter's reviewed-by - thanks!
> ---
>  package/libglib2/libglib2.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
