From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 10:08:11 +0200
Subject: [Buildroot] [PATCH 1/2] acpitool: new package
In-Reply-To: <1459016777-27952-1-git-send-email-nunes.erico@gmail.com> (Erico
 Nunes's message of "Sat, 26 Mar 2016 15:26:16 -0300")
References: <1459016777-27952-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <87wpl32lg4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Erico" == Erico Nunes <nunes.erico@gmail.com> writes:

 > acpitool is a small, convenient command-line ACPI client.
 > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 > ---
 >  package/Config.in              |  1 +
 >  package/acpitool/Config.in     | 11 +++++++++++
 >  package/acpitool/acpitool.hash |  2 ++
 >  package/acpitool/acpitool.mk   | 13 +++++++++++++
 >  4 files changed, 27 insertions(+)
 >  create mode 100644 package/acpitool/Config.in
 >  create mode 100644 package/acpitool/acpitool.hash
 >  create mode 100644 package/acpitool/acpitool.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 1467f33..cca553c 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -340,6 +340,7 @@ menu "Firmware"
 >  endmenu
 >  	source "package/a10disp/Config.in"
 >  	source "package/acpid/Config.in"
 > +	source "package/acpitool/Config.in"
 >  	source "package/am335x-pru-package/Config.in"
 >  	source "package/avrdude/Config.in"
 >  	source "package/bcache-tools/Config.in"
 > diff --git a/package/acpitool/Config.in b/package/acpitool/Config.in
 > new file mode 100644
 > index 0000000..7992e0f
 > --- /dev/null
 > +++ b/package/acpitool/Config.in
 > @@ -0,0 +1,11 @@
 > +config BR2_PACKAGE_ACPITOOL
 > +	bool "acpitool"
 > +	depends on BR2_INSTALL_LIBSTDCPP

I was hessitating if we needed some architecture dependencies as this
uses the /proc/acpi kernel interface which is only available on
x86/ia64/arm64 - But as this is only a runtime dependency I left it as
is.

Committed, thanks.

-- 
Bye, Peter Korsgaard
