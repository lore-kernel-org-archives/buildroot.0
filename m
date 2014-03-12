From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 12 Mar 2014 19:43:23 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: bump to v208.
In-Reply-To: <CAHXCMM+Dqt+y2n=1uw8BbW2wBV0mLGGQgO2FPPOcDK1DcN+HnA@mail.gmail.com>
References: <1394635785-27317-1-git-send-email-eric.le.bihan.dev@free.fr>
 <87fvmnpesy.fsf@dell.be.48ers.dk>
 <CAHXCMM+Dqt+y2n=1uw8BbW2wBV0mLGGQgO2FPPOcDK1DcN+HnA@mail.gmail.com>
Message-ID: <20140312184321.GE17787@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, Peter, All,
On Wed, Mar 12, 2014 at 06:02:49PM +0100, Samuel Martin wrote:
> Hi all,
>
> On Wed, Mar 12, 2014 at 5:22 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:
> >
> >  > This version bump comes with a patch, backported from v209, to fix
> >  > a linker error when EFI support is disabled.
> >
> > Why v208? v211 has been released.
>
> Last time I checked, eudev in sync with systemd v210, it seems this
> has not changed since.
> Do we want to care about this synchronization between the udev
> provided by systemd and the one from eudev?

I do not think we have to care about the synchronization between eudev and
systemd-udev, because:

- systemd is likely to be bumped more frequently then eudev.
- most of the times, the changes in udev are related to rules, hwdb or
  internal stuff. This does not affect other packages.

Why only bump to v208? There is no real bugfix release for systemd. On each
new version, you get new features and bugfixes. v209 introduced a truckload of
changes, like systemd-networkd. This generated a lot of user feedback, which
resulted in v210 two days later. So I wanted to take time to review and test
the new features.

v211 was released two days ago, v210 less than a month ago. To me, v208 is the
latest battlefield-tested release, suitable for embedded stuff.

Besides, there has been an API change in Gudev: new functions have been added,
but no package relies on them for now. Systemd v210 and eudev v1.5.2 are in
sync.

So, once my v210 review is finished, I'll post one patch to bump systemd and
another one to bump eudev to 1.5.2, but not as a series.

Best regards,
ELB
