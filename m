From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 07 Sep 2014 10:07:48 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140907150631.750117a7@free-electrons.com>
References: <20140907063013.1CB98101499@stock.ovh.net>	<20140907100918.6b017a09@free-electrons.com>	<540C55F7.9040506@zacarias.com.ar>
 <20140907150631.750117a7@free-electrons.com>
Message-ID: <540C58A4.4080205@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/07/2014 10:06 AM, Thomas Petazzoni wrote:

>> Outdated uclibc ptrace.h header, sparc is also affected by this however
>> since there's no autobuilder for that target it's going unnoticed.
>> glibc has the necessary definitions, so a uclibc header update is in order.
> 
> We already have
> package/uclibc/0.9.33.2/uclibc-0020-update-ptrace.h-to-latest-from-glibc.patch
> but I guess it doesn't handle those definitions.

That updated common, but powerpc, sparc, microblaze and some other dead
architectures have their own (same on *glibc).

> Like ac_cv_header_sys_ptrace_h=no ?

Probably, i'm running a test build at the moment and submit a patch shortly.
Regards.
