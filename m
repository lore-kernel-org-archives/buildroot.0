From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 23:31:38 +0200
Subject: [Buildroot] [PATCH] gpsd: fix compile for microblaze arch
In-Reply-To: <20170813085926.GA13312@waldemar-brodkorb.de>
References: <20170813085926.GA13312@waldemar-brodkorb.de>
Message-ID: <20170814233138.1fea9610@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Aug 2017 10:59:26 +0200, Waldemar Brodkorb wrote:
> Disable O2 and add O0. The suggested flags in the gcc report
> are not enough for gcc >= 6.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/368/3686cd3f3e7b6aee84f4377bd2dded1115321fb3/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gpsd/0002-do-not-append-O2.patch | 18 ++++++++++++++++++
>  package/gpsd/gpsd.mk                     |  2 +-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100644 package/gpsd/0002-do-not-append-O2.patch

I've applied to master. However, before doing this, I had to reformat
the patch using Git, and improve the patch description, which was a bit
too terse: it was only saying what the patch is doing (which is obvious
by reading the patch), but not *why* you're doing it.

Also, please use Git to format patches when the upstream project is
hosted in Git.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
