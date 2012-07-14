From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 14 Jul 2012 15:23:08 +0000 (UTC)
Subject: [Buildroot] [Bug 5360] buildroot fails when building "host-libglib2
 2.30.2 Building"
In-Reply-To: <bug-5360-163@https.bugs.busybox.net/>
References: <bug-5360-163@https.bugs.busybox.net/>
Message-ID: <20120714152308.9C3BD90DE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5360

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-07-14 15:23:08 UTC ---
The name is cyrilic chars is the problem. This gdbus-codegen Python script is
generated from gdbus-codegen.in by replacing some paths into the script. And as
the script doesn't declare any encoding, it doesn't like having non-ascii
characters into the path. This also explains why it was working for me.

One option is to declare the script encoding as utf-8, but that would only work
on utf-8 configured systems. On other systems, it would probably not work. This
problem is not Buildroot's fault, so I think it should rather be reported to
the glib maintainers.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
