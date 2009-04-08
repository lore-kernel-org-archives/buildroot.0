From: Lloyd Sargent <lsargent@txdigital.com>
Date: Wed, 8 Apr 2009 13:59:34 -0500
Subject: [Buildroot] DBUS keeps getting installed...
In-Reply-To: <87prfnyoxt.fsf@macbook.be.48ers.dk>
References: <200904081213.21064.lsargent@txdigital.com>
	<87prfnyoxt.fsf@macbook.be.48ers.dk>
Message-ID: <200904081359.35038.lsargent@txdigital.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >>>>> "Lloyd" == Lloyd Sargent <lsargent@txdigital.com> writes:
>
> Hi,
>
>  Lloyd> Okay, I'm really puzzled. In my initial build I had
>  Lloyd> DBUS. Well, it was taking too many resources so I removed it.
>
>  Lloyd> Or so I thought.
>
>  Lloyd> In my next build, there was DBUS again!
>
>  Lloyd> So I checked the .config file:
>
>  Lloyd> # BR2_PACKAGE_DBUS is not set
>
>  Lloyd> Perhaps I misread something, but I was under the impression
>  Lloyd> that if DBUS was not set, then it wouldn't be included in the
>  Lloyd> build?
>
> That's true. Do you do a clean rebuild (rm -rf *build_*) or just edit
> the configuration and run make again? Packages don't automatically get
> removed from the target file system if you deselect them again.

AH! This I was not aware of (or did not properly understand).

This is most likely the issue.

> The other option is some other package needing dbus, and hence forcing
> it to be built, but then it should normally also depend / select it in
> Kconfig, so you should see it in your .config

No, nothing I'm building requires dbus.
