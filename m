From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 19 Nov 2015 11:36:01 +0100
Subject: [Buildroot] [PATCH 0/5] Introduce alternative archive format
Message-ID: <1447929366-8972-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As suggested by Arnout [1], this series provide an alternative archive
format. This new format contains a shallowed version of upstream
repository. This format is a little bigger and a little longer to
create but it allow a better workflow with upstream. I describe some
good practice in patch 2.

Notice projects hosted by github don't yet benefit of this feature
since I have not found any elegant way to do it :-(. 

During my tests, I have noticed current shallow clone is mostly broken
(at least with git < 2.5 [2]). Indeed, shallow clone only work with
symbolic references (HEAD, a tag or a branch). However, we avoid use of
symbolic references in VERSION.

[1] http://lists.busybox.net/pipermail/buildroot/2015-November/144296.html
[2] http://stackoverflow.com/a/30701724/301717


J?r?me Pouiller (5):
  pkg-download: do not test SITE_METHOD
  download/git: allow to create archives containing shallowed git repos
  pkg-generic: allow to populate build directory from a git archive
  pkg-generic: provide an option to use git archives
  pkg-generic: tag sources if git is used

 Config.in               | 13 +++++++++++
 package/pkg-download.mk |  7 +-----
 package/pkg-generic.mk  | 60 ++++++++++++++++++++++++++++++++++---------------
 support/download/git    | 30 ++++++++++++++++++++++---
 4 files changed, 83 insertions(+), 27 deletions(-)

-- 
2.1.4
