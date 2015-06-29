From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:01:28 +0200
Subject: [Buildroot] [PATCH] perl-cross: bump to version 0.9.7
In-Reply-To: <1435561397-27221-1-git-send-email-francois.perrad@gadz.org>
References: <1435561397-27221-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150629220128.2cdc5b25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Mon, 29 Jun 2015 09:03:17 +0200, Francois Perrad wrote:
> fix some build failures,
> see https://github.com/arsv/perl-cross/issues/17
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/perl.hash | 2 +-
>  package/perl/perl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

However, speaking of perl-cross, there is something that annoys me a
bit: the fact that we are patching the target variant of perl by
applying perl-cross, but not the host variant. I am currently working
on using per-package out of tree build. This means having a single
source tree for both the host and target variant of a given package: it
would no longer be allowed to patch the target variant in a given way,
and the host variant in another way.

Do you think it is possible to patch both the host and target perl in
the same way, and only depending on the configure options (or make
variables, or whatever), do the right thing?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
