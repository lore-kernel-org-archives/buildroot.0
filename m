From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 5 Aug 2020 16:29:32 +0200
Subject: [Buildroot] [PATCHv2] package/gdb: bump to version 9.2
In-Reply-To: <20200805162625.23d11ed4@windsurf.home>
References: <20200805140337.427704-1-romain.naour@gmail.com>
 <20200805162625.23d11ed4@windsurf.home>
Message-ID: <35307a73-6077-99aa-8115-f4440152dd35@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 05/08/2020 ? 16:26, Thomas Petazzoni a ?crit?:
> Hello Romain,
> 
> On Wed,  5 Aug 2020 16:03:37 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> From: Maxim Kochetkov <fido_max@inbox.ru>
>>
>> The in-tree build restriction has been added after the move of gnulib to top level [1] [2].
>> This restriction has been added as a workaround a build issue with gdbserver that still use
>> it's own copy of gnulib.
>>
>> gnulib is configured a second time if we build in-tree gdb and gdbserver:
>>     configure: error: source directory already configured; run "make distclean" there first
>>     configure: error: .././../../gnulib/configure failed for build-gnulib-gdbserver
>>     configure: error: ./configure failed for gdbserver
>>
>> Use the same pre-configure-hook as gcc package.
>>
>> Older gdb version support building out of tree even if it's not required.
>>
>> There is no in-tree build restriction of we only build gdbserver for the target.
>>
>> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=73cc72729a184f00bf6fc4d74684a8516ba6b683
>> [2] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=043a0010933a6b55081535ecaf7fde9cc1491be0
>>
>> See:
>> https://sourceware.org/pipermail/gdb-announce/2020/000122.html
>> https://sourceware.org/pipermail/gdb-announce/2020/000123.html
>>
>> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
>> [Romain:
>>     - add in-tree build support
>>     - improve commit log]
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> Following this, should we also do our usual dance: switch to gdb 8.3 as
> the default, and drop support for gdb 8.1 ?

Sure, I need to do those commit first.

Best regards,
Romain


> 
> Thomas
> 
