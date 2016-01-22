From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jan 2016 14:15:47 +0100
Subject: [Buildroot] [PATCH] toolchain: add a harmless link when sysroot
 detection is not accurate
In-Reply-To: <1453464862-33174-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1453464862-33174-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160122141547.6fe95d7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 22 Jan 2016 12:14:22 +0000, Vicente Olivert Riera wrote:
> Sometimes is not possible to detect if the sysroots are nested or side
> by side. For instance this happens for MIPS big endian, where the
> sysroot and the arch-sysroot directories are the same.
> 
> For those cases where the sysroot detection is not accurate we add a
> harmless symlink necessary for certain toolchains.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Gaah, even more magic in this code.

Can you update the comment above the function, and also in the commit
log explain which toolchain is affected, and give outputs of
-print-file-name that explain the problem ?

It is really important to document all those things, because we
progressively adjust this sorcery to accommodate all toolchains, but
when we'll want to refactor this stuff, it will be very useful to have
some explanation as to why each case was handled this way.

The more I look at this external toolchain mess, the more I think we
should have less magic, and simply for each toolchain have some
explicit code in BR that says "this toolchain is organized this way".
Yes, it means that we will no longer automagically accommodate to
custom external toolchains...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
