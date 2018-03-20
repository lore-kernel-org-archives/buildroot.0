From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Mar 2018 16:45:35 +0100
Subject: [Buildroot] [PATCH v2 2/3] python-networkx: Update to add
 networkx package
In-Reply-To: <CAGm1_kuzARgJgQ9OEtrOVzhMrAxj2ORWJ-b=KxTC5PkoBcuQzA@mail.gmail.com>
References: <1521553662-4115-1-git-send-email-jared.bents@rockwellcollins.com>
 <1521553662-4115-2-git-send-email-jared.bents@rockwellcollins.com>
 <CAGm1_kuzARgJgQ9OEtrOVzhMrAxj2ORWJ-b=KxTC5PkoBcuQzA@mail.gmail.com>
Message-ID: <20180320164535.2a5ed5d4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Mar 2018 15:28:15 +0100, Yegor Yefremov wrote:

> > +# The current version of setools (v4.1.1) does not work with python-networkx past v1.11
> > +PYTHON_NETWORKX_VERSION = 1.11
> > +PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
> > +PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/c2/93/dbb41b03cf7c878a7409c8e92226531f840a423c9309ea534873a83c9192
> > +PYTHON_NETWORKX_DEPENDENCIES = python-decorator  
> 
> remove this dependency and try a clean BR rebuild (make clean && make)

Actually a clean rebuild with "make clean && make" does not allow to
verify that python-networkx doesn't have a build dependency on
python-decorator.

Indeed, in a plain "make" build, there are high chances that
python-decorator will be built before python-networkx, even without any
explicit dependency expressed.

If you want to verify this, doing: "make clean && make python-networkx"
is much better, as it only builds the dependencies that are explicitly
expressed in python-networkx.mk.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
