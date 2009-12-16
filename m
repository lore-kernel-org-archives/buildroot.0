From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 Dec 2009 16:38:07 +0100
Subject: [Buildroot] [PATCH 29/39] libusb: convert to autotools
	infrastructure for host package
In-Reply-To: <f3e2f5c04e4da3bf9ff578d78377ae3cf9fad1e9.1260905467.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 15 Dec 2009 20:31:00 +0100")
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
	<cover.1260905467.git.thomas.petazzoni@free-electrons.com>
	<f3e2f5c04e4da3bf9ff578d78377ae3cf9fad1e9.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ljh36iao.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> +++ b/package/libusb/libusb.mk
 Thomas> @@ -23,7 +23,7 @@ $(DL_DIR)/$(LIBUSB_SOURCE): $(LIBUSB_PATCH)
 Thomas>  libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
 
 Thomas>  libusb-unpacked: $(LIBUSB_DIR)/.unpacked
 Thomas> -$(LIBUSB_DIR)/.unpacked: $(STAMP_DIR)/host_autoconf_installed $(STAMP_DIR)/host_automake_installed $(STAMP_DIR)/host_libtool_installed $(DL_DIR)/$(LIBUSB_SOURCE)
 Thomas> +$(LIBUSB_DIR)/.unpacked: host-autoconf host-automake host-libtool $(DL_DIR)/$(LIBUSB_SOURCE)

This causes the unpack (and in terms configure, build and install) steps
to always be considered out of date and hence rerun.

We should probably just add those dependencies to the the toplevel
libusb target (or even better, convert to AUTOTARGETS).

-- 
Bye, Peter Korsgaard
