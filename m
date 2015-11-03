From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Nov 2015 23:43:42 +0100
Subject: [Buildroot] [PATCH 1/1] libtirpc: rpcgen is only built for host,
 don't install to target
In-Reply-To: <1446584983-29703-1-git-send-email-phil@zankapfel.net>
References: <1446584983-29703-1-git-send-email-phil@zankapfel.net>
Message-ID: <5639389E.9090209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-11-15 22:09, Phil Eichinger wrote:
> rpcgen is only used to generate headers needed for compilation.
> Move it to noinst_PROGRAMS otherwise you may end up with a host-arch
> binary in your target.
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Note that nfs-utils-1.3.3 actually defines it in noinst_PROGRAMS.

 Regards,
 Arnout

> ---
>  package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
> index ad14312..1cf8614 100644
> --- a/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
> +++ b/package/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
> @@ -87,7 +87,7 @@ index 0000000..2277b6f
>  +	$(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
>  +LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
>  +
> -+bin_PROGRAMS = rpcgen
> ++noinst_PROGRAMS = rpcgen
>  +
>  +rpcgen_SOURCES = \
>  +	rpc_clntout.c \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
