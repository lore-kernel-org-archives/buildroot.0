From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 14:10:01 +0300
Subject: [Buildroot] [git commit] nfs-utils: Bump version
In-Reply-To: <20150713105646.ABAB581942@busybox.osuosl.org>
References: <20150713105646.ABAB581942@busybox.osuosl.org>
Message-ID: <20150713111001.GQ2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jul 13, 2015 at 12:54:42PM +0200, Thomas Petazzoni wrote:
> [Thomas: add patch to fix rpc.statd foreground/daemon mode backported
> from upstream, and fix the S60nfs init script to not use the -F option
> of rpc.statd.]

[snip]

> diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
> index 91410ee..5e2a2c9 100755
> --- a/package/nfs-utils/S60nfs
> +++ b/package/nfs-utils/S60nfs
> @@ -21,7 +21,6 @@ start() {
>  
>  	echo -n "Starting NFS services: "
>  	/usr/sbin/exportfs -r
> -	rpc.statd

rpc.statd invocation removed entirely. Is this intended?

>  	echo "done"
>  
>  	echo -n "Starting NFS daemon: "

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
