From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:43:40 +0200
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
 w/threads
In-Reply-To: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150401234340.1717eaf2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Thu, 26 Mar 2015 10:54:40 -0500, Matt Weber wrote:
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
>  		|| BR2_mips || BR2_mipsel || BR2_powerpc
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_CLASSPATH
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

This should have been grouped closer to the BR2_INET_IPV6 dependency.

>  	help
>  	  JamVM is a new Java Virtual Machine which conforms to the
>  	  JVM specification version 2 (blue book).
>  
>  	  http://jamvm.sf.net
>  
> -comment "jamvm needs a toolchain w/ IPv6"
> +comment "jamvm needs a toolchain w/ IPv6 and threads"

This should have been "IPv6, threads".

Applied with these minor details fixed.

Also, there's something fishy between jamvm and classpath.

jamvm does select BR2_PACKAGE_CLASSPATH and has classpath in
JAMVM_DEPENDENCIES.

But classpath has depends on BR2_PACKAGE_JAMVM in its Config.in.

Does not make much sense. Peter, you followed the JamVM/Classpath
stuff. What do you think?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
