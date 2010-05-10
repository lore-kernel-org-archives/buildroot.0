From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 10 May 2010 15:33:47 +0300
Subject: [Buildroot] [git commit master] libxcb: fix path to Python
	modules
In-Reply-To: <20100507223516.527CB8F341@busybox.osuosl.org>
References: <20100507223516.527CB8F341@busybox.osuosl.org>
Message-ID: <AANLkTiknUv3xy6Diwkz2xtOxwckUCAKuajGodk8OsxAa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 8, 2010 at 1:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> commit: http://git.buildroot.net/buildroot/commit/?id=4880edd506a2c629efa4ccf38f27f47d5d5d8804
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> When building libxcb, the variable XCBPROTO_XCBPYTHONDIR must point to
> the location where the Python modules needed to run the c_client.py
> program are installed. The path
> $(STAGING_DIR)/usr/lib/python2.6/site-packages was hardcoded. However,
> it doesn't work when the version of Python installed on the host is
> Python 2.5.
>
> Therefore, add a little bit of magic to compute the host Python
> version.

Unfortunately this fails on my system:
$ python --version
Python 2.6
$ python --version | sed 's/Python \(2\.[0-9]\)\..*/\1/'
Python 2.6

> We also verify that Python is available on the host, as we don't build
> it in Buildroot.
>
> Fixes bug #1531.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
