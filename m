From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Apr 2018 15:00:45 +0200
Subject: [Buildroot] [RFC v1 1/2] libopenssl: bump version to 1.1.0h
References: <20180417211921.18718-1-ps.report@gmx.net>
Message-ID: <t8sgrexjul.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 17 Apr 2018 23:19:20 +0200 schrieb Peter Seiderer:

> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  
################################################################################
>  
> -LIBOPENSSL_VERSION = 1.0.2o
> +LIBOPENSSL_VERSION = 1.1.0h
>  LIBOPENSSL_SITE = http://www.openssl.org/source
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = OpenSSL or SSLeay

Hi Peter,

freeswitch will need a bump to its master branch, the current release 
version 1.6.20 is not compatible with openssl 1.1.x. I am using the 
master branch for months now without problems.

To build ca-certificates the libopenssl package needs this upstream
patch: https://github.com/openssl/openssl/
commit/00701e5ea84861b74d9d624f21a6b3fcb12e8acd Otherwise you will run 
into https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=894282

Regards, Bernd
