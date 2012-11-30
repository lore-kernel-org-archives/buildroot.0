From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 12:33:12 -0800
Subject: [Buildroot] [PATCH 1/8] acpid: add license information
In-Reply-To: <1354270483-32356-2-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 30 Nov 2012 10:14:36 +0000")
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
 <1354270483-32356-2-git-send-email-spdawson@gmail.com>
Message-ID: <87obie96gn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <simond@trainfx.com>
 spdawson> Signed-off-by: Simon Dawson <simond@trainfx.com>
 spdawson> ---
 spdawson>  package/acpid/acpid.mk |    2 ++
 spdawson>  1 file changed, 2 insertions(+)

 spdawson> diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
 spdawson> index 56f671d..b024e94 100644
 spdawson> --- a/package/acpid/acpid.mk
 spdawson> +++ b/package/acpid/acpid.mk
 spdawson> @@ -6,6 +6,8 @@
 spdawson>  ACPID_VERSION = 2.0.11
 spdawson>  ACPID_SOURCE = acpid_$(ACPID_VERSION).orig.tar.gz
 spdawson>  ACPID_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
 spdawson> +ACPID_LICENSE = GPLv2
 spdawson> +ACPID_LICENSE_FILES = COPYING

It seems to be GPLv2+:

 grep -rls 'at your option' *                                                                                                                                                   ~/source/buildroot/output/build/acpid-2.0.11
acpid.c
acpid.h
acpi_ids.c
acpi_ids.h
acpi_listen.c
connection_list.c
connection_list.h
COPYING
event.c
event.h
inotify_handler.c
inotify_handler.h
input_layer.c
input_layer.h
kacpimon/netlink.h
kacpimon/netlink.c
kacpimon/connection_list.h
kacpimon/libnetlink.c
kacpimon/kacpimon.c
kacpimon/acpi_ids.c
kacpimon/acpi_ids.h
kacpimon/kacpimon.h
kacpimon/input_layer.c
kacpimon/input_layer.h
kacpimon/connection_list.c
kacpimon/kacpimon.8
libnetlink.c
netlink.c
netlink.h
proc.c
proc.h
sock.c
sock.h

So I've changed it and committed, thanks.

-- 
Bye, Peter Korsgaard
