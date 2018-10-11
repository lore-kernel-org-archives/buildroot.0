From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 22:04:13 +0200
Subject: [Buildroot] [PATCH v3,1/8] libselinux: bump to version 2.8
In-Reply-To: <20181011193707.20510-1-fontaine.fabrice@gmail.com>
References: <20181011193707.20510-1-fontaine.fabrice@gmail.com>
Message-ID: <20181011220413.06d47ca1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 21:37:00 +0200, Fabrice Fontaine wrote:
> - Remove second patch (already in version), see
>   https://github.com/SELinuxProject/selinux/commit/b24980ec07af66c4b419f8053aa65e97b36e558d
> - Update third patch
> - For target variant, set SHLIBDIR=/usr/lib because by default it is set
>   to /lib and LIBDIR is set to $(PREFIX)/lib (with PREFIX=/usr)
> - For host variant, set SHLIBDIR=$(HOST_DIR)/lib otherwise shared
>   library will be installed in /lib (PREFIX is not used to install
>   shared library)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - move removal of symlink in libselinux.mk and libsepol.mk in a
>    dedicated patch
>  - Set back usage of DESTDIR and use SHLIBDIR instead for host variant
>  - Add a comment for usage of SHLIBDIR in target variant

I have applied the entire series, but I had to fix some issues on the
libsemanage patch. I will reply to it directly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
