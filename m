From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 May 2020 13:15:13 +0000
Subject: [Buildroot] [Bug 12941] Python GObject fails to build when using
 BR2_PER_PACKAGE_DIRECTORIES
In-Reply-To: <bug-12941-163@https.bugs.busybox.net/>
References: <bug-12941-163@https.bugs.busybox.net/>
Message-ID: <bug-12941-163-iEAtRfw27v@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12941

--- Comment #1 from Asaf Kahlon <asafka7@gmail.com> ---
This failure happens because the evaluation of PKG_PYTHON_SYSCONFIGDATA_NAME at
python-gobject.mk is done on the configure step, but because we haven't rsynced
the dependencies yet there's nothing on the per-package directory.
You can also see that if you do "make python-gobject" twice: on the first time
it will fail, but on the second time everything will be fine because all the
dependencies have been rsynced to the per-package dir.

I'm not sure how to solve this problem, but at least we know why it happens.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
