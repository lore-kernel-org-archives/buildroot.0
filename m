From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:41:22 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/python-networkmanager: Bump
 to version 2.0.1
In-Reply-To: <20171102213829.f45xdbpzr63nnxyk@x230>
References: <20171102210144.27993-1-petr.vorel@gmail.com>
 <20171102220948.6a4e757b@windsurf>
 <20171102213829.f45xdbpzr63nnxyk@x230>
Message-ID: <20171102224122.7eaa833c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 22:38:30 +0100, Petr Vorel wrote:

> > So this one is really just a runtime dependency, as opposed to
> > dbus-python, which is a build time dependency. Correct?  
> IMHO both are runtime dependencies.

Well, if dbus-python is really a runtime dependency, it shouldn't be
listed in PYTHON_NETWORKMANAGER_DEPENDENCIES.

Could you double check this?

Remove dbus-python from PYTHON_NETWORKMANAGER_DEPENDENCIES, and then do
a clean build like this:

	$ make clean
	$ make python-networkmanager

This will only build python-networkmanager and its build dependencies,
but not its runtime dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
