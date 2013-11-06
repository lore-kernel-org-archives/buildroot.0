From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 23:32:14 +0100
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <20131106231048.67cf2d52@skate> (Thomas Petazzoni's message of
 "Wed, 6 Nov 2013 23:10:48 +0100")
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>
 <87eh6tkxuk.fsf@dell.be.48ers.dk> <20131106231048.67cf2d52@skate>
Message-ID: <87k3gljh5d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Wed, 06 Nov 2013 22:46:11 +0100, Peter Korsgaard wrote:

 >> > Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
 >> 
 >> Sorry, how is this different than make allpackageyesconfig; make source?

 > I'd really like allyespackageconfig to be the solution, because I don't
 > really like the idea of dumping all make variables, grepping in there,
 > and using that to download everything.

 > However, the big problem with allyespackageconfig is that it doesn't
 > download everything. As soon as you have a "choice" in Config.in (be it
 > for the package version, whether you want full X.org or KDrive X.org,
 > or Busybox init vs. sysvinit vs. systemd), then your
 > allyespackageconfig configuration is only going to contain the packages
 > that correspond to *one* possible choice selection. That leaves a large
 > number of packages that will not be downloaded.

 > Same thing for architecture dependent packages: grub depends on i386 or
 > x86-64, but ti-gfx depends on arm.

Yes, and thats the problem I have with keeping sources.buildroot.net
uptodate. Currently I "work around it" by doing a bunch of randconfig;
make source and hoping I will sooner or later catch them all.

But does this matter for USERS? I would guess users are only interested
in a subset of all the packages (E.G. the ones for the arch they use or
the ones enabled in their .config).

-- 
Bye, Peter Korsgaard
