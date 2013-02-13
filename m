From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 13 Feb 2013 10:40:55 +0100
Subject: [Buildroot] [PATCH v3 0/5] Python 3, simple,
 external package support
In-Reply-To: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
References: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <511B5FA7.9050501@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,

Le 13/02/2013 10:20, Patrick Gerber a ?crit :
> This patch series refactor python support in buildroot to enable the 
> use of external package with both; python2 and python3. The packages
> python-bottle and python-serial have been adapted as examples.
> 
> To support others external package more work is needed as they are
> based on python setuptools. It's no more supported by python3 and
> should be replaced by "Distribute". This should be done in another
> patch series.

I don't get why this python-common directory is needed. If the two
python are mutually exclusive, why can't we just declare the PYTHON
variable in their respective package makefiles? The Config.in file is
useless as well, just make a depends on !PYTHON3 in python, and !PYTHON
in python3, like Thomas suggested.

Moreover, I'm pretty concerned about the breakage of many
configurations. You seem to assume here that all external modules can
build on both python and python3, and I'm really not sure about that.

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
