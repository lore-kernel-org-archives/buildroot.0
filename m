From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 10:12:16 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: add luaposix test
In-Reply-To: <20190721085143.6857-2-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 21 Jul 2019 10:51:43 +0200")
References: <20190721085143.6857-1-francois.perrad@gadz.org>
 <20190721085143.6857-2-francois.perrad@gadz.org>
Message-ID: <87a7ct484f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

> ---
 >  .../testing/tests/package/test_luaposix.py    | 81 +++++++++++++++++++
 >  1 file changed, 81 insertions(+)
 >  create mode 100644 support/testing/tests/package/test_luaposix.py

 > diff --git a/support/testing/tests/package/test_luaposix.py b/support/testing/tests/package/test_luaposix.py
 > new file mode 100644
 > index 000000000..0182faf2f
 > --- /dev/null
 > +++ b/support/testing/tests/package/test_luaposix.py
 > @@ -0,0 +1,81 @@
 > +from tests.package.test_lua import TestLuaBase
 > +
 > +
 > +class TestLuaLuaPosix(TestLuaBase):
 > +    config = TestLuaBase.config + \
 > +        """
 > +        BR2_PACKAGE_LUA=y
 > +        BR2_PACKAGE_LUAPOSIX=y
 > +        """
 > +
 > +    def test_run(self):
 > +        self.login()
 > +        self.module_test("posix.version", "print(require[[posix.version]])")
 > +        self.module_test("posix.ctype")
 > +        self.module_test("posix.dirent")
 > +        self.module_test("posix.errno")
 > +        self.module_test("posix.fcntl")
 > +        self.module_test("posix.fnmatch")
 > +        self.module_test("posix.glob")
 > +        self.module_test("posix.grp")
 > +        self.module_test("posix.libgen")
 > +        self.module_test("posix.poll")
 > +        self.module_test("posix.pwd")
 > +        self.module_test("posix.sched")
 > +        self.module_test("posix.signal")
 > +        self.module_test("posix.stdio")
 > +        self.module_test("posix.stdlib")
 > +        self.module_test("posix.sys.msg")
 > +        self.module_test("posix.sys.resource")
 > +        self.module_test("posix.sys.socket")
 > +        self.module_test("posix.sys.stat")
 > +        self.module_test("posix.sys.statvfs")
 > +        self.module_test("posix.sys.time")
 > +        self.module_test("posix.sys.times")
 > +        self.module_test("posix.sys.utsname")
 > +        self.module_test("posix.sys.wait")
 > +        self.module_test("posix.syslog")
 > +        self.module_test("posix.termio")
 > +        self.module_test("posix.time")
 > +        self.module_test("posix.unistd")
 > +        self.module_test("posix.utime")
 > +
 > +
 > +class TestLuajitLuaPosix(TestLuaBase):
 > +    config = TestLuaBase.config + \
 > +        """
 > +        BR2_PACKAGE_LUAJIT=y
 > +        BR2_PACKAGE_LUAPOSIX=y
 > +        """
 > +
 > +    def test_run(self):
 > +        self.login()
 > +        self.module_test("posix.version", "print(require[[posix.version]])")
 > +        self.module_test("posix.ctype")
 > +        self.module_test("posix.dirent")
 > +        self.module_test("posix.errno")
 > +        self.module_test("posix.fcntl")
 > +        self.module_test("posix.fnmatch")
 > +        self.module_test("posix.glob")
 > +        self.module_test("posix.grp")
 > +        self.module_test("posix.libgen")
 > +        self.module_test("posix.poll")
 > +        self.module_test("posix.pwd")
 > +        self.module_test("posix.sched")
 > +        self.module_test("posix.signal")
 > +        self.module_test("posix.stdio")
 > +        self.module_test("posix.stdlib")
 > +        self.module_test("posix.sys.msg")
 > +        self.module_test("posix.sys.resource")
 > +        self.module_test("posix.sys.socket")
 > +        self.module_test("posix.sys.stat")
 > +        self.module_test("posix.sys.statvfs")
 > +        self.module_test("posix.sys.time")
 > +        self.module_test("posix.sys.times")
 > +        self.module_test("posix.sys.utsname")
 > +        self.module_test("posix.sys.wait")
 > +        self.module_test("posix.syslog")
 > +        self.module_test("posix.termio")
 > +        self.module_test("posix.time")
 > +        self.module_test("posix.unistd")
 > +        self.module_test("posix.utime")
 > -- 
 > 2.20.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
