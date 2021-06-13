From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Jun 2021 12:16:00 +0200
Subject: [Buildroot] [PATCH for-next 2/2] package/gdb: improve gdb
 version choice comment
In-Reply-To: <20210606150351.423542-2-romain.naour@gmail.com>
References: <20210606150351.423542-1-romain.naour@gmail.com>
 <20210606150351.423542-2-romain.naour@gmail.com>
Message-ID: <aa5da7a9-4489-27e6-717f-9deeb16b87ad@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/06/2021 17:03, Romain Naour wrote:
> The comment has been introduced by commit [1] where the latest
> gdb version has been used when cross-gdb is not enabled.
> 
> But since then the gdb package doesn't use the latest gdb version when
> cross-gdb is not enabled. It's the "stable" version.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=fda818390b5e6a585608f4523356eafa0c587f53
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/gdb/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 5aead236d0..6e807b33ed 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -82,7 +82,7 @@ endchoice
>  
>  endif
>  
> -# If cross-gdb is not enabled, the latest working version is chosen.
> +# If cross-gdb is not enabled, the latest stable version is chosen.
>  config BR2_GDB_VERSION
>  	string
>  	default "arc-2020.09-release-gdb" if BR2_arc
> 
