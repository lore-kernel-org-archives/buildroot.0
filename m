From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Oct 2017 21:12:01 +0200
Subject: [Buildroot] [PATCH] host-lzo: default liblzo2.a install to
 host/lib
In-Reply-To: <20171003164222.GG4753@scaer>
References: <1507038558-27163-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20171003164222.GG4753@scaer>
Message-ID: <20171003211201.260c4d2f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 3 Oct 2017 18:42:22 +0200, Yann E. MORIN wrote:

> > +# Prevent dynamically using lib64 as install libdir
> > +HOST_LZO_CONF_OPTS += -DCMAKE_INSTALL_LIBDIR=lib  
> 
> So, probably other packages would have the same issue, then? And indeed,
> we've just had Jan on IRC reporting the same issue with a new package
> he's adding.
> 
> So I suggest that we simply symlink lib64 -> lib like we do for the
> target, and be done with it.
> 
> Thoughts?

Yes, I also think we need a more general solution that fixing each
package one by one.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
