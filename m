From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Jul 2012 16:20:24 +0000 (UTC)
Subject: [Buildroot] [Bug 5360] buildroot fails when building "host-libglib2
 2.30.2 Building"
In-Reply-To: <bug-5360-163@https.bugs.busybox.net/>
References: <bug-5360-163@https.bugs.busybox.net/>
Message-ID: <20120715162024.2390B90E83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5360

--- Comment #10 from Shokurov Anton V. <anton@fit.com.ru> 2012-07-15 16:20:23 UTC ---
(In reply to comment #9)
> The name is cyrilic chars is the problem.

Yes. You are right. After moving the directory the build was successful.
After extending the package list i got a new error,

output/build/gcc-4.7.1-target/arm-unknown-linux-uclibcgnueabi/libstdc++-v3/include/fenv.h:36:24

can't find fenv.h

I have included the new config file as an attachment

> This gdbus-codegen Python script is
> generated from gdbus-codegen.in by replacing some paths into the script. And as
> the script doesn't declare any encoding, it doesn't like having non-ascii
> characters into the path. This also explains why it was working for me.
> 
> One option is to declare the script encoding as utf-8, but that would only work
> on utf-8 configured systems. On other systems, it would probably not work. This
> problem is not Buildroot's fault, so I think it should rather be reported to
> the glib maintainers.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
