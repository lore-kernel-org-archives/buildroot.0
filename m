From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 22:22:31 +0100
Subject: [Buildroot] [PATCH 09/10] python-serial: new package
In-Reply-To: <89d3302cc6fa8367faa06a948d33039b6888c9d2.1295866866.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 24 Jan 2011 12:01:37 +0100")
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<89d3302cc6fa8367faa06a948d33039b6888c9d2.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8762teq9ns.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> python-serial is a Python library to access serial ports.
 Thomas> This package has originally been introduced to test that third-party
 Thomas> pure Python modules (that do not use C extensions) build properly
 Thomas> against the Buildroot Python infrastructure.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in                      |    1 +
 Thomas>  package/python-serial/Config.in        |    5 +++++
 Thomas>  package/python-serial/python-serial.mk |   21 +++++++++++++++++++++
 Thomas>  3 files changed, 27 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/python-serial/Config.in
 Thomas>  create mode 100644 package/python-serial/python-serial.mk

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> index 438e1b4..d437dc4 100644
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -293,6 +293,7 @@ source "package/libraw1394/Config.in"
 Thomas>  source "package/tslib/Config.in"
 Thomas>  source "package/libusb/Config.in"
 Thomas>  source "package/libusb-compat/Config.in"
 Thomas> +source "package/python-serial/Config.in"
 Thomas>  endmenu
 
 Thomas>  if BROKEN
 Thomas> diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..06866db
 Thomas> --- /dev/null
 Thomas> +++ b/package/python-serial/Config.in
 Thomas> @@ -0,0 +1,5 @@
 Thomas> +config BR2_PACKAGE_PYTHON_SERIAL
 Thomas> +	bool "python-serial"
 Thomas> +	depends on BR2_PACKAGE_PYTHON
 Thomas> +	help
 Thomas> +	  python-serial is a Python library to access serial ports.

Please add a link to http://pyserial.sf.net here.

-- 
Bye, Peter Korsgaard
