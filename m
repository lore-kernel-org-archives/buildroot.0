From: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
Date: Wed, 28 Jun 2017 16:39:22 +0900
Subject: [Buildroot] [FYI 0/2] Qt5.9 and pcre2
Message-ID: <104a0453-7ac4-f6d9-3e66-2671b313d757@melcoinc.co.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all.
What mean FYI of subject?
It's mean that just share.
I can't modify and cleanup.because, I'm busy.

I understand patches is very dirty.

===
No1. Qt5.9 needs pcre2.but buildroot haven't it yet.

https://wiki.qt.io/New_Features_in_Qt_5.9
which better for buildroot?
a)Create package pcre2
b)Use pcre2 include qt
I think better a. so, I created the package.

No2. Qt5.9 is LTS
https://blog.qt.io/blog/2017/05/11/introducing-long-term-support-qt-5-9/

I made We can select qt version.

Naoki Matsumoto (2):
   WIP:pcre2: new package
   WIP:qt5: Bump up to 5.9

  package/Config.in                |  1 +
  package/pcre2/Config.in          | 22 ++++++++++++++++++++++
  package/pcre2/pcre2.hash         |  2 ++
  package/pcre2/pcre2.mk           | 20 ++++++++++++++++++++
  package/qt5/Config.in            | 11 +++++++++++
  package/qt5/qt5.mk               |  6 ++++++
  package/qt5/qt5base/qt5base.hash |  3 +++
  package/qt5/qt5base/qt5base.mk   |  7 +++++++
  8 files changed, 72 insertions(+)
  create mode 100644 package/pcre2/Config.in
  create mode 100644 package/pcre2/pcre2.hash
  create mode 100644 package/pcre2/pcre2.mk

-- 
2.7.4
