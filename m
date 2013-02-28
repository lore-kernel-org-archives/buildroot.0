From: Will Newton <will.newton@gmail.com>
Date: Thu, 28 Feb 2013 10:22:27 +0000
Subject: [Buildroot] WebkitGtk upgradation
In-Reply-To: <CAJsG2H4pZWE7FZGFUJuhYhjrNkf0Aa62y12WW3YQdbScJ1HTtA@mail.gmail.com>
References: <CAJsG2H5B=ZdfDZm_wTmOqMkG6_kME=y_7oc5gkMygtd6HA4p+g@mail.gmail.com>
 <512F0B0A.4050403@relinux.de>
 <CAJsG2H4pZWE7FZGFUJuhYhjrNkf0Aa62y12WW3YQdbScJ1HTtA@mail.gmail.com>
Message-ID: <CAFbHwiTZgmQn8EChYXSLAmmr9+WSoVLL5jUBqnOYA7qzUNFCnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 28, 2013 at 8:52 AM, Bhupal Singh <singhbhupal88@gmail.com> wrote:
> Thanks Stephan,
>
> Yeah correct Webkit1.10.2 requires few other packages to be updated, Since
> webkit1.10.2 is a currect stable version, Is the only reason I am sticking
> to this version.
> Okay here are some more details
>
> To build Webkit1.10.2 requires Libglib, Pango, Cairo, Gstreamer, Atk,
> Gdk-pixbuf, All these packages needs to be updated, And new package
> Geoclue-0.12.99 to be added in the buildroot.
>
> I have updated all the above said packages and its build completely fine,
> The only place where I am stuck is while building Webkit.
> The build fails here Xrender package required and it looks for x11
> libraries, Though I have given target as DirectFB.
> And like icu-config not found even though icu package is already build, To
> my knowledge I can either build using icu or glib as a backend-unicode in
> which icu is default I tried to change this option as well but no success
> yet.

As far as I can tell DirectFB is not really supported any more. If I
remember correctly the current WebKit in buildroot will build with
GTK+/DirectFB but will crash on startup. The crash is fairly easy to
work around but I think is a symptom of the fact that no one is
running with this setup.

Newer versions of GTK+ removed the DirectFB backend so it may have to
be removed from buildroot in the future too.
