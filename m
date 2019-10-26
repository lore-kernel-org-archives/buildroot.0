From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Oct 2019 12:40:04 +0200
Subject: [Buildroot] [PATCH v3 0/7] bcc front end tool for eBPF
In-Reply-To: <1557130548-6267-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557130548-6267-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <6419071e-2b94-0479-958d-20e3364dc245@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/05/2019 10:15, Jugurtha BELKALEM wrote:
> eBPF is the lastest Linux tracer and considered to
> be a modern systemTap. However, eBPF programs are
> written in a flavour of C language (which is tedious).
> BCC allows to write eBPF scripts in Python and C which
> makes troubleshooting a system and identifying
> bottelenecks easier.
> More information is available at :
> https://github.com/iovisor/bcc/blob/master/README.md.
> 
> Jugurtha BELKALEM (5):
>   package/luajit: bump to version 2.1.x developpment version for aarch64
>   package/python-pytest: new package
>   package/python-pytest-runner: new package
>   package/python-traittypes: new package
>   package/python-bcc: new package
> 
> Romain Naour (2):
>   package/llvm: add BPF backend
>   package/bcc: new package

 We discussed this at the BR developer meeting, and came to the following
conclusions:

- For luajit, it should be considered independently of BCC. For target BCC,
luajit is (or could be made) optional, and anyway it still only for aarch64.

- Also, for luajit, it would be better to switch to
https://github.com/siddhesh/LuaJIT which does have recent releases.

- I wanted to apply the new python packages, but the pytest package has a
release 5.2.2 already; the other two probably also have more recent releases.

 Therefore, I marked the series as Changes Request in patchwork.

 Regards,
 Arnout


> 
>  DEVELOPERS                                         |  6 +++
>  package/Config.in                                  |  5 +++
>  ...CMake-Allow-to-disable-building-man-pages.patch | 35 +++++++++++++++
>  package/bcc/0002-fix-aarch64-cross-compile.patch   | 38 ++++++++++++++++
>  package/bcc/Config.in                              | 51 ++++++++++++++++++++++
>  package/bcc/bcc.hash                               |  3 ++
>  package/bcc/bcc.mk                                 | 23 ++++++++++
>  package/llvm/Config.in                             |  6 +++
>  package/llvm/llvm.mk                               |  5 +++
>  package/luajit/Config.in                           |  2 +-
>  package/luajit/luajit.hash                         |  1 +
>  package/luajit/luajit.mk                           |  6 +++
>  ...e-pytest-runner-a-conditional-requirement.patch | 49 +++++++++++++++++++++
>  package/python-bcc/Config.in                       | 10 +++++
>  package/python-bcc/python-bcc.hash                 |  3 ++
>  package/python-bcc/python-bcc.mk                   | 14 ++++++
>  .../0001-Remove-setuptools_scm-dependency.patch    | 29 ++++++++++++
>  package/python-pytest-runner/Config.in             |  9 ++++
>  .../python-pytest-runner/python-pytest-runner.hash |  3 ++
>  .../python-pytest-runner/python-pytest-runner.mk   | 15 +++++++
>  package/python-pytest/Config.in                    |  8 ++++
>  package/python-pytest/python-pytest.hash           |  5 +++
>  package/python-pytest/python-pytest.mk             | 15 +++++++
>  package/python-traittypes/Config.in                |  7 +++
>  package/python-traittypes/python-traittypes.hash   |  5 +++
>  package/python-traittypes/python-traittypes.mk     | 14 ++++++
>  26 files changed, 366 insertions(+), 1 deletion(-)
>  create mode 100644 package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch
>  create mode 100644 package/bcc/0002-fix-aarch64-cross-compile.patch
>  create mode 100644 package/bcc/Config.in
>  create mode 100644 package/bcc/bcc.hash
>  create mode 100644 package/bcc/bcc.mk
>  create mode 100644 package/python-bcc/0001-Make-pytest-runner-a-conditional-requirement.patch
>  create mode 100644 package/python-bcc/Config.in
>  create mode 100644 package/python-bcc/python-bcc.hash
>  create mode 100644 package/python-bcc/python-bcc.mk
>  create mode 100644 package/python-pytest-runner/0001-Remove-setuptools_scm-dependency.patch
>  create mode 100644 package/python-pytest-runner/Config.in
>  create mode 100644 package/python-pytest-runner/python-pytest-runner.hash
>  create mode 100644 package/python-pytest-runner/python-pytest-runner.mk
>  create mode 100644 package/python-pytest/Config.in
>  create mode 100644 package/python-pytest/python-pytest.hash
>  create mode 100644 package/python-pytest/python-pytest.mk
>  create mode 100644 package/python-traittypes/Config.in
>  create mode 100644 package/python-traittypes/python-traittypes.hash
>  create mode 100644 package/python-traittypes/python-traittypes.mk
> 
