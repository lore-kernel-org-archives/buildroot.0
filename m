From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 19:27:08 +0200
Subject: [Buildroot] [PATCH] package/libhttpparser: New package
In-Reply-To: <1440708896-22502-1-git-send-email-root@renaud.io>
References: <1440708896-22502-1-git-send-email-root@renaud.io>
Message-ID: <20150828192708.44287935@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Renaud AUBIN,

On Thu, 27 Aug 2015 22:54:56 +0200, Renaud AUBIN wrote:
> http-parser provides a simple C API to parse HTTP responses and
> requests.
> 
> This packaging uses the official Joyent repository.
> ---
>  package/Config.in                      |  1 +
>  package/libhttpparser/Config.in        | 13 +++++++++++++
>  package/libhttpparser/libhttpparser.mk | 27 +++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
>  create mode 100644 package/libhttpparser/Config.in
>  create mode 100644 package/libhttpparser/libhttpparser.mk

Thanks, I've applied your patch to the next branch, after doing some
changes:

    [Thomas:
     - since we're always building the shared library, depend on
       !BR2_STATIC_LIBS in Config.in. We could build only the static
       library, but then we would have to do all the lib installation
       manually.
     - indent using tabs in Config.in
     - use 'make install' instead of handcoding the library installation.
     - use $(TARGET_CONFIGURE_OPTS) instead of just CC= and LD=.
     - use tabs for indentation in commands instead of spaces
     - add patch to fix reinstallation.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
