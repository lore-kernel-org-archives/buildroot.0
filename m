From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 10:32:35 +0100
Subject: [Buildroot] [PATCH] scripts: xorg-release: handle case when
	version needs downgrade
In-Reply-To: <1391505976-13477-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 4 Feb 2014 10:26:16 +0100")
References: <1391505976-13477-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2j3i5os.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Nicolas Dechesne <ndec13@gmail.com>
 > the initial implementation assumes that when a version found in
 > buildroot is different from the one in the X11 release, it
 > requires an upgrade. even though this is most likely the case, it
 > could be a downgrade too, and it's probably worth highlighting
 > such cases when it (rarely) happens.

 > LooseVersion from distutils is doing the low level job of sorting
 > version numbers represented in strings...

 > [Thomas & Thomas:

 >   - do not count packages more recent in Buildroot than in the latest
 >     X.org release as to be downgraded. If we have more recent version,
 >     it's generally for a good reason, so we want to keep them as
 >     is. Such packages are counted as "nothing to do", but for
 >     information, we indicate that there are "More recent"

 >   - also remove the "nothing to do" action indicator. It used to be a
 >     simple dash, which was not really useful.
 > ]

 > Signed-off-by: Nicolas Dechesne <ndec13@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
