From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Sep 2017 08:13:57 +0000
Subject: [Buildroot] [Bug 10326] mesa3d package fails to build when
 BR2_SHARED_STATIC_LIBS=y
In-Reply-To: <bug-10326-163@https.bugs.busybox.net/>
References: <bug-10326-163@https.bugs.busybox.net/>
Message-ID: <bug-10326-163-Iwm54YP3aZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10326

--- Comment #4 from Frederic MATHIEU <frederic.mathieu@dualis.com> ---
I do understand that the package mesa3d does not support static libraries, but
others packages do. BR2_SHARED_STATIC_LIBS is global to all buildroot packages.
So if the Mesa package does support this feature, it must be deactivated only
for it. This is why the following code works very well:


ifeq ($(BR2_SHARED_STATIC_LIBS),y)
MESA3D_CONF_OPTS += --disable-static
endif

-- 
You are receiving this mail because:
You are on the CC list for the bug.
