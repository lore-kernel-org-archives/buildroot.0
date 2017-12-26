From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 26 Dec 2017 21:16:09 +0100
Subject: [Buildroot] [PATCH] libostree: make sure libavahi-client is
 built
In-Reply-To: <CANQCQpZ5v3h_b1_UCK0_08T1pPt5m6Kg-6qmoVRO9LoeOGyjjw@mail.gmail.com>
References: <20171221231932.31913-1-marcus.folkesson@gmail.com>
 <CANQCQpafX_AGPwTKB3Hq5G7c0f_Zz1NmjDOG8Rby73J4N9Mr+Q@mail.gmail.com>
 <CANQCQpZ5v3h_b1_UCK0_08T1pPt5m6Kg-6qmoVRO9LoeOGyjjw@mail.gmail.com>
Message-ID: <20171226201609.GA24556@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew,

On Tue, Dec 26, 2017 at 02:06:57PM -0600, Matthew Weber wrote:
> Marcus,
> 
> On Mon, Dec 25, 2017 at 10:16 PM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
> > Marcus,
> >
> > On Thu, Dec 21, 2017 at 5:19 PM, Marcus Folkesson
> > <marcus.folkesson@gmail.com> wrote:
> >> Avahi support also needs libavahi-client, which is built by avahi if avahi-daemon
> >> and dbus is selected.
> >>
> >> Fixes:
> >> http://autobuild.buildroot.net/results/1edfb60add17945eabc557e1dbfb08a0ba466df9/
> >>
> [snip]
> 
> >
> > Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
> >
> > I've kicked off a validation using utils/test-pkg with the following
> > config and both of your libostree patches applied.
> > BR2_TOOLCHAIN_USES_GLIBC=y
> > BR2_PACKAGE_LIBOSTREE=y
> > BR2_PACKAGE_E2FSPROGS=y
> > BR2_PACKAGE_LIBFUSE=y
> > BR2_PACKAGE_LIBGLIB2=y
> > BR2_PACKAGE_LIBGPGME=y
> > BR2_PACKAGE_XZ=y
> > BR2_PACKAGE_AVAHI=y
> > BR2_PACKAGE_AVAHI_DAEMON=y
> > BR2_PACKAGE_DBUS=y
> >
> 
> test-pkg looked good with the above config and the case of avahi&dbus disabled.
> 
> Matt

Thank you for testing.

Best regards
Marcus Folkesson
