From: Piet Delaney <pdelaney@tensilica.com>
Date: Mon, 21 Mar 2011 14:18:45 -0700
Subject: [Buildroot] Xtensa support
In-Reply-To: <20110318165939.651bf88b@surf>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>	<20110315180743.5e34890b@surf>	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>	<20110315192211.3c59f861@surf>	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>	<20110315210538.1973f87f@surf>	<779935.72384.qm@web161802.mail.bf1.yahoo.com>	<4D81FB3E.7060307@carallon.com>
	<20110318165939.651bf88b@surf>
Message-ID: <4D87C0B5.1090503@tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 17 Mar 2011 12:14:54 +0000
> William Wagner <will_wagner@carallon.com> wrote:
> 
>> Would be great to have an example of recommended practice checked in
>> for people to see/copy.
> 
> Yeah, I could document how I build the latest system I've done.
> 
>> Also would be great to remove the xtensa bits as they are just
>> confusing. Perhaps we should convert that over to the new scheme?
> 
> Well, the Xtensa bits are a bit complicated, because Xtensa supports
> configurable CPU cores, so they have some strange Perl scripts that are
> needed when building the toolchain. But this Xtensa support has never
> been updated since it has been merged quite some time ago, and no
> active contributor has any Xtensa hardware platform to test the changes
> on, so maybe we could drop the support for Xtensa altogether.

Hi Thomas:

We appeared to have had some git import problems during our last merge and I had to
revert back to an older snapshot until we re-syncing with the central git repo again.

I've been maintain bug fixes for binutils and gcc there until we have a chance to
try a new merge.

	http://git.linux-xtensa.org/cgi-bin/git.cgi?p=buildroot/buildroot-xtensa-HiFi2-Snapshot.git;a=shortlog;h=snapshot_2%2BSMP


While maintaining our 2nd buildroot snapshot I kept wiki notes on issues I was having with buildroot:

	http://wiki.linux-xtensa.org/index.php/HiFi-2_snapshot_2_SMP_Snapshot_menuconfig
	http://wiki.linux-xtensa.org/index.php/HiFi-2_snapshot_2_SMP_uclibc-menuconfig


as part of a support blog for building a kernel and root file system that supported target
development of Codec's for our Audio cores.

	http://wiki.linux-xtensa.org/index.php/SMP_HiFi_2_Development_Board

I tried to get our last buildroot merge to work but had bizarre problems when trying to
get the new X code and the development  environment building together. We use the Buildroot
development environment (compiler, debugger, ...) to sort out kernel bugs.

Chris Zankel, Marc Gauthier, and I have recently been discussing cleaning up some
the the Xtensa eccentricity's needed for extensibility. We have quite a few
buildroot git tress and branches and we would also love to get back in sync with
the buildroot central repository. We have a similar story with the kernel git repo,
we are horribly behind in getting in sync with kernel.org.

Christian Zankel recently proposed a few changes in the 'xtensa' branch:

	http://git.linux-xtensa.org/cgi-bin/git.cgi?p=buildroot/buildroot-next.git;a=shortlog;h=xtensa

to address the 'strange' stuff being done to support extensibility.

I've been working about 60 hours a week on a new kernel feature and it's finally working great on our FPGA board.
I expect to have more cycles available in the not to distant future to look more closely at Christian's
change and try merging and/or cherry picking patches from our other git repos to establish a Buildroot with
a working development environment that's in sync with the current buildroot source code.

Perhaps in the next week or two I can start to put some time into getting our buildroot up-to-date.
We would like to upgrade our Pthreads implementation to support NPT and take advantage of the TLS
work that Bob Wilson did here a couple years ago. The current signal based approach is bit crazy
and likely killing performance for our customers heavily using pthreads.

In the mean time perhaps you could provide some guidance on how you would like us to clean
up the approach we are taking. I would appreciate it greatly, while we sort out the problems
bringing up a complete set of packages necessary for development, if the community could
provide their two cents on issues that come up when we discuss them.

Marc, Christian, and I agreed a few weeks ago to upgrade buildroot in a git repo at linux-xtensa.org.
We will be adjusting it with our Xtensa tools and testing it in local a local git repo as a
staging ground for submission upstream.

Reading over this thread it wasn't clear how Xtensa came up. I also didn't know what
Steve was referring to when he ask Carl not to 'top post'; hope I'm not doing that now.
Hopefully we can minimize the problems with the 'strange' perl scripts by documenting it
well and keeping it as simple as possible. Any suggestions you have would be greatly appreciated.

In summary, we are just getting back to getting buildroot up-to-date and
would appropriate your support when trying to pull this off.

Sorry for the last posting, our IT department changed my outgoing email addresses
and messed up my mailman access.

-piet

> 
> Regards,
> 
> Thomas
