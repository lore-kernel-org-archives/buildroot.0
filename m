From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 16 Nov 2018 01:57:20 -0200
Subject: [Buildroot] [next 00/15] a few more runtime test cases for python
 packages - series 2/n
In-Reply-To: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
Message-ID: <20181116035735.31507-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

One way to reduce the burden of manual tests and also detect broken runtime
dependencies is to have more test cases (even simple ones) for python packages.
Well... here are some.

All runtime-tests on GitLab CI:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/36800857

Regards,
Ricardo

Ricardo Martincoski (15):
  support/testing: add python-argh tests
  support/testing: add python-attrs tests
  support/testing: add python-automat tests
  support/testing: add python-bitstring tests
  support/testing: add python-cbor tests
  support/testing: add python-click tests
  support/testing: add python-constantly tests
  support/testing: add python-passlib tests
  support/testing: add python-pexpect tests
  support/testing: add python-pynacl tests
  support/testing: add python-pyyaml tests
  support/testing: add python-service-identity tests
  support/testing: add python-subprocess32 test
  support/testing: add python-treq tests
  support/testing: add python-ubjson tests

 .gitlab-ci.yml                                | 29 ++++++++++++
 .../tests/package/sample_python_argh.py       | 10 +++++
 .../tests/package/sample_python_attrs.py      | 15 +++++++
 .../tests/package/sample_python_automat.py    | 27 +++++++++++
 .../tests/package/sample_python_bitstring.py  |  6 +++
 .../tests/package/sample_python_cbor_dec.py   | 10 +++++
 .../tests/package/sample_python_cbor_enc.py   | 14 ++++++
 .../tests/package/sample_python_click.py      | 12 +++++
 .../tests/package/sample_python_constantly.py | 19 ++++++++
 .../tests/package/sample_python_passlib.py    |  5 +++
 .../tests/package/sample_python_pexpect.py    |  8 ++++
 .../tests/package/sample_python_pynacl.py     |  3 ++
 .../tests/package/sample_python_pyyaml_dec.py | 10 +++++
 .../tests/package/sample_python_pyyaml_enc.py | 14 ++++++
 .../package/sample_python_service_identity.py |  2 +
 .../package/sample_python_subprocess32.py     |  6 +++
 .../tests/package/sample_python_treq.py       | 16 +++++++
 .../tests/package/sample_python_ubjson_dec.py | 10 +++++
 .../tests/package/sample_python_ubjson_enc.py | 14 ++++++
 .../testing/tests/package/test_python_argh.py | 45 +++++++++++++++++++
 .../tests/package/test_python_attrs.py        | 21 +++++++++
 .../tests/package/test_python_automat.py      | 23 ++++++++++
 .../tests/package/test_python_bitstring.py    | 21 +++++++++
 .../testing/tests/package/test_python_cbor.py | 23 ++++++++++
 .../tests/package/test_python_click.py        | 44 ++++++++++++++++++
 .../tests/package/test_python_constantly.py   | 21 +++++++++
 .../tests/package/test_python_passlib.py      | 23 ++++++++++
 .../tests/package/test_python_pexpect.py      | 21 +++++++++
 .../tests/package/test_python_pynacl.py       | 27 +++++++++++
 .../tests/package/test_python_pyyaml.py       | 23 ++++++++++
 .../package/test_python_service_identity.py   | 23 ++++++++++
 .../tests/package/test_python_subprocess32.py | 11 +++++
 .../testing/tests/package/test_python_treq.py | 29 ++++++++++++
 .../tests/package/test_python_ubjson.py       | 23 ++++++++++
 34 files changed, 608 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_argh.py
 create mode 100644 support/testing/tests/package/sample_python_attrs.py
 create mode 100644 support/testing/tests/package/sample_python_automat.py
 create mode 100644 support/testing/tests/package/sample_python_bitstring.py
 create mode 100644 support/testing/tests/package/sample_python_cbor_dec.py
 create mode 100644 support/testing/tests/package/sample_python_cbor_enc.py
 create mode 100644 support/testing/tests/package/sample_python_click.py
 create mode 100644 support/testing/tests/package/sample_python_constantly.py
 create mode 100644 support/testing/tests/package/sample_python_passlib.py
 create mode 100644 support/testing/tests/package/sample_python_pexpect.py
 create mode 100644 support/testing/tests/package/sample_python_pynacl.py
 create mode 100644 support/testing/tests/package/sample_python_pyyaml_dec.py
 create mode 100644 support/testing/tests/package/sample_python_pyyaml_enc.py
 create mode 100644 support/testing/tests/package/sample_python_service_identity.py
 create mode 100644 support/testing/tests/package/sample_python_subprocess32.py
 create mode 100644 support/testing/tests/package/sample_python_treq.py
 create mode 100644 support/testing/tests/package/sample_python_ubjson_dec.py
 create mode 100644 support/testing/tests/package/sample_python_ubjson_enc.py
 create mode 100644 support/testing/tests/package/test_python_argh.py
 create mode 100644 support/testing/tests/package/test_python_attrs.py
 create mode 100644 support/testing/tests/package/test_python_automat.py
 create mode 100644 support/testing/tests/package/test_python_bitstring.py
 create mode 100644 support/testing/tests/package/test_python_cbor.py
 create mode 100644 support/testing/tests/package/test_python_click.py
 create mode 100644 support/testing/tests/package/test_python_constantly.py
 create mode 100644 support/testing/tests/package/test_python_passlib.py
 create mode 100644 support/testing/tests/package/test_python_pexpect.py
 create mode 100644 support/testing/tests/package/test_python_pynacl.py
 create mode 100644 support/testing/tests/package/test_python_pyyaml.py
 create mode 100644 support/testing/tests/package/test_python_service_identity.py
 create mode 100644 support/testing/tests/package/test_python_subprocess32.py
 create mode 100644 support/testing/tests/package/test_python_treq.py
 create mode 100644 support/testing/tests/package/test_python_ubjson.py

-- 
2.17.1
