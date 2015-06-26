From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:34:49 +0200
Subject: [Buildroot] [PATCH 1/1] libucl: new package
In-Reply-To: <1435328383-24851-1-git-send-email-nimaim@gmail.com>
References: <1435328383-24851-1-git-send-email-nimaim@gmail.com>
Message-ID: <20150626203449.240aac79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nimai Mahajan,

On Fri, 26 Jun 2015 10:19:43 -0400, Nimai Mahajan wrote:
> From: Nimai Mahajan <nimaim@gmail.com>
> 
> Libucl is a high performance and flexible JSON/YAML/etc. parser for C.
> 
> https://github.com/vstakhov/libucl
> 
> Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
> ---
>  package/Config.in          |  1 +
>  package/libucl/Config.in   | 16 ++++++++++++++++
>  package/libucl/libucl.hash |  2 ++
>  package/libucl/libucl.mk   | 14 ++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/libucl/Config.in
>  create mode 100644 package/libucl/libucl.hash
>  create mode 100644 package/libucl/libucl.mk

I've applied your patch, after doing a good number of changes:

    [Thomas:
      - remove hash file, should not be used for github downloads
      - rewrap Config.in help text
      - remove trailing white space in Config.in.
      - add missing host-pkgconf dependency, without which the package
        doesn't autoreconf properly.
      - fix license: it is BSD-2c, not just BSD.]

Also, it would be good to add explicit support for the optional
dependencies of libucl. See the configure.ac script to find which
dependencies libucl can use.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
