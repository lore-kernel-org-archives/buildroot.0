From: Bhupal Singh <singhbhupal88@gmail.com>
Date: Wed, 6 Mar 2013 10:12:08 +0530
Subject: [Buildroot] WebkitGtk upgradation
In-Reply-To: <87ehg04ofv.fsf@dell.be.48ers.dk>
References: <CAJsG2H5B=ZdfDZm_wTmOqMkG6_kME=y_7oc5gkMygtd6HA4p+g@mail.gmail.com>
 <512F0B0A.4050403@relinux.de>
 <CAJsG2H4pZWE7FZGFUJuhYhjrNkf0Aa62y12WW3YQdbScJ1HTtA@mail.gmail.com>
 <CAFbHwiTZgmQn8EChYXSLAmmr9+WSoVLL5jUBqnOYA7qzUNFCnA@mail.gmail.com>
 <20130228122855.6ceb26ce@skate> <87ehg04ofv.fsf@dell.be.48ers.dk>
Message-ID: <CAJsG2H51hU+fPXTOToHAFc9ccd2vQbMZrvmT1fvV5n_+9ez-QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed earlier, I am trying to build webkitgtk-1.10.2 with gtk-2.0
(GTK version-2.14.10) and directFB as target.

When I try to build webkitgtk through buildroot it is not able to find
required header files. When looked into GNUmake file of webkit(1.10.2), I
found that it is looking for headers at location* /usr/include*
instead of* /$(STAGING_DIR)/usr/include
*which was not the case while building  older webkit(1.2.7).

Is there any workaround to solve this issue?


Warm Regards,
BS_Chauhan

On Thu, Feb 28, 2013 at 5:53 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> writes:
>
>  Thomas> Dear Will Newton,
>  Thomas> On Thu, 28 Feb 2013 10:22:27 +0000, Will Newton wrote:
>
>  >> As far as I can tell DirectFB is not really supported any more. If I
>  >> remember correctly the current WebKit in buildroot will build with
>  >> GTK+/DirectFB but will crash on startup. The crash is fairly easy to
>  >> work around but I think is a symptom of the fact that no one is
>  >> running with this setup.
>  >>
>  >> Newer versions of GTK+ removed the DirectFB backend so it may have to
>  >> be removed from buildroot in the future too.
>
>  Thomas> My feeling is also that the DirectFB backend of Gtk has never been
>  Thomas> seriously maintained over time. There are from time to time some
> people
>  Thomas> who fix the issues, but then it goes on unmaintained for a number
> of
>  Thomas> months/years, during which it slowly degrades into an unusable
> state.
>
>  Thomas> I would therefore suggest that Buildroot follows upstream: get
>  Thomas> rid of the DirectFB backend. If anyone really wants the
>  Thomas> DirectFB backend in Gtk, then it should be fixed upstream. But
>  Thomas> I don't think it should force Buildroot users to stay with old
>  Thomas> Webkit/Gtk because of this.
>
> Agreed. I've added a comment for 2013.02 to warn users that it is
> deprecated:
>
>
> http://git.buildroot.net/buildroot/commit/?id=0e0e42176d4a46515aff577d9702d91208e27c5d
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Warm Regards,
BS_Chauhan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130306/301db5ca/attachment.html>
