From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Nov 2013 23:10:48 +0100
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <87eh6tkxuk.fsf@dell.be.48ers.dk>
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>
 <87eh6tkxuk.fsf@dell.be.48ers.dk>
Message-ID: <20131106231048.67cf2d52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 06 Nov 2013 22:46:11 +0100, Peter Korsgaard wrote:

>  > Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
> 
> Sorry, how is this different than make allpackageyesconfig; make source?

I'd really like allyespackageconfig to be the solution, because I don't
really like the idea of dumping all make variables, grepping in there,
and using that to download everything.

However, the big problem with allyespackageconfig is that it doesn't
download everything. As soon as you have a "choice" in Config.in (be it
for the package version, whether you want full X.org or KDrive X.org,
or Busybox init vs. sysvinit vs. systemd), then your
allyespackageconfig configuration is only going to contain the packages
that correspond to *one* possible choice selection. That leaves a large
number of packages that will not be downloaded.

Same thing for architecture dependent packages: grub depends on i386 or
x86-64, but ti-gfx depends on arm.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
