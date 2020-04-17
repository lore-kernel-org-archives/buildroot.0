From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:53:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3-setuptools: bump to
 version 46.1.3
In-Reply-To: <20200417225210.5a9e1266@windsurf.home>
References: <20200417203051.5020-1-james.hilliard1@gmail.com>
 <20200417225210.5a9e1266@windsurf.home>
Message-ID: <20200417225303.2d214e9d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 22:52:10 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri, 17 Apr 2020 14:30:51 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
> 
> > Rebased add executable patch.
> > 
> > We can no longer keep the python3 and python2 versions in sync as
> > python2 support was dropped in setuptools version 45.0.0.
> > 
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>  
> 
> Except that this is not exactly doing what you think it does :)
> 
> python-setuptools is also used for Python 3!
> 
> python-setuptools is both a host and a target package. As a host
> package, it will always install setuptools for Python 2.x. As a target
> package however, it will install setuptools for the currently selected
> version of Python for the target. So python-setuptools will be the
> package installing setuptools on the target for Python 3!
> 
> python3-setuptools is a host only package, which is used when setuptools is needed for host Python 3.

Oops, hit send too soon.

So, if we want to do this, I think we should be consistent and also
have python-setuptools use 46.1.3 when BR2_PACKAGE_PYTHON3=y.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
