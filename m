From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 22 Mar 2017 09:17:59 +0100
Subject: [Buildroot] [PATCH v3 2/5] support/testing: add core tests
In-Reply-To: <1490042214-6762-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490042214-6762-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LV-OfyZsEoX0Ja8KndLoA5MM=OyuwMTAvi9ptUP1SvzXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 20, 2017 at 9:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit adds a few Buildroot "core" tests, testing functionalities
> such as:
>
>  - post-build and post-image scripts
>  - root filesystem overlays
>  - timezone support
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/testing/tests/core/__init__.py             |  0
>  support/testing/tests/core/post-build.sh           | 12 ++++
>  support/testing/tests/core/post-image.sh           | 12 ++++
>  .../testing/tests/core/rootfs-overlay1/test-file1  |  1 +
>  .../tests/core/rootfs-overlay2/etc/test-file2      |  1 +
>  support/testing/tests/core/test_post_scripts.py    | 40 +++++++++++++
>  support/testing/tests/core/test_rootfs_overlay.py  | 27 +++++++++
>  support/testing/tests/core/test_timezone.py        | 66 ++++++++++++++++++++++
>  8 files changed, 159 insertions(+)
>  create mode 100644 support/testing/tests/core/__init__.py
>  create mode 100755 support/testing/tests/core/post-build.sh
>  create mode 100755 support/testing/tests/core/post-image.sh
>  create mode 100644 support/testing/tests/core/rootfs-overlay1/test-file1
>  create mode 100644 support/testing/tests/core/rootfs-overlay2/etc/test-file2
>  create mode 100644 support/testing/tests/core/test_post_scripts.py
>  create mode 100644 support/testing/tests/core/test_rootfs_overlay.py
>  create mode 100644 support/testing/tests/core/test_timezone.py

Two minor comments:

I think it would be cleaner to move support files for tests, like the
post-build.sh and post-image.sh and rootfs-overlays, to a subdirectory
instead of in the same location as the tests.

Also, I would argue that the rootfs-overlays do not need to be real
files in git but can be generated on the fly during the test.

/Thomas
