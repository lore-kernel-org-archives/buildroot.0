From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Sep 2013 17:18:26 +0200
Subject: [Buildroot] [PATCH v2 11/17] refpolicy: new package
In-Reply-To: <OF8AC563B8.B3F98355-ON86257BF0.00510B0E-86257BF0.00513A09@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378936777-28308-12-git-send-email-clshotwe@rockwellcollins.com>
 <20130918071804.2548927a@skate>
 <OF0AE894A4.B1D82316-ON86257BEF.005CA11D-86257BEF.00782938@rockwellcollins.com>
 <20130924083028.7949259b@skate>
 <OF8AC563B8.B3F98355-ON86257BF0.00510B0E-86257BF0.00513A09@rockwellcollins.com>
Message-ID: <20130924171826.785ac962@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue, 24 Sep 2013 09:47:16 -0500, Clayton Shotwell wrote:

> > I believe we can merge the refpolicy in its current state (i.e not
> > fully perfect for Buildroot usage), with a clear comment in the
> > Config.in that says so. And then you can continue the 
> > development and
> > add more fixes to the refpolicy package as you progress 
> > towards making
> > it fully usable in a Buildroot environment.
> > 
> > The thing I'm more worried about is that if we need 
> > Buildroot-specific
> > changes, will we have to keep them as patches within 
> > Buildroot forever?
> 
> We might be able to work with the refpolicy maintainers to add a 
> "buildroot" distro to the build system.  I think a lot of that will
> depend on how extensive the changes are. I'll start making the
> changes and see how bad it is before I contact the maintainers.

Ok. The problem is that the "Buildroot" distribution is not something
that exists really. Depending on the Buildroot configuration, the
contents of the filesystem and the base system can be very different.
It could be Busybox based, or Systemd+coreutils based, or something
else. How does it work in real distributions? Is each package coming
with the SELinux rules for itself? Or should be in the context of
Buildroot just provide the tools and leave it entirely to the user to
write the proper SELinux policy?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
