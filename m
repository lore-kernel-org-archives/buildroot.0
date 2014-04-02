From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Apr 2014 07:35:04 +0000 (UTC)
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <bug-7016-163@https.bugs.busybox.net/>
References: <bug-7016-163@https.bugs.busybox.net/>
Message-ID: <20140402073504.199469BF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7016

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-04-02 07:35:03 UTC ---
Can you provide more details on how you actually run this image? I am not
familiar with Docker, so more details about how you run this is very welcome.

Have you tried using a similar configuration on a non-docker environment, like
qemu or a real target?

Also, did you try to run git through 'strace' to see what is actually going on?
Have you tried making a new local git repo using the git inside this image, and
then clone that with the same git? Or have you only tried cloning an external
git repo? If there is a problem with importing git data, the inflate can
obviously fail. Generating a local git repo would help excluding that.

For reference to others, here seems to be the basic flow to generate docker
image using buildroot: (Jerome Petazzoni)
http://blog.docker.io/2013/06/create-light-weight-docker-containers-buildroot/

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
