From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Fri, 16 Sep 2016 11:44:32 +0200
Subject: [Buildroot] [git commit] binutils: bump default to version
 2.26.x
In-Reply-To: <20160908183012.8C4787FC73@busybox.osuosl.org>
References: <20160908183012.8C4787FC73@busybox.osuosl.org>
Message-ID: <20160916114432.788212f4@armant.core.local.os.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

Looks like this commit is introducing a regression when building
syslinux:


ld: /home/buildslave/slave/project/build/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libefi.a(dpath.o):
unrecognized relocation (0x2a) in section `.text'
ld: final link failed: Bad value

Explicitely switching to 2.27 is giving the same issue, switching 
(explicitely) back to 2.25.1 did worked though.

Let me know if you need more information to reproduce that.

Regards,
Ben

On Thu, 8 Sep 2016 20:28:56 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> commit:
> https://git.buildroot.net/buildroot/commit/?id=49d7c797f152685a7187acbcefd9636d112b33b6
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/binutils/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/binutils/Config.in.host
> b/package/binutils/Config.in.host index 6ef89a5..2333a6e 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -3,7 +3,7 @@ comment "Binutils Options"
>  choice
>  	prompt "Binutils Version"
>  	depends on !BR2_arc
> -	default BR2_BINUTILS_VERSION_2_25_X
> +	default BR2_BINUTILS_VERSION_2_26_X
>  	help
>  	  Select the version of binutils you wish to use.
>  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160916/0e08225d/attachment.asc>
