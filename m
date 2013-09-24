From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Tue, 24 Sep 2013 13:07:29 -0500
Subject: [Buildroot] [PATCH v2 11/17] refpolicy: new package
In-Reply-To: <20130924171826.785ac962@skate>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>	<1378936777-28308-12-git-send-email-clshotwe@rockwellcollins.com>
 <20130918071804.2548927a@skate>	<OF0AE894A4.B1D82316-ON86257BEF.005CA11D-86257BEF.00782938@rockwellcollins.com>
 <20130924083028.7949259b@skate>	<OF8AC563B8.B3F98355-ON86257BF0.00510B0E-86257BF0.00513A09@rockwellcollins.com>
 <20130924171826.785ac962@skate>
Message-ID: <OF743D993F.78D7C469-ON86257BF0.0061D082-86257BF0.00638E9B@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/24/2013 
10:18:26 AM:

> Ok. The problem is that the "Buildroot" distribution is 
> not something
> that exists really. Depending on the Buildroot configuration, the
> contents of the filesystem and the base system can be verydifferent.
> It could be Busybox based, or Systemd+coreutils based, or something
> else. How does it work in real distributions? Is each package coming
> with the SELinux rules for itself? Or should be in the context of
> Buildroot just provide the tools and leave it entirely to 
> the user to
> write the proper SELinux policy?

Most distributions provide the base refpolicy that is customized to work 
with the distribution.  Fedora, for instance, applies a 166450 line patch 
file to the refpolicy to make it work with all of the Fedora packages. The 
refpolicy always seem to be constantly evolving package in these 
distributions that always has bugs against it.  I would like to see 
Buildroot just supply the ability to build a SELinux policy and maybe 
support for a select few packages.  It will be a huge undertaking to make 
sure all of the policy is able to work with all of the package in 
Buildroot. During my development, I will work to get a base, minimal 
configuration working in enforcing mode right out of the box.  I think 
this would be a reasonable place to start that would hopefully allow other 
people to expand the functionality.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130924/4a5c67d9/attachment.html>
