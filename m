From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 4 Jan 2016 21:43:01 +0200
Subject: [Buildroot] host directories in target rpath
In-Reply-To: <20160101230549.6cb360cf@free-electrons.com>
References: <20160101155622.GA20087@vostro>
 <20160101230549.6cb360cf@free-electrons.com>
Message-ID: <20160104194301.GA8582@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fri, Jan 01, 2016 at 11:05:49PM +0100, Thomas Petazzoni wrote:

> > The underlying cause is libtool, and for autoreconfed packages I can fix it
> > by patching (host-)libtool. This fixes alsa-lib but not weston because weston
> > carries that code in its pre-built configure. So I have to either patch weston
> > in place (and also every non-autoreconfed package), or autoreconf them all.
> > 
> > What's your thoughts on this? Maybe there are better ways to fix it?
> 
> You can see the following patches from Samuel Martin, which aim at
> solving this problem:
> 
>   http://patchwork.ozlabs.org/patch/494781/
>   http://patchwork.ozlabs.org/patch/494782/
>   http://patchwork.ozlabs.org/patch/494783/
>   http://patchwork.ozlabs.org/patch/494784/
>   http://patchwork.ozlabs.org/patch/494785/
> 
> Samuel said he would respin them on top of master and post a new
> version of those patches.

Thanks, I wasn't aware of this set and it looks much better than
what I was going to do!
