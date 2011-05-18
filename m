From: Will Newton <will.newton@gmail.com>
Date: Wed, 18 May 2011 10:02:09 +0100
Subject: [Buildroot] [buildroot] Add libiqrf package.
In-Reply-To: <1305662198-23040-1-git-send-email-marek.belisko@open-nandra.com>
References: <1305662198-23040-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <BANLkTikt9Eq1V7Uvhx+L-PkHjL3bmyS=Pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 17, 2011 at 8:56 PM, Marek Belisko
<marek.belisko@open-nandra.com> wrote:
> Libiqrf is library written in C which simplify access to
> iqrf usb devices (http://iqrf.org).
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
> ?package/Config.in ? ? ? ? ?| ? ?1 +
> ?package/libiqrf/Config.in ?| ? 11 +++++++++++
> ?package/libiqrf/libiqrf.mk | ? 15 +++++++++++++++
> ?3 files changed, 27 insertions(+), 0 deletions(-)
> ?create mode 100644 package/libiqrf/Config.in
> ?create mode 100644 package/libiqrf/libiqrf.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 5e48ab7..819be1b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -301,6 +301,7 @@ source "package/libhid/Config.in"
> ?source "package/libusb/Config.in"
> ?source "package/libusb-compat/Config.in"
> ?source "package/python-serial/Config.in"
> +source "package/libiqrf/Config.in"
> ?endmenu

I think these entries are usually added alphabetically sorted.

> ?if BROKEN
> diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
> new file mode 100644
> index 0000000..a9e5a52
> --- /dev/null
> +++ b/package/libiqrf/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBIQRF
> + ? ? ? ?bool "libiqrf"
> + ? ? ? ?depends on BR2_PACKAGE_LIBUSB
> + ? ? ? ?help
> + ? ? ? ? ?Libiqrf is a C library for reading and writing a
> + ? ? ? ? ?data do iqrf usb devices (http://iqrf.orf)

This description isn't very clear and there's a typo in the URL. Any
chance you could tidy it up?
