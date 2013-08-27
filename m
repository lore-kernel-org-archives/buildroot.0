From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 23:53:06 +0200
Subject: [Buildroot] Kernel download problem.
In-Reply-To: <loom.20130827T231336-119@post.gmane.org>
References: <25A17A429F5A404F8323F087DD6980C4@JohanW7>
 <20130614194141.24ed6dee@skate>
 <loom.20130827T231336-119@post.gmane.org>
Message-ID: <20130827235306.55a1e75c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Potts,

On Tue, 27 Aug 2013 21:21:53 +0000 (UTC), James Potts wrote:

> > Could you show which Buildroot configuration exhibits the problem? From
> > a quick look, the only way for Buildroot to be told to use 2.6.34.14 is
> > by specifying a custom kernel version. And in this case, it's the user
> > responsibility to make sure the URL is correct. Why would we keep
> > 2.6.34.14 in our mirror specifically and not the myriad of other kernel
> > versions that the user may select?
> 
> Sorry to respond to an older post, but I just ran into the same problem.  
> The issue here is how you specify the kernel.  When not using the default 
> version, we have the option of "Custom version" or "Custom tarball."  When 
> you choose "Custom version" it asks you to fill in the version number, and 
> it builds the URL for downloading from kernel.org.  But this only works for 
> non-longterm kernels.
> 
> I.e, if I choose "Custom version" and specify "2.6.34.6" as the version, 
> everything works as expected.  But if I choose "2.6.34.12" as the version, 
> buildroot breaks, because it doesn't build the correct URL.

Aah, ok.

> Mind you, this is due to silliness on the part of the kernel.org maintainers 
> IMO, for splitting different kernel sub-versions into different directories.

Right, but since 3.x, they have apparently changed their mind, and
longterm versions are stored in the same place as the normal kernel
releases. Therefore, I'm not sure there's really a good incentive to
fix this in Buildroot, besides saying "use the Custom tarball" solution
in this case.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
