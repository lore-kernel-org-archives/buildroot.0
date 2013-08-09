From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Aug 2013 13:05:53 +0200
Subject: [Buildroot] [PATCH 3/3] ltrace: Fix "strndup not declared"
 build failure on powerpc/uclibc
In-Reply-To: <20130809122906.052d226a@skate>
References: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
 <1376041019-26688-4-git-send-email-jezz@sysmic.org>
 <20130809122906.052d226a@skate>
Message-ID: <CAAXf6LVxFHWaLChhMAROEhBzNpcy1rg0N882CADwwW3oMHe5mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 9, 2013 at 12:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear J?r?me Pouiller,
>
> On Fri,  9 Aug 2013 11:36:59 +0200, J?r?me Pouiller wrote:
>> On some systems, strndup is declared only if _GNU_SOURCE is defined
>>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>
> Shouldn't this be globally defined by adding a -D_GNU_SOURCE to the
> CFLAGS at the package level?

When you say 'package level' you mean in ltrace.mk in buildroot?
In this case I don't think it's correct: ltrace itself is responsible
for including the right header files, and setting the right macros, so
that any used interface is available. Hence, I consider it a patch to
ltrace (that should be upstreamed), not something we should fix in
buildroot itself.
