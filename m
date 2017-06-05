From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 14:40:30 +0200
Subject: [Buildroot] [PATCH] vdr: bump version to 2.3.6
In-Reply-To: <0fa02a35-fea3-b720-a139-b6f02d24ff13@imgtec.com>
References: <20170605100525.44776-1-Vincent.Riera@imgtec.com>
 <c8of0exv9f.ln2@ID-313208.user.individual.net>
 <0fa02a35-fea3-b720-a139-b6f02d24ff13@imgtec.com>
Message-ID: <20170605144030.27e14e14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Jun 2017 11:34:30 +0100, Vicente Olivert Riera wrote:

> > did you build the release with uclibc? I got errors because of the new 
> > debugging code which uses execinfo.h.  
> 
> nope, I didn't build it with uClibc.

For the record, uClibc is our default C library, so not testing package
bumps with what is our default C library is a bit crazy.

We have even introduced a tool, test-pkg, that helps testing that
packages build fine. Please use it. Maybe not to test all toolchains,
but at least make sure it builds reasonably. Submitting a package bump
that isn't even build tested with uClibc is not acceptable.

I'd prefer to see *less* package bump patches, but *better* ones.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
