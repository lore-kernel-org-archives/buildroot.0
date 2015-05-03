From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 May 2015 19:34:04 +0200
Subject: [Buildroot] [PATCH 2/2] libfreeimage: disable on ARC and
	Blackfin
In-Reply-To: <1430656670-919-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 May 2015 14:37:50 +0200")
References: <1430656670-919-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1430656670-919-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bni1sgz7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > libfreeimage fails to build on ARC, due to compiler issues:
 >   Error: invalid register number `63'

 > This should probably be fixed at the compiler level.

 > It also fails to build on Blackfin, due to numerous libfreeimage
 > issues:

 >   1/ Missing LL suffixes in Source/OpenEXR/IlmImf/ImfFastHuf.cpp. This
 >      can be fixed by backporting upstream OpenEXR commit
 >      https://github.com/openexr/openexr/commit/57ecf581d053f5cacf2e8fc3c024490e0bbe536f.patch.

 >   2/ Invalid characters in libraw_x3f.cpp. This can be fixed by
 >      applying dos2unix on the file.

 >   3/ Usage of too long constants in an unsigned long in
 >      dcraw_common.cpp, in code like "id == 0x4434303430" where id is
 >      an "unsigned long" i.e 32 bits on 32 bits platform.

 > Due to (3) being apparently unsolved upstream, and causing a build
 > error on Blackfin, we disable libfreeimage on this
 > architecture. However, this code seems so broken that making
 > libfreeimage as entirely broken would maybe be a better option.

 > Fixes:

 >   http://autobuild.buildroot.org/results/b33/b3372581c82786cc0a87f8cc2e78f047cc079255/ (ARC issue)
 >   http://autobuild.buildroot.org/results/f3b/f3bd6be448cffed3caae7850233168e6d0f6a5bd/ (Blackfin issue)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
