From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 21:00:11 +0100
Subject: [Buildroot] [PATCH 4/7] libusb-compat: add host variant
In-Reply-To: <13b44d8b46e93d46b1cd1d09fb6b67be12df4349.1327772556.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 28 Jan 2012 18:42:52 +0100")
References: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
 <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
 <13b44d8b46e93d46b1cd1d09fb6b67be12df4349.1327772556.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87wr8580qc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
 Thomas> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 Thomas> ---
 Thomas>  package/libusb-compat/libusb-compat.mk |    4 ++++
 Thomas>  1 files changed, 4 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
 Thomas> index e39cdd8..99e7716 100644
 Thomas> --- a/package/libusb-compat/libusb-compat.mk
 Thomas> +++ b/package/libusb-compat/libusb-compat.mk
 Thomas> @@ -18,4 +18,8 @@ endef
 
 Thomas>  LIBUSB_COMPAT_POST_INSTALL_STAGING_HOOKS+=LIBUSB_COMPAT_FIXUP_CONFIG
 
 Thomas> +HOST_LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config host-libusb

I removed this one as well. This should go before the libftdi patch to
not break the build, so I reordered (same for libusb).

Committed, thanks.

-- 
Bye, Peter Korsgaard
