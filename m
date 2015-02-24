From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 24 Feb 2015 23:57:40 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-22
Message-ID: <trinity-e7e491e6-c92c-495c-8fc1-998233c277a3-1424818660234@3capp-gmx-bs26>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vincent,

On Mon, Feb 23, 2015 at 01:14:26PM +0100, Vicente Olivert Riera wrote:
> Hello everyone,
> 
> On 23/02/15 08:30, Thomas Petazzoni wrote:
> > Build statistics for 2015-02-22
> > ===============================
> >     mips64el |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/2aa65614d97d1c301c775239e5f0055c14de2925/
> 
> I can't reproduce this issue but apparently there is a patch to fix it:
> 
> https://patchwork.ozlabs.org/patch/441768/
> 
> I'm sorry but I can't add my Reviewed-by or Tested-by to that patch
> because I can't reproduce the failure :-(
> 

I had to install the postgresql-devel package on my host (OpenSUSE-13.2) and enable
BR2_COMPILER_PARANOID_UNSAFE_PATH to reproduce the failure...

The postgresql-devel package installs pg_config on the host, which is evaluated for the
postgresql header search path, giving the wrong/host include path...

Regards,
Peter

> Cheers,
> --
> Vincent
> 
