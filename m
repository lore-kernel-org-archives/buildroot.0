From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Mar 2017 19:44:10 +0000
Subject: [Buildroot] [Bug 9706] New: Can't download newer revisions of
	package from PyPI
Message-ID: <bug-9706-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9706

            Bug ID: 9706
           Summary: Can't download newer revisions of package from PyPI
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jem at kamama.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Newer versions of python projects (in my case I was attempting to update
supervisor to supervisor-3.3.1) don't download with the URL scheme currently
used. Not sure if this is only a supervisor problem or might affect other
modules from PyPI. Recommendation from PyPI is to use their API

  API documentation is at https://warehouse.pypa.io/api-reference/legacy/
  It looks like buildroot should first make a request against
/simple/supervisor/ and fetch links from the response.

For example if I hit https://pypi.python.org/simple/supervisor/ I get:

<!DOCTYPE html><html><head><title>Links for
supervisor</title></head><body><h1>Links for supervisor</h1><a
href="../../packages/2e/3b/f28afd29920be27c948923b276d1f131276880f6b4f9391323064b87b15b/supervisor-3.0a7.tar.gz#md5=d2e6c491fcb2606e4fd0afe4ebfd4b13"
rel="internal">supervisor-3.0a7.tar.gz</a><br/>
<a
href="../../packages/44/80/d28047d120bfcc8158b4e41127706731ee6a3419c661e0a858fb0e7c4b2d/supervisor-3.3.0.tar.gz#md5=46bac00378d1eddb616752b990c67416"
rel="internal">supervisor-3.3.0.tar.gz</a><br/>
<a
href="../../packages/4b/7d/cb3d91d6c65f73fd253c376fc0dbbc48b83e6606f61d9961d9ac7cf293f5/supervisor-3.0a9.tar.gz#md5=81d192acab20eef3578856651af7e851"
rel="internal">supervisor-3.0a9.tar.gz</a><br/>

...etc.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
