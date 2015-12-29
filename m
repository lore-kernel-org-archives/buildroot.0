From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 21:32:16 +0100
Subject: [Buildroot] [PATCH 1/2] Makefile: use root-relative -f path for
 /sbin/ldconfig
In-Reply-To: <1445502151-25735-1-git-send-email-bjorn.forsman@gmail.com>
References: <1445502151-25735-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20151229213216.08a102cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bj?rn,

On Thu, 22 Oct 2015 10:22:30 +0200, Bj?rn Forsman wrote:

> $(TARGET_CROSS)ldconfig behaves differently (at least the ldconfig I
> tested, which was built by Buildroot) and should not have root-relative
> -f path. If it does, it will pick up host /etc/ld.so.conf file.
> 
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

As we discussed previously, our ldconfig handling is broken. So we are
simply planning to remove entirely. I have just posted a patch to this
effect:

	https://patchwork.ozlabs.org/patch/561618/

The idea is that from now on, packages are expected to install
libraries in path that are in the default search path of the dynamic
linker.

Consequently, I've marked your patches as Superseded. If you find any
package that doesn't work properly following our ldconfig removal, do
not hesitate to let us know.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
