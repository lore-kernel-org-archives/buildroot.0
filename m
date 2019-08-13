From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 23:01:54 +0200
Subject: [Buildroot] [PATCH v3] support/testing: new test for root
 password
In-Reply-To: <20190813073320.2960-1-victor.huesca@bootlin.com>
References: <20190813073320.2960-1-victor.huesca@bootlin.com>
Message-ID: <20190813230154.3b9d413e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Aug 2019 09:33:20 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Add support to test that the root passowrd is working as expected.
> - Buildtime test: Check the hash present in the generated '/etc/shadow'.
> - Runtime test: Build an armv7 image and try to login with a password.
> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
> ---
> Changes:
>  v1 --> v2:
>    - Fix coding style to pass flake8 test
>  v2 --> v3:
>    - Add 'BR2_TARGET_ROOTFS_CPIO=y' to the .config
>    - Add myself as developer for this test
>    - Fix a typo 'has' --> 'hash'
>    - Use assertEqual(a, b) instead of assertTrue(a == b)
>    - Update .gitlab-ci.yml
> ---
>  .gitlab-ci.yml                                |  1 +
>  DEVELOPERS                                    |  3 ++
>  .../testing/tests/core/test_root_password.py  | 36 +++++++++++++++++++
>  3 files changed, 40 insertions(+)
>  create mode 100644 support/testing/tests/core/test_root_password.py

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
