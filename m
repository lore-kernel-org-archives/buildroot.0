From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  6 May 2015 14:17:47 +0200
Subject: [Buildroot] [PATCH v3 0/3] Use a date for cvs and bump expect
Message-ID: <1430914670-14882-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set bump expect and in order to do that add to the cvs
script support for using a date instead of a tag.

v3:
 - remove already merged patch
 - use UTC instead of UCT (Arnout)
 - add documentation about using a branch
 - in the example remove the minutes from the timezone because it does not work
 - fix supporto for Fedora "-r :<tag>" -> "-r <tag>"
 - add ack-by and tested-by on the latest patch (Arnout)
v2:
 - add acked-by to the first patch
 - improve documentation about the date
 - use TZ=UCT to set a default time zone
 - add a patch to remove the comment at the end of the version string

Fabio Porcedda (3):
  support/download/cvs: add support to use a date instead of a tag
  manual: cvs: document that a branch or a date can be used
  expect: bump to version 5.45.3

 docs/manual/adding-packages-generic.txt |  4 +++-
 package/expect/expect.hash              |  2 --
 package/expect/expect.mk                |  6 +++---
 support/download/cvs                    | 11 ++++++++++-
 4 files changed, 16 insertions(+), 7 deletions(-)
 delete mode 100644 package/expect/expect.hash

-- 
2.3.5
