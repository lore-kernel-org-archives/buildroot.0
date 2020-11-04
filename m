From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Nov 2020 09:04:02 +0100
Subject: [Buildroot] [PATCH] package/python-remi: bump version to
 2020.10.30
In-Reply-To: <20201102140000.1753870-1-gwenj@trabucayre.com> (Gwenhael
 Goavec-Merou's message of "Mon, 2 Nov 2020 15:00:00 +0100")
References: <20201102140000.1753870-1-gwenj@trabucayre.com>
Message-ID: <87361p4kgd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

 > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

This causes a number of build errors:

LookupError: setuptools-scm was unable to detect version for u'/tmp/instance-0/output-1/build/python-remi-2020.10.30'.

Make sure you're either building from a fully intact git repository or PyPI tarballs. Most other sources (such as GitHub's tarballs, a git checkout without the .git folder) don't contain the necessary metadata and will not work.

For example, if you're using pip, instead of https://github.com/user/proj/archive/master.zip use git+https://github.com/user/proj.git#egg=proj
make: *** [package/pkg-generic.mk:250: /tmp/instance-0/output-1/build/python-remi-2020.10.30/.stamp_built] Error 1

http://autobuild.buildroot.net/results/3a6/3a62359d0e183d45e50e999fc2c58f7805bda142/build-end.log

Any specific reason to not get the package from pypi?

-- 
Bye, Peter Korsgaard
