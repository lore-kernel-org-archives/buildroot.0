From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Nov 2013 22:52:50 +0100
Subject: [Buildroot] [PATCH 1/7] gdb: arc: Use git instead of website
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D685F1749A@de02wembxa.internal.synopsys.com>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
 <1384262780-12743-2-git-send-email-mjonker@synopsys.com>
 <20131112223739.45f76af9@skate>
 <E6BF041E97966E4DB955F0DF883AD2D685F1749A@de02wembxa.internal.synopsys.com>
Message-ID: <20131112225250.51c7459b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Tue, 12 Nov 2013 21:40:12 +0000, Mischa Jonker wrote:

> > Is there any reason why for gdb and binutils we don't have a "choice"
> > option for the ARC version? I know it's a bit silly because for ARC that
> > would be the only choice, but that would make things more similar to what we
> > do for gcc, no?
> 
> I think that was decided as part of the review process back then. To be honest, I forgot to remove the choice in gcc now, so I didn't use this opportunity to make it consistent. Now that I'll make a v2 anyway, please let me know what your preference is: to choose or not to choose.

The problem is that the gcc choice is helpful to be able to do the
"select BR2_GCC_NEEDS_MPC". If you remove the gcc version choice, you
would have to add a "select BR2_GCC_NEEDS_MPC if BR2_arc" under the
main gcc option. Not a big deal, but I'm wondering if I don't prefer
having a single choice option.

Let's hear what others have to say, I don't have a really strong
opinion on the matter, except that I'd like to have consistency between
gcc/binutils/uClibc on the matter, and also across architectures: ARC,
AVR32 and Microblaze (all needing special versions) should use the same
strategy. Of course, I'm not asking you to fix all of them, just want
to figure out a strategy that we will apply to all of these cases.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
