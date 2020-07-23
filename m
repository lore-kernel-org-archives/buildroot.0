From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jul 2020 22:54:41 +0200
Subject: [Buildroot] [PATCH 00/11] Overwritten file detection,
 improvements to file listing logic
In-Reply-To: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200723205441.GH2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-30 11:52 +0200, Thomas Petazzoni spake thusly:
[--SNIP--]
> Thomas Petazzoni (11):
>   package/pkg-generic.mk: use $(PKG)_NAME in step_pkg_size_after
>   package/pkg-generic.mk: drop useless $(1) argument in
>     step_pkg_size_{before,after}
>   package/pkg-generic.mk: introduce final 'install' step
>   package/pkg-generic.mk: create directories upfront in the configure
>     step
>   package/pkg-generic.mk: rework pkg_size logic with the "installed"
>     step
>   package/pkg-generic.mk: exclude the staging sub-directory
>   package/pkg-generic.mk: move pkg_size_{before,after} and
>     check_bin_arch functions

Patches 1..7 applied to master, thanks.

I take back my comments on patch 5, you were right. As a consequence, I
also take back my comments on patch 7.

I take back my suggestion on patch 6: it does not work perfectly, and
the output changes slightly, so scritps that interpert the content would
have to be changed

>   package/pkg-generic.mk: detect files overwritten in TARGET_DIR and
>     HOST_DIR

For that one, I still have open questions about it, so I did not apply.

Thanks! :-)

Regards,
Yann E. MORIN.

>   support/testing/infra: add log_file_path() function
>   support/testing/tests: add test for check_bin_arch
>   support/testing/tests: add test for file overwrite detection
> 
>  .gitlab-ci.yml                                |   3 +
>  package/pkg-generic.mk                        | 146 ++++++++++--------
>  package/pkg-utils.mk                          |   1 -
>  support/testing/infra/__init__.py             |  13 +-
>  .../br2-external/detect-bad-arch/Config.in    |   1 +
>  .../detect-bad-arch/external.desc             |   1 +
>  .../br2-external/detect-bad-arch/external.mk  |   1 +
>  .../package/detect-bad-arch/Config.in         |   4 +
>  .../detect-bad-arch/detect-bad-arch.mk        |  15 ++
>  .../br2-external/detect-overwrite/Config.in   |   1 +
>  .../detect-overwrite/external.desc            |   1 +
>  .../br2-external/detect-overwrite/external.mk |   1 +
>  .../package/detect-overwrite/Config.in        |   5 +
>  .../detect-overwrite/detect-overwrite.mk      |  19 +++
>  support/testing/tests/core/test_bad_arch.py   |  19 +++
>  .../testing/tests/core/test_file_overwrite.py |  47 ++++++
>  16 files changed, 213 insertions(+), 65 deletions(-)
>  create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/Config.in
>  create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/external.desc
>  create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/external.mk
>  create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
>  create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
>  create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/Config.in
>  create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/external.desc
>  create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/external.mk
>  create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/Config.in
>  create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/detect-overwrite.mk
>  create mode 100644 support/testing/tests/core/test_bad_arch.py
>  create mode 100644 support/testing/tests/core/test_file_overwrite.py
> 
> -- 
> 2.25.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
