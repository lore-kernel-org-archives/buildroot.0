From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jun 2021 16:09:56 +0200
Subject: [Buildroot] [PATCH 0/2 v4] gitlab-ci: allow running test-pkg
 (branch yem/test-pkg-in-gitlab-ci)
Message-ID: <cover.1624802988.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a respin of the previous work by Romain:
    http://lists.busybox.net/pipermail/buildroot/2021-June/thread.html#313369

Yann has done quite some extensive rework, so much so that it is not
sane to apply without further review.

So, the big changes from Romain's work, are:

  - utils/test-kpkg only lists, does not generate yaml output

  - support/scripts/generate-gitlab-ci-yml generates the yaml blurb from
    that list

  - an empty config fragment is now an error

  - a config fragment that yields no test is also an error

  - some eye-candy and code-styles in the shell scripts...

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Romain Naour (2):
      support/misc/gitlab-ci.yml.in
      utils/test-pkg: add gitlab-ci support

 .gitlab-ci.yml                         |  3 +++
 support/misc/gitlab-ci.yml.in          | 38 ++++++++++++++++++++++++-----
 support/scripts/generate-gitlab-ci-yml | 30 ++++++++++++++++++++++-
 utils/test-pkg                         | 44 ++++++++++++++++++++++++++--------
 4 files changed, 98 insertions(+), 17 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
