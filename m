From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 6 May 2021 21:45:09 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/libtomcrypt: add pkgconfig
 support
In-Reply-To: <703dae4e-e296-79ad-5ba7-5d3efe724272@mind.be>
References: <20210412195527.9282-1-ps.report@gmx.net>
 <20210412221453.5195d4b5@windsurf.home>
 <20210412231516.6cbc09f2@gmx.net>
 <45c379f0-8ca0-6891-1b1e-b166600da9ca@mind.be>
 <20210502122746.7988707d@gmx.net>
 <fce7cdf2-d2de-03e8-712e-dc6b98c892f7@mind.be>
 <20210503213852.3e9e23f3@gmx.net>
 <703dae4e-e296-79ad-5ba7-5d3efe724272@mind.be>
Message-ID: <20210506214509.182a1a46@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Tue, 4 May 2021 09:28:35 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 03/05/2021 21:38, Peter Seiderer wrote:
> > By the way, libtomcrypt depends on libtommath which used -fPIC unconditionally...
>
>  So, apparently I'm just full of s**t when I say -fPIC sometimes fails in static
> builds... Weird, I really *do* remember that...
>
>  Ah, here I have it: [1] It doesn't lead to build failures, it's just less
> performant and useless in static builds. It turns out, however, that we
> unconditionally pass -fPIC in dozens of packages. So one more doesn't really
> hurt I guess.

Thanks for insight, can send (at least) a patch for libtommath to change the
-fPIC usage only for the non static case...

Regards,
Peter

>
>  Regards,
>  Arnout
>
>
> [1]
> https://patchwork.ozlabs.org/project/buildroot/patch/20210209104726.20132-1-kremneva at synopsys.com/
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
