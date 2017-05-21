From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 May 2017 23:38:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-enum34: change setup
	type to setuptools
In-Reply-To: <20170521114625.7884-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 21 May 2017 13:46:25 +0200")
References: <20170521114625.7884-1-bernd.kuhls@t-online.de>
Message-ID: <87o9ul28ml.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > With version 1.1.3 the project switched to setuptools:
 > https://bitbucket.org/stoneleaf/enum34/commits/589b4f9d2e733a32c6e67a1e7aa50f476920d121

 > Fixes
 > http://autobuild.buildroot.net/results/cb6/cb678ca9e57382a876f3f6034a47a4e2c59bc8d0/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Are you sure. I don't know much about Python packaging, but it still
has:

from distutils.core import setup

..

if __name__ == '__main__':
    setup(**data)


The tarball (and not git) has a dummy setup.cfg, which afaik is related
to setuptools.

I'm not sure what the correct fix is. Yegor? Either we patch out the
'import setuptools' line or we add host-python-setuptools to the
dependencies.

-- 
Bye, Peter Korsgaard
