From: Charles Hardin <ckhardin@exablox.com>
Date: Mon, 24 Jul 2017 12:26:13 -0700
Subject: [Buildroot] Update to python pillow 4.0.0 is missing a dependency
	on olefile?
Message-ID: <CAAnoztFVLseke==FBxceaw=C3iU=GjxXGsGLN9UgKsbGDu0QLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After running the later 2017.02.x we ran across this on the python-pillow
installs.


Traceback (most recent call last):

  File "/opt/exablox/bin/configsrv", line 5, in <module>

    from pkg_resources import load_entry_point

  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line
3138, in <module>

    @_call_aside

  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line
3124, in call_aside

    f(/*args, /*/*kwargs)

  File "/usr/lib/python2.7/site-packages/pkg_resources/_init__.py", line
3151, in initialize_master_working_set

    working_set = WorkingSet._build_master()

  File "/usr/lib/python2.7/site-packages/pkg_resources/_init__.py", line
661, in build_master

    ws.require(requires)

  File "/usr/lib/python2.7/site-packages/pkg_resources/_init__.py", line
962, in require

    needed = self.resolve(parse_requirements(requirements))

  File "/usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line
849, in resolve

    raise DistributionNotFound(req, requirers)

pkg_resources.DistributionNotFound: The 'olefile' distribution was not
found and is required by pillow



And the updates to python-pillow 4.0.0 seem to have gone in without a
corresponding package for olefile being added? Did I miss that commit in
another branch?


Thanks in advance,

Charles
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170724/a56df1cf/attachment.html>
