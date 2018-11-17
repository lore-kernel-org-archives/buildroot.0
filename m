From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 17 Nov 2018 18:52:40 +0100
Subject: [Buildroot] [RFC 0/4] suppport/testing: Perl, Lua and their modules
Message-ID: <20181117175244.23594-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The testing infrastructure seems not yet documented.
So, I use the recent work on Python2/3 modules as example.

On my local machine, I run successfully:
	flake8
	run-tests --list
So, the Python syntax is correct.
But, I don't know how to run a test on Qemu.

As future work, I think that scancpan could generate test for Perl/CPAN packages.
Loading a pure Perl module has no real added value.
So, test will be generated only for XS modules.

luainterpreter is a virtual package, provided by lua or luajit.
lua comes with 3 versions (5.1, 5.2, 5.3), 5.3 is the BR default.
On 32 bits target, BR enables by default the "32 bits numbers" compilation option.
I think that most of upstream authors never test their modules with a "32 bits numbers" lua.
Currently, test_lua uses this worst config (Lua 5.3 "32 bits numbers").
What do you think about shuffle various Lua interpreters ?

Francois Perrad (4):
  support/testing: add perl test
  support/testing: add perl-time-hires test
  support/testing: add lua test
  support/testing: add lpeg test

 .gitlab-ci.yml                                |  4 +++
 support/testing/tests/package/test_lua.py     | 33 +++++++++++++++++++
 .../testing/tests/package/test_lua_lpeg.py    | 13 ++++++++
 support/testing/tests/package/test_perl.py    | 33 +++++++++++++++++++
 .../tests/package/test_perl_time_hires.py     | 12 +++++++
 5 files changed, 95 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua.py
 create mode 100644 support/testing/tests/package/test_lua_lpeg.py
 create mode 100644 support/testing/tests/package/test_perl.py
 create mode 100644 support/testing/tests/package/test_perl_time_hires.py

-- 
2.17.1
