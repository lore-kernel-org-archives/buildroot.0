From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 18:03:39 +0200
Subject: [Buildroot] [PATCH] intltool: fix build
In-Reply-To: <1413571681-27963-1-git-send-email-francois.perrad@gadz.org>
References: <1413571681-27963-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20141022180339.47298e90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 17 Oct 2014 20:48:01 +0200, Francois Perrad wrote:
> fix various build failures caused by host-perl serie
> 
> Currently, the variables PERL & PERL2LIB are available
> only during the configure step of host-intltool.
> There are also needed when running host-intltool,
> in all package which depends on host-intltool.
> 
> So, there are now global, but in the perl infrastructure,
> we cannot use them.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Makefile.in          | 9 +++++++--
>  package/intltool/intltool.mk | 3 ---
>  package/pkg-perl.mk          | 2 +-
>  3 files changed, 8 insertions(+), 6 deletions(-)

Can you cook an updated version of this patch that takes into account
the comment you have received? It would help us fix a number of Perl
related autobuilder issues.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
