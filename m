From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Sep 2014 15:06:31 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <540C55F7.9040506@zacarias.com.ar>
References: <20140907063013.1CB98101499@stock.ovh.net>
 <20140907100918.6b017a09@free-electrons.com>
 <540C55F7.9040506@zacarias.com.ar>
Message-ID: <20140907150631.750117a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 07 Sep 2014 09:56:23 -0300, Gustavo Zacarias wrote:

> Outdated uclibc ptrace.h header, sparc is also affected by this however
> since there's no autobuilder for that target it's going unnoticed.
> glibc has the necessary definitions, so a uclibc header update is in order.

We already have
package/uclibc/0.9.33.2/uclibc-0020-update-ptrace.h-to-latest-from-glibc.patch
but I guess it doesn't handle those definitions.

> We can exclude ptrace for powerpc & sparc in the meantime.

Like ac_cv_header_sys_ptrace_h=no ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
