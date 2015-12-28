From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 22:06:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/libasplib: new package
In-Reply-To: <1450647112-17364-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450647112-17364-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151228220655.64e381c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 20 Dec 2015 22:31:52 +0100, Bernd Kuhls wrote:
> Needed for upcoming kodi-adsp-biquad-filters package
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                                  |  1 +
>  .../0001-Fix-linux-detection-with-buildroot.patch  | 31 ++++++++++++++++++++++
>  package/libasplib/Config.in                        | 11 ++++++++
>  package/libasplib/libasplib.mk                     | 13 +++++++++
>  4 files changed, 56 insertions(+)
>  create mode 100644 package/libasplib/0001-Fix-linux-detection-with-buildroot.patch
>  create mode 100644 package/libasplib/Config.in
>  create mode 100644 package/libasplib/libasplib.mk

I applied, after doing two changes:
 
 - Adding a dependency on i386 || x86-64. Indeed the source code uses
   <cpuid.h>, which is only provided on these architectures. In
   general, it would be good if you could test build the new packages
   on at least one non-x86 architecture, since it typically allows to
   uncover some cross-compilation issues or other x86 specificities.

 - Added a hash file, since we now add hash files for packages sourced
   from github.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
