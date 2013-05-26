From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 12:31:14 +0000 (UTC)
Subject: [Buildroot] [Bug 4796] apply-patches.sh reorders patches given on
 the command line
In-Reply-To: <bug-4796-163@https.bugs.busybox.net/>
References: <bug-4796-163@https.bugs.busybox.net/>
Message-ID: <20130526123114.411139A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4796

--- Comment #4 from Christoph Schulz <develop@kristov.de> 2013-05-26 12:30:04 UTC ---
(In reply to comment #3)
> What are the packages affected by this bug?
> 
> Note that using the latest patch policy (see the new patch naming convention):
> http://buildroot.org/downloads/manual/manual.html#patch-policy
> 
> After fixing the culprit patch filenames, this bug should not occurs anymore.

We have extended the uClibc buildroot by many additional packages which
sometimes contain patches in debian/patches/. These patches are not ordered by
name, rather there is a file debian/patches/series which contains the patches
to be applied line by line. These are _not_ patches that lie in
buildroot/package/<name>/.

You should not assume that users of the uClibc buildroot only use packages that
are contained therein. This is a mistake. Typically, the buildroot is extended
by other self-made or customized packages in order to provide additional,
target-specific functionality. In our case, we e.g. provide packages for the
various ISDN-related tools coming with the isdnutils package. We take the
isdnutils sources from Debian which distributes them in two archives: the
original sources and separate patches, structured as described above.


Best regards,

Christoph

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
