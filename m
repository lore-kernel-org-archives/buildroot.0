From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 24 May 2018 16:29:12 +0000
Subject: [Buildroot] [PATCH] util-linux: Bump to version 2.32
In-Reply-To: <871se1dogl.fsf@dell.be.48ers.dk>
References: <20180521191623.7049-1-tpiepho@impinj.com>
 <1526938480.31570.89.camel@impinj.com> <877enwis89.fsf@dell.be.48ers.dk>
 <857898562.2094800.1527079548616.JavaMail.zimbra@datacom.com.br>
 <871se1dogl.fsf@dell.be.48ers.dk>
Message-ID: <1527179352.31570.103.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-05-24 at 18:10 +0200, Peter Korsgaard wrote:
> > > > > > "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:
>  >> > Nevermind, I see I missed this change already being on buildroot/next.
>  >> > If anyone wonders why mke2fs blocks for 2 seconds getting a filesystem
>  >> > UUID on recent kernels on low boot entropy systems, it's because of the
>  >> > problem described here.
>  >> 
>  >> I actually also hit this on 4.14.39 recently. Perhaps we should include
>  >> this bump (or better just the getrandom changes) on master and on
>  >> 2018.02.x?
>  >> 
>  >> Care to send a patch for master?
> 
>  > Isn't it simpler to cherry-pick commit 4b54bd3ae8, instead?
> 
> First of all, 4b54bd3ae8 is already on master so the question is just
> what we do for 2018.02.x?
> 
> Just cherrypicking the bump to 2.32 is certainly the easiest, but
> perhaps also riskier than just cherry-picking the getrandom() changes:
> 
> git shortlog v2.31.. -- lib/randutils.c
> Carlo Caione (1):
>       lib/randutils: Do not block on getrandom()
> 
> Karel Zak (1):
>       lib/randutils: don't break on EAGAIN, use usleep()
> 
> On the other hand, util-linux bumps are normally quite safe and we have
> not had any issues reported, so perhaps we should just go for 2.32 for
> 2018.02.x as well?

If you bump util-linux to 2.32, then systemd < 238 doesn't build
without systemd commit 227b8a762fea1458547be2cdf0e6e4aac0079730

core: don't include libmount.h in a header file (#8580)
