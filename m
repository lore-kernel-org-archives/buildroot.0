From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 08:39:43 +0200
Subject: [Buildroot] backtrace() not working on ARMv7a
In-Reply-To: <1406788255956-76350.post@n4.nabble.com>
References: <1406788255956-76350.post@n4.nabble.com>
Message-ID: <20140731083943.49d4b0db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear prafullakota,

On Wed, 30 Jul 2014 23:30:55 -0700 (PDT), prafullakota wrote:

> I am trying to generate a call stack trace using backtrace() API which is
> part of libbacktrace. The idea is to catch a SIGSEGV signal and call
> backtrace() to print all the address values and compare the obtained
> addresses from objdump -D of executable. Following is the output seen on
> ARMv7a platform with buildroot cross-toolchain (gcc- 4.8.2, binutis-2.18.1).

Thanks for the report. Could you provide your Buildroot .config so we
can see in more details what is your toolchain configuration
(especially which C library is used, and which version of it).

> For above issue uclibc forum has given fix in below link
> http://lists.uclibc.org/pipermail/uclibc/2013-September/047932.html

Right, but from a quick look, this patch was never applied.

> Similar issue in uclibc was solved by creating a patch to uclibc files, can
> some one let me know if there is any existing patch is available for glibc
> similar to this?, if not can anyone help me in providing the similar patch
> for glibc.

Are you sure you're using glibc ? Could you provide your
Buildroot .config file ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
