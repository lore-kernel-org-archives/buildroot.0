From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 15:35:34 +0200
Subject: [Buildroot] [PATCH v3 1/1] paxtest: new package
In-Reply-To: <1499427897-36149-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1499427897-36149-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170722153534.16f24300@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Jul 2017 06:44:57 -0500, Matt Weber wrote:
> PaX regression test suite
> 
> Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes v2 -> v3
> [Arnout V
>  - Add Config.in comment when glibc toolchain not used
>  - Removed PAXTEST_SOURCE assignment as it was default
>  - Updated ARMv# patch to be anything less then v7 instead of
>    a range from 4-7
>  - Tested that TARGET_CONFIGURE_OPTS could be used and added it in
>  - Updated LD= to use TARGET_CC and enclosed in quotes

Applied to master, thanks. However, I have to say I very much dislike
the fact that a bunch of executable programs are installed right
into /usr/lib and not /usr/lib/paxtest or something like that. But
apparently RUNDIR is used to install both an actual shared library
(which must be in /usr/lib) and those executable programs.

Perhaps we could set RUNDIR=/usr/lib/paxtest, and as a post install
hook, move the single shared library being installed back
into /usr/lib ?

Could you test doing this ?

Since I've applied the patch, it should obviously be done by follow-up
patches, based on the latest master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
