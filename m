From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 22:23:53 +0100
Subject: [Buildroot] [PATCH 10/10] python-mad: new package
In-Reply-To: <4202ec9552c58af1c5ba12aac109b6c563ac6ef0.1295866866.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 24 Jan 2011 12:01:38 +0100")
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<4202ec9552c58af1c5ba12aac109b6c563ac6ef0.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <871v42q9li.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> python-mad is a Python binding for the MAD library, a high-quality
 Thomas> integer-only MPEG decoder.

 Thomas> This package has been introduced as a test to make sure that
 Thomas> third-party Python modules that rely on a C extension can properly be
 Thomas> built against the Python infrastructure of Buildroot.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/multimedia/Config.in                |    1 +
 Thomas>  package/multimedia/python-mad/Config.in     |    7 ++++
 Thomas>  package/multimedia/python-mad/python-mad.mk |   41 +++++++++++++++++++++++++++
 Thomas>  3 files changed, 49 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/multimedia/python-mad/Config.in
 Thomas>  create mode 100644 package/multimedia/python-mad/python-mad.mk

 Thomas> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Thomas> index da50dbb..ae685cf 100644
 Thomas> --- a/package/multimedia/Config.in
 Thomas> +++ b/package/multimedia/Config.in
 Thomas> @@ -25,6 +25,7 @@ source "package/multimedia/libvorbis/Config.in"
 Thomas>  source "package/multimedia/madplay/Config.in"
 Thomas>  source "package/multimedia/mpg123/Config.in"
 Thomas>  source "package/multimedia/mplayer/Config.in"
 Thomas> +source "package/multimedia/python-mad/Config.in"
 Thomas>  source "package/multimedia/speex/Config.in"
 Thomas>  source "package/multimedia/swfdec/Config.in"
 Thomas>  source "package/multimedia/festival/Config.in"
 Thomas> diff --git a/package/multimedia/python-mad/Config.in b/package/multimedia/python-mad/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..d25f2b8
 Thomas> --- /dev/null
 Thomas> +++ b/package/multimedia/python-mad/Config.in
 Thomas> @@ -0,0 +1,7 @@
 Thomas> +config BR2_PACKAGE_PYTHON_MAD
 Thomas> +	bool "python-mad"
 Thomas> +	depends on BR2_PACKAGE_PYTHON
 Thomas> +	select BR2_PACKAGE_LIBMAD
 Thomas> +	help
 Thomas> +	  python-mad is a Python binding for the MAD library, a
 Thomas> +	  high-quality integer-only MPEG decoder.
 Thomas> \ No newline at end of file

Please add the newline (here and elsewhere) and add a link to
http://spacepants.org/src/pymad/

-- 
Bye, Peter Korsgaard
