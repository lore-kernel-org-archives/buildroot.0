From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 Jul 2010 13:57:36 +0000 (UTC)
Subject: [Buildroot] [Bug 2185] pixman can't apply
	pixman-0.10.0-no-tests.patch
In-Reply-To: <bug-2185-163@https.bugs.busybox.net/>
References: <bug-2185-163@https.bugs.busybox.net/>
Message-ID: <20100708135736.7833882794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2185

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
Strange, it works here (git version):

$ make
>>> pixman 0.17.6 Extracting
>>> pixman 0.17.6 Patching package/pixman

Applying pixman-0.10.0-no-tests.patch using plaintext: 
patching file Makefile.in
Hunk #1 succeeded at 211 with fuzz 1 (offset 13 lines).
for file in config.guess config.sub; do for i in $(find
/home/peko/source/buildroot/output/build/pixman-0.17.6 -name $file); do cp
package/gnuconfig/$file $i; done; done
>>>   Patching libtool

If you have a look in pixman-0.17.6.tar.gz, then you'll see it has a
Makefile.in. Could you try rm -rf output/build/pixman* and try again?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
