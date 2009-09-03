From: Will Newton <will.newton@gmail.com>
Date: Thu, 3 Sep 2009 18:15:15 +0100
Subject: [Buildroot] [PATCH] buildroot: Remove old CVS relics.
In-Reply-To: <20090903161306.GC32465@mx.loc>
References: <87a5b0800909030904w38f82856pffd93068aa27ef93@mail.gmail.com>
	<20090903161306.GC32465@mx.loc>
Message-ID: <87a5b0800909031015h5da69b8aibe5cf6c92e3b293b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 3, 2009 at 5:13 PM, Bernhard
Reutner-Fischer<rep.dot.nop@gmail.com> wrote:
> On Thu, Sep 03, 2009 at 05:04:57PM +0100, Will Newton wrote:
>>A few files seem to have been left over from the CVS days.
>>
>>Signed-off-by: Will Newton <will.newton@gmail.com>
>>---
>> package/gnuconfig/.cvsignore ? ? ? ? ? ? ? | ? ?5 -----
>> package/gnuconfig/CVS/Entries ? ? ? ? ? ? ?| ? 14 --------------
>> package/gnuconfig/CVS/Repository ? ? ? ? ? | ? ?1 -
>> package/gnuconfig/CVS/Root ? ? ? ? ? ? ? ? | ? ?1 -
>> package/gnuconfig/testsuite/.cvsignore ? ? | ? ?1 -
>> package/gnuconfig/testsuite/CVS/Entries ? ?| ? ?7 -------
>> package/gnuconfig/testsuite/CVS/Repository | ? ?1 -
>> package/gnuconfig/testsuite/CVS/Root ? ? ? | ? ?1 -
>> toolchain/elf2flt/elf2flt/.cvsignore ? ? ? | ? ?3 ---
>> toolchain/elf2flt/elf2flt/CVS/Entries ? ? ?| ? 17 -----------------
>> toolchain/elf2flt/elf2flt/CVS/Repository ? | ? ?1 -
>> toolchain/elf2flt/elf2flt/CVS/Root ? ? ? ? | ? ?1 -
>> 12 files changed, 0 insertions(+), 53 deletions(-)
>
> No. Look at them. They are maintained elsewhere and we need that to
> update them.

Is this patch more appropriate?

Subject: [PATCH] gnuconfig: Remove obsolete files and CVS directories.

gnuconfig is maintained in git these days, so the CVS directories are of
no use. Also update config.sub and config.guess to 2009-08-19.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/gnuconfig/CVS/Entries                 |   14 -
 package/gnuconfig/CVS/Repository              |    1 -
 package/gnuconfig/CVS/Root                    |    1 -
 package/gnuconfig/ChangeLog                   | 1996 -------------------------
 package/gnuconfig/Makefile                    |   15 -
 package/gnuconfig/README.buildroot            |    7 -
 package/gnuconfig/config.guess                |  208 ++--
 package/gnuconfig/config.sub                  |  135 ++-
 package/gnuconfig/testsuite/.cvsignore        |    1 -
 package/gnuconfig/testsuite/CVS/Entries       |    7 -
 package/gnuconfig/testsuite/CVS/Repository    |    1 -
 package/gnuconfig/testsuite/CVS/Root          |    1 -
 package/gnuconfig/testsuite/config-guess.data |   34 -
 package/gnuconfig/testsuite/config-guess.sh   |   47 -
 package/gnuconfig/testsuite/config-sub.data   |  117 --
 package/gnuconfig/testsuite/config-sub.sh     |   35 -
 package/gnuconfig/testsuite/uname.in          |    9 -
 package/gnuconfig/uname                       |   11 -
 18 files changed, 195 insertions(+), 2445 deletions(-)
 delete mode 100644 package/gnuconfig/CVS/Entries
 delete mode 100644 package/gnuconfig/CVS/Repository
 delete mode 100644 package/gnuconfig/CVS/Root
 delete mode 100644 package/gnuconfig/ChangeLog
 delete mode 100644 package/gnuconfig/Makefile
 delete mode 100644 package/gnuconfig/testsuite/.cvsignore
 delete mode 100644 package/gnuconfig/testsuite/CVS/Entries
 delete mode 100644 package/gnuconfig/testsuite/CVS/Repository
 delete mode 100644 package/gnuconfig/testsuite/CVS/Root
 delete mode 100644 package/gnuconfig/testsuite/config-guess.data
 delete mode 100644 package/gnuconfig/testsuite/config-guess.sh
 delete mode 100644 package/gnuconfig/testsuite/config-sub.data
 delete mode 100644 package/gnuconfig/testsuite/config-sub.sh
 delete mode 100755 package/gnuconfig/testsuite/uname.in
 delete mode 100755 package/gnuconfig/uname
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-gnuconfig-Remove-obsolete-files-and-CVS-directories.patch
Type: text/x-patch
Size: 102987 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090903/4a4c293d/attachment-0001.bin>
