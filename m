From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Oct 2013 16:22:22 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 2 Oct 2013 16:06:13
 +0200")
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
Message-ID: <871u43rbvl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 Thomas> Hi,
 Thomas> I am starting to use the legal-info infrastructure now, and this
 Thomas> resulted in a number of observations/problems, which I'll list below.

 Thomas> 1. there is no longer a provision to 'hide' proprietary packages from
 Thomas> the manifest, and not get warnings on them. Previously you could mark
 Thomas> a package as license: PROPRIETARY, but this has been removed. I still
 Thomas> think that a similar feature is useful.

 Thomas> 2. suppose FOO_LICENSE_FILES = subdir/COPYING, then the manifest also
 Thomas> contains the string 'subdir/COPYING'. However, the license is copied
 Thomas> into a flat structure output/legal-info/licenses/foo/, so I think that
 Thomas> the manifest should no longer mention the 'subdir'.
 Thomas> Of course, this may contradict with the needs of licenses.txt (the
 Thomas> flat representation of all licenses) that does not suffer from the
 Thomas> subdir problem.

 Thomas> 3. partially related to point 2: if a package has multiple license
 Thomas> files with the same name but in subdirectories, e.g. a/COPYING and
 Thomas> b/COPYING, the copying of the license will copy both files on top of
 Thomas> each other. This is the case for xenomai-forge (not yet in buildroot),
 Thomas> which is the new strategy for xenomai [1]. I have brought up this
 Thomas> issue with the developers [2], but maybe there is something else we
 Thomas> can do.

Do you still see this after 31aa4264d8839d0?

Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Wed Jun 5 10:52:18 2013 +0200

    pkg-utils.mk: legal-license-file: handle multiple license files with same name
    
    Some packages (kmod, e2fsprogs, ..) contain multiple (different) license
    files with the same file name, but in different directories.
    
    These are currently all copied to the same filename in
    output/legal-info/licenses/<pkg>, overwriting everything but the last file.
    
    Fix it by recreating the same directory structure under legal-info.
    
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

-- 
Bye, Peter Korsgaard
