From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 19 Oct 2018 20:29:16 +0200
Subject: [Buildroot] [PATCH 2/5] webkitgtk: add dependency on the woff2
 package
In-Reply-To: <87efcw1h3j.fsf@dell.be.48ers.dk>
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-3-aperez@igalia.com>	<20180925225255.3fe01107@windsurf>
 <20180927124148.GB16720@momiji>	<87tvmbw4qb.fsf@dell.be.48ers.dk>
 <20181010001714.GD10287@momiji>	<87efcw1h3j.fsf@dell.be.48ers.dk>
Message-ID: <20181019202916.GE941@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Oct 2018 20:19:28 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> 
> Hi,
> 
>  >> Correct. Now that we have updated kconfig we could even consider using
>  >> the imply keyword to enable woff2 by default if it is really an option
>  >> that most people should enable:
>  >> 
>  >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=237e3ad0f195d8fd34f1299e45f04793832a16fc
> 
>  > There's a small doubt I have here... How exactly would we prefer to have this?
>  > I can think of two options. One would be the following, and would allow to
>  > disable WOFF2 support in WebKitGTK+ even if the woff2 package is built:
> 
>  >   config BR2_PACKAGE_WEBKITGTK
>  >       # ...
>  > 	  imply BR2_PACKAGE_WEBKITGTK_WOFF2
> 
>  >   config BR2_PACKAGE_WEBKITGTK_WOFF2
>  >       bool "woff2 support"
>  > 	  depends on BR2_PACKAGE_WOFF2
>  > 	  imply BR2_PACKAGE_WOFF2
> 
>  > The other, simpler option, always enables WOFF2 support in WebKitGTK+ if the
>  > woff2 package can be built:
> 
>  >   config BR2_PACKAGE_WEBKITGTK
>  >       # ...
>  > 	  imply BR2_PACKAGE_WOFF2
> 
> I would go for the 2nd option. I cannot think of any sensible use cases
> where we would want woff2 enabled but not use it in webkitgtk, and this
> matches what we do elsewhere for E.G. openssl.

For now I won't be sending a patch to do this because it's not clear whether
everybody is okay using ?imply? in Buildroot.

Cheers,


-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181019/4f6f0e3e/attachment.asc>
