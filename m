From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Sep 2013 12:44:31 +0200
Subject: [Buildroot] [PATCH 00/17] SELinux Buildroot Additions
In-Reply-To: <OF299770B9.9F574639-ON86257BDE.00636F06-86257BDE.006395D0@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
 <20130906194903.28c020ba@skate>
 <OF299770B9.9F574639-ON86257BDE.00636F06-86257BDE.006395D0@rockwellcollins.com>
Message-ID: <20130907124431.25571c66@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Fri, 6 Sep 2013 13:07:44 -0500, Ryan Barnett wrote:

> Clayton and I have been going back and forth on how best to do this, as 
> the next set of patch that we want to release provides information on 
> SELinux.
> You had provided feedback to Clayton on options for providing this 
> information
> and I think it was agreed upon that the manual will be the best place for 
> this. 
> Is this correct?

This is correct.

> > In order to ease the review process, would it be possible to get a
> > short introduction to SELinux, and especially what tools are needed on
> > the host, what tools are needed on the target? I'm especially
> > interested in understanding why/if we need all this Python stuff on the
> > target.
> 
> I believe the best way to answer to questions above about is add to the 
> manual.
> As this way that we won't have to necessarily duplicate work (and 
> motivates us
> to create the documentation). So hopefully by the middle of the week next 
> week
> we can submit some documentation.

That would be good. However, I am not sure the questions I am asking
here match exactly what should be in the documentation. In the
documentation, we should explain how a Buildroot user can enable
SELinux support and make use of it on the target. While my questions
certainly overlap some of this, I believe we also need a few more
details of the internals to roughly understand what the different
packages are doing.

> Where would you like this documentation placed? Also how does one go about 
> adding
> to the manual (I can't seem to find anything in the manual)? Or do we want 
> to place
> this information on the buildroot wiki?

I believe the manual is a better place than the Buildroot Wiki. For
now, we've usually stored this kind of additional informations in the
"Details on Buildroot configuration" section. So something like:

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 56b0469..0fc66c9 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -430,3 +430,8 @@ can be chosen from +System configuration+, +Init system+:
 The solution recommended by Buildroot developers is to use the
 *Busybox init* as it is sufficient for most embedded
 systems. *systemd* can be used for more complex situations.
+
+SELinux support
+~~~~~~~~~~~~~~~
+
+Here put some details about the SELinux support.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
