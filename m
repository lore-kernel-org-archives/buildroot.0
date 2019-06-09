From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 01:07:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/cargo: needs host-libxml2
In-Reply-To: <20190609210835.31236-1-fontaine.fabrice@gmail.com>
References: <20190609210835.31236-1-fontaine.fabrice@gmail.com>
Message-ID: <9adf69a9-b764-d5c5-e484-958bb9f8548f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/06/2019 23:08, Fabrice Fontaine wrote:
> host-cargo needs host-libxml2 to avoid depending on an unworking
> libxml2:
> 
> --- stderr
> cmake: /home/mark/buildroot-test/instance-1/output/host/lib/libcurl.so.4: no version information available (required by cmake)
> cmake: symbol lookup error: /usr/lib/x86_64-linux-gnu/libxml2.so.2: undefined symbol: UCNV_TO_U_CALLBACK_STOP_60
> thread 'main' panicked at '
> command did not execute successfully, got: exit code: 127

 I would like to understand this one a little more before blindly linking with
host-libxml2...

 I can't see anything in cargo's sources that refers to libxml2, except some of
the vendored curl stuff, but those bits are only used on win32.

 Regards,
 Arnout

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/017854ca4cce8c0e4f7b41b407e44cb91e8b09a0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cargo/cargo.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
> index a387281b4c..dd0b93b304 100644
> --- a/package/cargo/cargo.mk
> +++ b/package/cargo/cargo.mk
> @@ -28,6 +28,7 @@ HOST_CARGO_DEPENDENCIES = \
>  	host-libhttpparser \
>  	host-libssh2 \
>  	host-libcurl \
> +	host-libxml2 \
>  	host-rustc \
>  	host-cargo-bin
>  
> 
