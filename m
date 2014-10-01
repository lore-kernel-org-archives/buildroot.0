From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 23:19:42 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/gnupg2: configure script use
 the wrong stdint.h file
In-Reply-To: <1411509457-8182-1-git-send-email-romain.naour@openwide.fr>
References: <1411509457-8182-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141001231942.5f955a11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 23 Sep 2014 23:57:35 +0200, Romain Naour wrote:
> The configure test "checking absolute name of <stdint.h>..." return
> the absolute path of a stdint.h file from the toolchain sources.
> 
> The contents of this file is completely different compared to what
> was expected and does not contain intmax_t definitions.
> 
> Use gl_cv_absolute_stdint_h to indicate the correct file that
> is in staging directory.
> 
> This issue is only trigged by uClibc toolchain although it's present
> with glibc toolchain.
> 
> Ref: http://bugs.gnupg.org/gnupg/issue1547
> 
> Fixes:
> http://autobuild.buildroot.net/results/92a/92af55396670685f12ed0ebcddfe2d082ed5aeb7/
> http://autobuild.buildroot.net/results/bef/bef61579ba96a6a1b83c8ca259c39cef617aa77d/
> http://autobuild.buildroot.net/results/989/989648cfd3cc5750992fbbc784726dca4be2e920/
> http://autobuild.buildroot.net/results/e8a/e8a1d9b8d98c059d497bc493a9d2ae0ef5f9d0f5/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: improve commit log
>     add comment in the .mk file

As discussed on IRC, I've committed a different fix that consists in
telling gnupg2 that our stdint.h is C99 compliant, even though it's
technically not the case on non-wchar capable toolchains.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
