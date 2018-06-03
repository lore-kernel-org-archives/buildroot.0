From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 03 Jun 2018 01:24:37 -0300
Subject: [Buildroot] [PATCH 3/4] support/testing: fix python syntax
References: <141e1e33fdf6b4601677642ab64e7d76969ca96a.1527977964.git.yann.morin.1998@free.fr>
Message-ID: <5b136d851dd0e_208c3fee360e65a052968@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Jun 02, 2018 at 07:19 PM, Yann E. MORIN wrote:

> We're about to switch to using the flake8 from the distro, and that one
> uncovers two more issues that the previously used pip-provided one did
> not catch:

See my comments to patch 4. What generates more warnings is the fact that we
start using Python3 interpreter to call flake8.

We can call this patch a step towards Python 3 support for the test infra.

[snip]
> ---
>  support/testing/infra/__init__.py | 6 +++---
>  support/testing/infra/basetest.py | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

By running one of below commands (after the others from .gitlab-ci.yml) I get:
$ python3 -m flake8 --statistics --count $(cat files.processed)
$ flake8 --statistics --count $(cat files.processed)

support/testing/infra/basetest.py:49:28: E999 SyntaxError: invalid syntax
support/testing/infra/__init__.py:37:29: E999 SyntaxError: invalid syntax
support/testing/run-tests:44:29: E999 SyntaxError: invalid syntax
3     E999 SyntaxError: invalid syntax
3

So it seems support/testing/run-tests also needs to be changed.


Regards,
Ricardo
