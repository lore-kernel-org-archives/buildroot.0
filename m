From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 11 Dec 2009 11:03:07 -0500
Subject: [Buildroot] Errors building mkisofs
Message-ID: <a038bef50912110803x30c971c9sf44d4b21c118b8c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi List,

I've been seeing errors building mkisofs which in turn causes issues
generating an iso9660root file system image

../include/schily.h:111: error: conflicting types for ?fexecve?
/usr/include/unistd.h:552: note: previous declaration of ?fexecve? was
here
../include/schily.h:190: error: conflicting types for ?getline?
/usr/include/stdio.h:653: note: previous declaration of ?getline? was here

Not too surprising the definition for these functions does seem to
differ. Has anyone been having the same problem?

It looks like these error are fixed upstream which according to [1] is
heading for a release. I've got a patch which pulls in the 01a69
release candidate and does fix my problem. I'll post my patch as a
reply to this message (assuming I can figure out how to do that with
git). It might be worth holding off pushing this to the main buildroot
repository until the official cdrtools release is made but I don't
know when that is going to be. If anyone else is having the same
problem my patch might help

[1] ftp://ftp.berlios.de/pub/cdrecord/alpha/AN-2.01.01a69
