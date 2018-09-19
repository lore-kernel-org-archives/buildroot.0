From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 19 Sep 2018 11:28:02 -0500
Subject: [Buildroot] [PATCH 2/8] libsepol: bump to version 2.8
In-Reply-To: <20180919172353.327c678b@windsurf>
References: <20180916184606.27835-1-fontaine.fabrice@gmail.com>
 <20180916184606.27835-2-fontaine.fabrice@gmail.com>
 <CANQCQpagx-3u4mPF=am23GY=D+YUmxgmXuiFe_-5do8ReSfX_A@mail.gmail.com>
 <CAPi7W83HzC+CZPot=L=udmdr+Gk8uBWLAFZWuSRMJ8bQ-+rrpw@mail.gmail.com>
 <20180919172353.327c678b@windsurf>
Message-ID: <CANQCQpbkTckBWc5M3SaN_7qgYo=Bdr24yUV+ws2mi2G2oU1-YA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Sep 19, 2018 at 10:24 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 19 Sep 2018 17:01:35 +0200, Fabrice Fontaine wrote:
>
> > > When building libsepol as a host package, it looks like the
> > > prefix/destdir stuff isn't quite right with this update.  I get the
> > > following attempt of host-libsepol installing the library in my host
> > > system.
> > >
> > Indeed, you're right, this is probably the same issue of SHLIBDIR being set
> > by default to /lib. I will repoduce the issue, fix it and send a v2. Thanks
> > for your tests.
>
> Another thing that would be great would be to have a runtime test for
> SELinux, in the support/testing/ infrastructure. This would help to
> easily test if a bump of the SELinux stack continues to build/work as
> expected.
>

Still on my todo list to convert this old patch over to a unittest.
If anyone else starts to look at it first, let me know and I'll gladly
test.
https://patchwork.ozlabs.org/patch/686671/

Matt
