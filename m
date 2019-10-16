From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 22:48:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: fix static build
 with openssl
In-Reply-To: <20191016204128.27360-1-fontaine.fabrice@gmail.com>
References: <20191016204128.27360-1-fontaine.fabrice@gmail.com>
Message-ID: <20191016224816.3ed0e602@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Oct 2019 22:41:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> + 		if (NOT LWS_WITH_ESP32)
> ++			find_package(PkgConfig QUIET)
> ++			pkg_check_modules(PC_OPENSSL openssl QUIET)
> + 			find_package(OpenSSL REQUIRED)

Isn't the find_package() then redundant with pkg_check_modules() ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
