From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 21:09:23 +0200
Subject: [Buildroot] [PATCH] gcc: powerpc32 transition to secureplt
In-Reply-To: <CANQCQpY+au2CO5iLonnz7cUc8L-1C=XhL2pWAZ=bJBQUZ=K23g@mail.gmail.com>
 (Matthew Weber's message of "Wed, 23 Sep 2020 14:01:44 -0500")
References: <20200923152908.21153-1-matthew.weber@rockwellcollins.com>
 <CANQCQpY+au2CO5iLonnz7cUc8L-1C=XhL2pWAZ=bJBQUZ=K23g@mail.gmail.com>
Message-ID: <87d024v1r0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Peter,
 > On Wed, Sep 23, 2020 at 10:29 AM Matt Weber
 > <matthew.weber@rockwellcollins.com> wrote:
 >> 
 >> PowerPC has two PLT models: BSS-PLT and Secure-PLT. BSS-PLT uses
 >> runtime code generation to generate the PLT stubs. Secure-PLT was
 >> introduced with GCC 4.1 and Binutils 2.17 (base has GCC 4.2.1 and
 >> Binutils 2.17), and is a more secure PLT format, using a read-only
 >> linkage table, with the dynamic linker populating a non-executable
 >> index table.
 >> 
 >> Ref to other distro/BSD transitions
 >> https://patchwork.openembedded.org/patch/106621/
 >> https://reviews.freebsd.org/D20598
 >> 
 >> Fixes a bug observed when creating SELinux policy where all apps
 >> require execmem because the heap requires execute before this
 >> change.
 >> 

 > This also applies to 2020.02.x and the previous release 2020.08.

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
