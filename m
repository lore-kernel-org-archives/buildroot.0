From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 24 Jan 2011 16:46:23 -0500
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <87pqrmtgju.fsf@macbook.be.48ers.dk>
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
	<20110124171132.6baad50c@surf> <87pqrmtgju.fsf@macbook.be.48ers.dk>
Message-ID: <201101241646.23935.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, January 24, 2011 11:25:25 Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 
writes:
>  Thomas> Hello,
>  Thomas> Completely unrelated to Mike's change, but still spotted while
> looking Thomas> at the patch context:
> 
>  Thomas> On Wed, 19 Jan 2011 22:10:29 -0500
> 
>  Thomas> Mike Frysinger <vapier@gentoo.org> wrote:
>  >> LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst
>  >> .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS)))))
>  >> \
> 
>  Thomas> Both libpcap and tcpdump use this and I never noticed, but this
>  Thomas> is completely broken with external toolchains and the
>  Thomas> Crosstool-NG backend, since BR2_DEFAULT_KERNEL_HEADERS is only
>  Thomas> set with internal toolchains.
> 
>  Thomas> I haven't thought of what the right fix would be, but it's
> definitely Thomas> not that one.
> 
> True. The question is why they need this info? Perhaps we can just lie
> and simply say 2.6.x?

ive noticed this in all my builds, but ive just ignored it.  it isnt a matter 
of picking "linux 2.6" over "linux 2.4".  you simply need to pick linux-2.x 
over linux-1.x or linux-0.x.  we've long used this in Gentoo/uclinux-dist:
	export ac_cv_linux_vers=2
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110124/1881ed86/attachment.asc>
