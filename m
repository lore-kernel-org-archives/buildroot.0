From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 4 Aug 2009 10:28:22 +0200
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: factor out libuuid support
In-Reply-To: <873a88sjx0.fsf@macbook.be.48ers.dk>
References: <20090729172019.GS19257@buzzloop.caiaq.de>
	<1248888083-11767-1-git-send-email-daniel@caiaq.de>
	<20090803143614.GK19257@buzzloop.caiaq.de>
	<20090803165815.312deddd@surf>
	<20090803150941.GM19257@buzzloop.caiaq.de>
	<873a88sjx0.fsf@macbook.be.48ers.dk>
Message-ID: <20090804082822.GO19257@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 03, 2009 at 10:48:43PM +0200, Peter Korsgaard wrote:
> >>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:
> 
>  Daniel> diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
>  Daniel> index d353fd9..398dc56 100644
>  Daniel> --- a/package/e2fsprogs/Config.in
>  Daniel> +++ b/package/e2fsprogs/Config.in
>  Daniel> @@ -1,6 +1,10 @@
>  Daniel> +config BR2_PACKAGE_LIBUUID
>  Daniel> +	bool
> 
> Why did you make this a hidden config? Couldn't we imagine someone
> wanting to use libuuid in their own programs?

I didn't image that ;) But you're right, that could help. See the new
patch below.

Thanks,
Daniel
