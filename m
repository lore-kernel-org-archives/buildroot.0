From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Aug 2014 18:05:12 +0000 (UTC)
Subject: [Buildroot] [Bug 7262] Generating locale en_US.UTF-8 fails on 64bit
 fedora linux host
In-Reply-To: <bug-7262-163@https.bugs.busybox.net/>
References: <bug-7262-163@https.bugs.busybox.net/>
Message-ID: <20140812180512.423B69D430@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7262

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #4 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-08-12 18:05:11 UTC ---
I installed Fedora 20 on a 64-bit VirtualBox machine, and built buildroot
2014.05 with the configuration you provided.
The build went successful, and thus I am not able to reproduce this issue:

>>> host-localedef 2.14.1-r17443-ptx1 Installing to host directory
/usr/bin/install -D -m 0755
/home/tdescham/buildroot-2014.05/output/build/host-localedef-2.14.1-r17443-ptx1/localedef
/home/tdescham/buildroot-2014.05/output/host/usr/bin/localedef
Generating locale en_US.UTF-8
>>>   Finalizing target directory
rm -f /home/tdescham/buildroot-2014.05/output/build/locales.nopurge
for i in C en; do echo $i >>
/home/tdescham/buildroot-2014.05/output/build/locales.nopurge; done


Moreover, as I mentioned in a previous comment, the relation between a lib64
symlink in output/target and the generation of locales failing due to a
temporary file, sounds very odd to me.

For these reasons, I am closing this bug report. 
Do reopen this bug if you can prove that the problem is reproducible. In this
case, please try to provide us with more detail regarding the problem, given
that I was not able to reproduce with seemingly the same configuration. Do also
verify with the latest buildroot in this case.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
