From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:38:28 +0200
Subject: [Buildroot] [git commit] binutils: backport gas xtensa jump
	trampolines
Message-ID: <20140403193845.5E01F9A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6acb2e1db29238b7d05a30968a29753e879ab819
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes compilation of huge source files that have jumps with offsets
greater than 128 Kbytes, that otherwise fails with such messages:

  {standard input}:65267: Error: operand 1 of 'j' has out of range value '131089'
  {standard input}:106879: Error: operand 1 of 'j' has out of range value '4294833951'

Fixes:
  http://autobuild.buildroot.net/results/e45/e450d5efc7435035c956bb962d598837648f319d/

Backported from: a82c7d9030b67a6a76a5403d0e1641f9e42141ac
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/2.22/900-xtensa-trampolines.patch |  977 ++++++++++++++++++++
 .../binutils/2.23.1/900-xtensa-trampolines.patch   |  977 ++++++++++++++++++++
 .../binutils/2.23.2/900-xtensa-trampolines.patch   |  977 ++++++++++++++++++++
 package/binutils/2.24/900-xtensa-trampolines.patch |  977 ++++++++++++++++++++
 4 files changed, 3908 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
