From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 21 Apr 2015 04:30:12 +0300
Subject: [Buildroot] Versioned symbols in elfutils and uClibc
Message-ID: <CAMo8BfLHuMzBaETgnJu-O+osAKw3dQM-XCUa5yEqP__oZwwQFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm debugging strange segfault running ltrace for xtensa:
it's caused by dwfl_report_elf recursively calling itself, resulting
in stack overflow. The symbol dwfl_report_elf is versioned, there
are versions ELFUTILS_0.122 and ELFUTILS_0.156, ltrace calls
0.122, but when 0.122 tries to resolve 0.156 it gets back pointer
to 0.122. AFAICS uClibc does not support symbol versioning.
Any idea what can be done about it?

-- 
Thanks.
-- Max
