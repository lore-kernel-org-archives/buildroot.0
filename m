From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 26 Mar 2015 13:16:23 -0500
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
	w/threads
In-Reply-To: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CAMQcK5KRF47ZyTyzfj1e+xcDO0V_J8oUUXEgUiqF3zR6VYv7Qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

On Thu, Mar 26, 2015 at 10:54 AM, Matt Weber
<matthew.weber@rockwellcollins.com> wrote:

Why does jamvm need threads? I don't see any issues with toolchains on
the autobuilders needing threads to build this package.

http://autobuild.buildroot.org/?reason=jamvm-2.0.0

Could you please elaborate more why jamvm needs a toolchain with
threads and how you discovered this?

> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/jamvm/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
> index f480995..1e33f42 100644
> --- a/package/jamvm/Config.in
> +++ b/package/jamvm/Config.in
> @@ -5,13 +5,15 @@ config BR2_PACKAGE_JAMVM
>                 || BR2_mips || BR2_mipsel || BR2_powerpc
>         select BR2_PACKAGE_ZLIB
>         select BR2_PACKAGE_CLASSPATH
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>         help
>           JamVM is a new Java Virtual Machine which conforms to the
>           JVM specification version 2 (blue book).
>
>           http://jamvm.sf.net
>
> -comment "jamvm needs a toolchain w/ IPv6"
> +comment "jamvm needs a toolchain w/ IPv6 and threads"
>         depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
>                 || BR2_mips || BR2_mipsel || BR2_powerpc
>         depends on !BR2_INET_IPV6
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
