From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Apr 2015 13:35:09 +0200
Subject: [Buildroot] Versioned symbols in elfutils and uClibc
In-Reply-To: <CAMo8BfLHuMzBaETgnJu-O+osAKw3dQM-XCUa5yEqP__oZwwQFw@mail.gmail.com>
 (Max Filippov's message of "Tue, 21 Apr 2015 04:30:12 +0300")
References: <CAMo8BfLHuMzBaETgnJu-O+osAKw3dQM-XCUa5yEqP__oZwwQFw@mail.gmail.com>
Message-ID: <87a8y1u32q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Hi,
 > I'm debugging strange segfault running ltrace for xtensa:
 > it's caused by dwfl_report_elf recursively calling itself, resulting
 > in stack overflow. The symbol dwfl_report_elf is versioned, there
 > are versions ELFUTILS_0.122 and ELFUTILS_0.156, ltrace calls
 > 0.122, but when 0.122 tries to resolve 0.156 it gets back pointer
 > to 0.122. AFAICS uClibc does not support symbol versioning.
 > Any idea what can be done about it?

Without knowing much about this, have you tried commenting out the
#ifdef SHARED part in lib/eu-config.h (and possible the corresponding
part in libdwfl/dwfl_report_elf.c)?

-- 
Bye, Peter Korsgaard
