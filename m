From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 22:42:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: the
	attrs distribution is required
In-Reply-To: <20170729154011.0f355293@windsurf.lan> (Thomas Petazzoni's
 message of "Sat, 29 Jul 2017 15:40:11 +0200")
References: <20170726185956.49090-1-ckhardin@exablox.com>
 <20170729154011.0f355293@windsurf.lan>
Message-ID: <873782nqkf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 26 Jul 2017 11:59:56 -0700, Charles Hardin wrote:
 >> Apparently the service identify code requires the python attrs
 >> to be availabe:
 >> 
 >> Traceback (most recent call last):
 >> File "/opt/exablox/bin/configsrv", line 5, in <module>
 >> from pkg_resources import load_entry_point
 >> File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3138, in <module>
 >> @_call_aside
 >> File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3124, in _call_aside
 >> f(*args, **kwargs)
 >> File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3151, in _initialize_master_working_set
 >> working_set = WorkingSet._build_master()
 >> File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 661, in _build_master
 >> ws.require(__requires__)
 >> File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 962, in require
 >> needed = self.resolve(parse_requirements(requirements))
 >> File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 849, in resolve
 >> raise DistributionNotFound(req, requirers)
 >> pkg_resources.DistributionNotFound: The 'attrs' distribution was not found and is required by service-identity
 >> 
 >> Signed-off-by: Charles Hardin <ckhardin@exablox.com>
 >> ---
 >> package/python-service-identity/Config.in | 1 +
 >> 1 file changed, 1 insertion(+)

 > Applied to master, thanks.

While looking at this commit for backporting to 2017.02.x, it seems like
the select of BR2_PACKAGE_PYTHON_CHARACTERISTIC should be dropped after
the bump to 16.0.0, as it is isn't listed in INSTALL_REQUIRES. PKG-INFO
states:

Changes:
        - Port from ``characteristic`` to its spiritual successor `attrs <https://attrs.readthedocs.org/>`_.

Care to verify and send a patch to drop the select if OK?

In the mean time I've applied this patch to the 2017.02.x series,
thanks.

-- 
Bye, Peter Korsgaard
