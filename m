From: Mason <slash.tmp@free.fr>
Date: Fri, 23 Jun 2017 16:15:39 +0200
Subject: [Buildroot] Policy for upgrading toolchains in LTS version
In-Reply-To: <87a84zkw97.fsf@dell.be.48ers.dk>
References: <232c0fde-c837-ccfd-949c-eeec82a24fdb@free.fr>
 <20170622192701.GC3054@scaer> <443c0c3b-683b-935d-1b4e-c020a406bcc3@free.fr>
 <87a84zkw97.fsf@dell.be.48ers.dk>
Message-ID: <3fa81af3-4372-6a67-5fb9-3717549b0350@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/2017 09:18, Peter Korsgaard wrote:

> Mason wrote:
> 
>> On freenode #linaro-tcwg, Ryan explained the Linaro toolchain
>> release process to me, which appears to be BR-LTS-compatible.
>> 
>> Toolchain releases are supported for 2 years.
>> 
>> First year in "stable" mode:
>> Bug fixes, and backports of non-invasive performance fixes for gcc.
>> One update per quarter.
>> 
>> Second year in "maintenance" mode:
>> Only bug fixes.
>> Updates when required (e.g. getaddrinfo vuln, or stack clash)
>> 
>> Individual components (gcc, glibc, newlib, binutils, gdb)
>> are updated within their respective stable branches, i.e.
>> kept at the same release (gdb is an exception).
>> 
>> So, for example, the 6.x release is in stable mode until
>> 2017.08, and in maintenance mode until 2018.08
>> (Ryan pointed out that an OOB release would be done to
>> address stack clash.)
> 
> Ok, looks good. I take it that you are asking for this update because
> you have run into some of the issues fixed by later versions?

Switching from gcc 5.3 to 6.2 triggered an issue which
*appeared* to go away when using 6.3.

But when the dust settled, the bug turned out to be in
our code (as is the case most of the time).

https://www.spinics.net/lists/gcchelp/msg46864.html

> Can you please send a patch (relative to the 2017.02.x branch) bumping
> the toolchains and include the above + any details of the issues you
> have encountered?

Romain bumped the version from 6.2-2016.11 to 6.3-2017.02
on master. IIUC, you don't want to update master, and then
cherry-pick into the LTS branch?

Is the plan to jump straight to 7.1 for master?

I suppose you want to update all 3 toolchains,
toolchain-external-linaro-{aarch64,arm,armeb}
Can this be done in a single patch, or should it
be split across 3 patches?

As previously mentioned, IIUC, Linaro is preparing an
OOB release addressing "stack clash". I plan to wait
for that release, and then send a patch, is that OK?

Regards.
