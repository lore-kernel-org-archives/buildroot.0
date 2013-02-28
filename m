From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 12:28:55 +0100
Subject: [Buildroot] WebkitGtk upgradation
In-Reply-To: <CAFbHwiTZgmQn8EChYXSLAmmr9+WSoVLL5jUBqnOYA7qzUNFCnA@mail.gmail.com>
References: <CAJsG2H5B=ZdfDZm_wTmOqMkG6_kME=y_7oc5gkMygtd6HA4p+g@mail.gmail.com>
 <512F0B0A.4050403@relinux.de>
 <CAJsG2H4pZWE7FZGFUJuhYhjrNkf0Aa62y12WW3YQdbScJ1HTtA@mail.gmail.com>
 <CAFbHwiTZgmQn8EChYXSLAmmr9+WSoVLL5jUBqnOYA7qzUNFCnA@mail.gmail.com>
Message-ID: <20130228122855.6ceb26ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Newton,

On Thu, 28 Feb 2013 10:22:27 +0000, Will Newton wrote:

> As far as I can tell DirectFB is not really supported any more. If I
> remember correctly the current WebKit in buildroot will build with
> GTK+/DirectFB but will crash on startup. The crash is fairly easy to
> work around but I think is a symptom of the fact that no one is
> running with this setup.
> 
> Newer versions of GTK+ removed the DirectFB backend so it may have to
> be removed from buildroot in the future too.

My feeling is also that the DirectFB backend of Gtk has never been
seriously maintained over time. There are from time to time some people
who fix the issues, but then it goes on unmaintained for a number of
months/years, during which it slowly degrades into an unusable state.

I would therefore suggest that Buildroot follows upstream: get rid of
the DirectFB backend. If anyone really wants the DirectFB backend in
Gtk, then it should be fixed upstream. But I don't think it should
force Buildroot users to stay with old Webkit/Gtk because of this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
