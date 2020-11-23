From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 23 Nov 2020 03:17:49 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_13321=5D_utils/scanpypi=3A_fails_wi?=
 =?utf-8?q?th_packages_that_define_a_package=E2=80=99s_metadata_in_setup?=
 =?utf-8?q?=2Ecfg?=
In-Reply-To: <bug-13321-163@https.bugs.busybox.net/>
References: <bug-13321-163@https.bugs.busybox.net/>
Message-ID: <bug-13321-163-IdHIZcYI12@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13321

--- Comment #1 from kirby at kjn.com.au ---
I'm seeing something similar trying to make a package for python-debugpy. 
I have yet to find a workaround unless anyone has any suggestions?

user at ubuntu:~/buildroot-2020.05.1$ python3 utils/scanpypi debugpy -o package
utils/scanpypi:23: DeprecationWarning: the imp module is deprecated in favour
of importlib; see the module's documentation for alternative uses
  import imp
spdx_lookup module is not installed. This can lead to an inaccurate licence
detection. Please install it via
pip install spdx_lookup
buildroot package name for debugpy: python-debugpy
Package: python-debugpy
Fetching package debugpy
Downloading package debugpy from
https://files.pythonhosted.org/packages/12/73/35e48dfeb1e26fbc6fe6e888c5b7507f7010488bb1d7363322edc38c03c6/debugpy-1.2.0.zip...
Error: Could not install package debugpy: module 'setup' has no attribute
'main'

-- 
You are receiving this mail because:
You are on the CC list for the bug.
