From: Christian Stewart <christian@paral.in>
Date: Tue, 15 Dec 2020 15:38:29 -0800
Subject: [Buildroot] host-ninja: ccache: build failure on latest Ubuntu host
 system
Message-ID: <CA+h8R2pnu3Gn=AzhffpVUsAghS47fGSaDDQ5M5sekGyKdnNckg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

For some reason against latest Ubuntu, Buildroot builds have been
failing for me since upgrading to 2020.11.x on GitHub Actions:

https://github.com/skiffos/SkiffOS/actions/runs/424300538

The error is related to the ccache, the ccache appears to be getting
incorrect flags:

>>> host-ninja 1.10.0 Configuring
-- The C compiler identification is unknown
-- The CXX compiler identification is unknown
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - failed
-- Check for working C compiler: host/bin/ccache
-- Check for working C compiler: host/bin/ccache - broken
CMake Error at CMakeTestCCompiler.cmake:66 (message):
  The C compiler

    "host/bin/ccache"

  is not able to compile a simple test program.

  It fails with the following output:

   host/bin/ccache: invalid option -- 'O'

It appears that the ccache is getting an option meant for gcc - I
found a few emails mentioning this from a long time ago which said to
wrap the CFLAGS with quotes.

Given that this is a fairly standard Ubuntu system I don't think this
is related to the fact that it's running in a GitHub action (which has
worked fine in the past).

Thanks for any help on this.

Best regards,
Christian Stewart
