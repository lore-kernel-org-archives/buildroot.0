From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue,  7 Apr 2020 16:45:10 +0530
Subject: [Buildroot] [PATCH v8 0/5] package/python-scipy: new package
Message-ID: <20200407111515.21131-1-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is v8 changes for python-scipy, here is the previous 
version series[1].

Changes for v8:
- add python-pybind11 tests from Adam
Changes for v7:
- bump 1.181.2 numpy
- drop 'BR2_PACKAGE_HOST_PYTHON_CYTHON' selection from numpy
- drop python2 dependency from gnuradio.mk
- drop python2 dependency from opencv3.mk
- rephrase commit and comments of fixup npymath.ini
- update commit message of pybind11, scipy
- fix sha256 value of pybind11 LICENCE
- drop 'BR2_PACKAGE_HOST_PYTHON_PYBIND11' selection from scipy 
Changes for v6:
- bump to numpy latest version
- drop python2 dependecy on numpy seelcted packages
- update numpy cross compilation changes
- add pybind11 package
- add latest python-scipy

[1] https://patchwork.ozlabs.org/cover/1259531/

Any inputs?
Jagan.

Adam Duskett (1):
  support/testing: add python-pybind11 test

Esben Haabendal (1):
  package/python-numpy: fixup npymath.ini for numpy extensions

Jagan Teki (3):
  package/python-numpy: Bump to version 1.18.2
  package/python-pybind11: new host package
  package/python-scipy: new package

 .gitlab-ci.yml                                |  2 +
 DEVELOPERS                                    |  4 +
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 package/gnuradio/Config.in                    |  2 +-
 package/gnuradio/gnuradio.mk                  |  4 +-
 package/opencv3/Config.in                     |  2 +-
 package/opencv3/opencv3.mk                    | 14 ----
 package/python-numpy/Config.in                |  1 +
 package/python-numpy/python-numpy.hash        | 14 ++--
 package/python-numpy/python-numpy.mk          | 19 ++++-
 package/python-pybind11/Config.in.host        |  7 ++
 package/python-pybind11/python-pybind11.hash  |  5 ++
 package/python-pybind11/python-pybind11.mk    | 14 ++++
 package/python-scipy/Config.in                | 22 ++++++
 package/python-scipy/python-scipy.hash        |  9 +++
 package/python-scipy/python-scipy.mk          | 46 +++++++++++
 .../br2-external/python-pybind11/Config.in    |  1 +
 .../python-pybind11/external.desc             |  1 +
 .../br2-external/python-pybind11/external.mk  |  1 +
 .../Config.in                                 |  5 ++
 .../pybind11_addition_example.cpp             |  9 +++
 .../python-pybind11-addition-example.mk       | 39 ++++++++++
 .../sample_python_pybind11.py                 |  4 +
 .../tests/package/test_python_pybind11.py     | 76 +++++++++++++++++++
 25 files changed, 277 insertions(+), 26 deletions(-)
 create mode 100644 package/python-pybind11/Config.in.host
 create mode 100644 package/python-pybind11/python-pybind11.hash
 create mode 100644 package/python-pybind11/python-pybind11.mk
 create mode 100644 package/python-scipy/Config.in
 create mode 100644 package/python-scipy/python-scipy.hash
 create mode 100644 package/python-scipy/python-scipy.mk
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/Config.in
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/external.desc
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/external.mk
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/Config.in
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/pybind11_addition_example.cpp
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/python-pybind11-addition-example.mk
 create mode 100644 support/testing/tests/package/br2-external/python-pybind11/package/python-pybind11-addition-example/sample_python_pybind11.py
 create mode 100644 support/testing/tests/package/test_python_pybind11.py

-- 
2.17.1
