From: Samuel Hurst <samuelh@rd.bbc.co.uk>
Date: Thu, 1 Dec 2016 14:39:52 +0000
Subject: [Buildroot] Package not building automatically.
Message-ID: <be469460-df73-df24-c85b-614e8b2d572c@rd.bbc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Apologies if this isn't the right place to ask this question.

I'm currently using Buildroot to build some images for Raspberry Pis to
be used as demonstrators. However, I've been hitting an issue where
Buildroot is not building certain packages unless I force them to build
manually (i.e. make <package-name>, instead of just running make).

In this case, I'm trying to get a Google QUIC library to build from
github. I'm wondering if it's something wrong with my Config.in and .mk
files that I've created:

== package/libquic/Config.in ===========================================
config BR2_PACKAGE_LIBQUIC
    bool "libquic"
    depends on BR2_TOOLCHAIN_HAS_THREADS
    select BR2_PACKAGE_ICU
    select BR2_PACKAGE_LIBEVENT
    help
        QUIC, a multiplexed stream transport over UDP

========================================================================

== package/libquic/libquic.mk ==========================================
#############################################################################
#
# QUIC Library
#
#############################################################################

LIBQUIC_VERSION = 8954789a056d8e7d5fcb6452fd1572ca57eb5c4e
LIBQUIC_SITE_METHOD = git
LIBQUIC_SITE = https://github.com/devsisters/libquic.git
LIBQUIC_SOURCE = libquic-$(LIBQUIC_VERSION).tar.gz
LIBQUIC_DEPENDENCIES = icu libevent
LIBQUIC_INSTALL_STAGING = YES

$(eval $(cmake-package))
========================================================================

The package shows up in the menuconfig interface and it is selected
(indeed, it is depended on by another package which does build as it
should). Can anyone cast some light onto what I might be doing wrong?


Best Regards,
Sam

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161201/5fceedf8/attachment.asc>
