From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:14:57 +0200
Subject: [Buildroot] [PATCH 1/3] c-icap: avoid host library search path
In-Reply-To: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
Message-ID: <20160419211457.11d9bf2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 21:15:44 +0300, Baruch Siach wrote:

> +C_ICAP_MAKE_OPTS = exec_prefix=$(STAGING_DIR)/usr

This is not correct. Setting exec_prefix to $(STAGING_DIR)/usr is
wrong. Instead, can you try to remove:

   -rpath @libdir@

from the various Makefile.am ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
