From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 30 Jun 2016 12:33:09 +0200
Subject: [Buildroot] Python distutils.sysconfig values
Message-ID: <5774F565.1070603@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

i'm trying to enable the gpsd python module in Buildroot (currently it's
disabled, see package/gpsd/gpsd.mk line #25). The gpsd build system uses
scons, which in turn uses distutils.sysconfig to get the value of
various paramaters (like the compiler to use, etc) like this:

> vars = sysconfig.get_config_vars('CC', 'CXX', 'OPT', 'BASECFLAGS', 'CCSHARED', 'LDSHARED', 'SO', 'INCLUDEPY', 'LDFLAGS')

which apparently yields the following values:

> ['/usr/bin/gcc -pthread', '/usr/bin/g++ -pthread', '-DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes', '-fno-strict-aliasing', '-fPIC', '/usr/bin/gcc -pthread -shared -L/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/lib -L/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/usr/lib -Wl,-rpath,/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/usr/lib -Wl,--enable-new-dtags', '.so', '/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/usr/include/python2.7', '-L/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/lib -L/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/usr/lib -Wl,-rpath,/home/zgyarmati/projects/buildroot-upstream/buildroot/output/host/usr/lib -Wl,--enable-new-dtags']


 Note that some of the variables related to the BR environment (like the
python include dir), while others (most importantly CC) are coming from
the host environment.
 Does anybody could offer a hint where to look to get
distutils.sysconfig to set all of these values correctly?

Thanks in advance,

-- 
Zoltan Gyarmati
https://zgyarmati.de
