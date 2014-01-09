From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jan 2014 10:40:43 +0800
Subject: [Buildroot] [PATCH 1/2] uclibc: add a missing function member
 to siginfo.h
In-Reply-To: <1389202364-19387-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1389202364-19387-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140109104043.02d07109@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 8 Jan 2014 17:32:43 +0000, Vicente Olivert Riera wrote:
> Applying an upstream patch to add a missing function member on ia64,
> mips and sparc arches.
> 
> Upstream patch URL:
>    http://git.uclibc.org/uClibc/commit/libc/sysdeps/linux?id=b4e6e61e2f7c6fb4bf59f66efaa74591a2112912
> 
> Fixes:
>    http://autobuild.buildroot.net/results/fa0/fa03ecc087a4b30df8b0366bb238be3d167a56d9/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Siggh. This is again the kind of things that will make package builds
work with internal uClibc toolchain, but fail badly with external
uClibc toolchains, which are likely to not contain the gazillions of
backported uClibc patches that we carry around.

I have the feeling that this is a growing problem, and I'm not sure how
to handle it. To me, the fact that the uClibc community is completely
inactive in terms of releases is really a major issue.

A solution would be to not support any uClibc based external toolchain,
but that means we would no longer support Blackfin external toolchains
for example, which is really not desirable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
