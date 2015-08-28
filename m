From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 19:31:46 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: stat.h is need for mode_t
In-Reply-To: <1440773264-14999-1-git-send-email-gwenj@trabucayre.com>
References: <1440773264-14999-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150828193146.58c943bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Fri, 28 Aug 2015 16:47:44 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> fix :
> http://autobuild.buildroot.net/results/8e3/8e3afd5f22312f0660f631fdb82bbb64eda913fb/build-end.log
> 
> error: 'mode_t' has not been declared
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

mode_t is according to the standard
(http://pubs.opengroup.org/onlinepubs/007908799/xsh/sysstat.h.html)
defined in <sys/types.h>. Can you try including <sys/types.h> instead?

If that works as well, then please submit the patch upstream: it is
valid for all toolchains.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
