From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Fri, 8 Aug 2014 15:13:56 +0200
Subject: [Buildroot] [PATCH 1/1] MPD: Add jack output support option
In-Reply-To: <53E4C73C.8050605@zacarias.com.ar>
References: <1407485662-1712-1-git-send-email-pieter.degendt@gmail.com>
 <53E4C73C.8050605@zacarias.com.ar>
Message-ID: <CAFfn7Umfu6iv2BtUnWmdWRFqd7oPgkK7N-yHRROjLqc_PZBY5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 8, 2014 at 2:49 PM, Gustavo Zacarias <gustavo@zacarias.com.ar>
wrote:

> On 08/08/2014 05:14 AM, Pieter De Gendt wrote:
>
> Hi.
> A couple of details...
>
> > +config BR2_PACKAGE_MPD_JACK2
> > +     bool "jack2"
> > +     depends on BR2_LARGEFILE # libsndfile
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> > +     depends on BR2_USE_MMU # fork()
> > +     depends on BR2_INSTALL_LIBSTDCPP
> > +     depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> > +     select BR2_PACKAGE_JACK2
> > +     help
> > +       Enable jack output support.
> > +
>
> The THREADS, MMU and LIBSTDCPP depends are unnecessary since mpd already
> requires them, so you can drop them like it's already done for all of
> the other options for mpd.
> Also you're missing a comment when LARGEFILE & ATOMIC_INTRINSICS aren't
> available telling that jack2 isn't available, similar to what's done for
> pulseaudio for example.
> Alpha-sorting the menu entry would be good too.
> Otherwise it looks good.
> Care to send a v2 patch with these fixes?
> Thanks.
> Regards.
>
>
Done, thanks for comments.
Regards.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140808/b537bb6d/attachment.html>
