From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Nov 2019 21:34:02 +0100
Subject: [Buildroot] [PATCH 0/2] Fix the OpenCV Python module
Message-ID: <20191127203404.291090-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Bug https://bugs.busybox.net/show_bug.cgi?id=12171 was reported a long
time ago: the removal of the .py files causes the OpenCV Python module
to not work.

I have worked to fix this in OpenCV itself, by replacing the .py files
by .ini files that are parsed using ConfigParser, and submitted that
upstream:

  https://github.com/opencv/opencv/pull/16008

However, the changes are not trivial, so we probably don't want to
have them in Buildroot as a patch, and I'm not sure if upstream will
accept them.

So in the mean time, I'm proposing a simpler approach, which was
suggested by Arnout: have a mechanism to exclude some .py files from
the removal.

Best regards,

Thomas

Thomas Petazzoni (2):
  package/{python,python3}: add mechanism to exclude .py files from
    removal
  package/opencv3: ensure the python module works when
    BR2_PACKAGE_PYTHON{,3}_PYC_ONLY=y

 package/opencv3/opencv3.mk | 2 ++
 package/python/python.mk   | 4 +++-
 package/python3/python3.mk | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.23.0
