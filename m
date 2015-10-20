From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 20 Oct 2015 10:10:15 +0200
Subject: [Buildroot] [PATCH] iptables: add upstream patch fixing the
 message 'connlabel.conf not found'
In-Reply-To: <87zize3c5j.fsf@dell.be.48ers.dk>
References: <1445257360-31923-1-git-send-email-patrickdepinguin@gmail.com>
 <87vba27vhz.fsf@dell.be.48ers.dk>
 <CAAXf6LWqmBZjvBu8Qd-N7JffxrU7V15xBMtYqMO3Fgj-XcPKmg@mail.gmail.com>
 <87zize3c5j.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LUQ_FxWKWckFNvk_ZAA++vEop=VqEYGaj2z0iaDz+mKAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Oct 19, 2015 9:13 PM, "Peter Korsgaard" <peter@korsgaard.com> wrote:
>
> >>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com>
writes:
>
> Hi,
>
> >> Do you see this with mainline buildroot? We do pass --disable-static
for
>  >> !BR2_STATIC_LIBS builds, so I'm not sure how it could trigger for
your?
>  >>
>  >> But the fix does make sense for completely static builds.
>
>  > We noticed this problem after upgrading to a newer buildroot version a
>  > few releases back (but never sent that patch to buildroot until now).
>  > We are not using a static build, nor did we make changes to
>  > iptables.mk here.
>  > I don't really know why the author of the patch mentioned static in
>  > the commit message. Maybe he is not referring to 'static' in the sense
>  > that Buildroot does.
>
> As far as I read the mail it is about configuring iptables with
> --enable-static
>
>  > Anyway, we were thus seeing this message with standard iptables calls
>  > on a standard system.
>
> But with a Buildroot version not including:
>
> commit 9f13ddf3bab51ae762b82ce9f767ac1abcdb7b2e
> Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Date:   Tue Oct 21 13:58:14 2014 -0300
>
>     iptables: disable static for dynamic builds
>
>     It leads to ugly runtime warnings, see:
>     http://patchwork.ozlabs.org/patch/386215/
>     It's also required for xtables-addons.
>
>     Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>     Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Right?

Makes sense, we were updating from 2013.05 to 2014.05 back then.
I wasn't aware of the above patch.
It means that for our use case, we
wouldn't need it any more (we're on 2015.05 now).

Thanks for refreshing that for me :)

/Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151020/3bea789c/attachment.html>
