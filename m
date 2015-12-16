From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 22:45:58 +0100
Subject: [Buildroot] [PATCH 1/4] libcairomm: new package
In-Reply-To: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
References: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151216224558.0855b564@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Thu,  3 Dec 2015 16:36:42 -0500, James Knight wrote:
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/Config.in                  |  1 +
>  package/libcairomm/Config.in       | 19 +++++++++++++++++++
>  package/libcairomm/libcairomm.hash |  2 ++
>  package/libcairomm/libcairomm.mk   | 16 ++++++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 package/libcairomm/Config.in
>  create mode 100644 package/libcairomm/libcairomm.hash
>  create mode 100644 package/libcairomm/libcairomm.mk

I've applied, but quite a few changes were needed:

    [Thomas:
     - rename package from libcairomm to cairomm in order to match
       upstream name.
     - put the package next to cairo in menuconfig
     - add missing dependency on libsigc
     - add missing depends on BR2_INSTALL_LIBSTDCPP
     - fix license: it's LGPLv2+, not LGPLv2.]

I was a bit surprised by the missing dependency on libsigc. Please test
your new packages with minimal configurations to validate that you have
selected all dependencies. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
