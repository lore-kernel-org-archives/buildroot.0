From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 23 Jun 2017 22:11:31 +0200
Subject: [Buildroot] Policy for upgrading toolchains in LTS version
In-Reply-To: <3fa81af3-4372-6a67-5fb9-3717549b0350@free.fr>
References: <232c0fde-c837-ccfd-949c-eeec82a24fdb@free.fr>
 <20170622192701.GC3054@scaer> <443c0c3b-683b-935d-1b4e-c020a406bcc3@free.fr>
 <87a84zkw97.fsf@dell.be.48ers.dk>
 <3fa81af3-4372-6a67-5fb9-3717549b0350@free.fr>
Message-ID: <17ba4c4d-4fce-66a6-d5c4-d66720a02de2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mason, All

Le 23/06/2017 ? 16:15, Mason a ?crit :
> On 23/06/2017 09:18, Peter Korsgaard wrote:
> 
>> Mason wrote:
>>
>>> On freenode #linaro-tcwg, Ryan explained the Linaro toolchain
>>> release process to me, which appears to be BR-LTS-compatible.
>>>
>>> Toolchain releases are supported for 2 years.
>>>
>>> First year in "stable" mode:
>>> Bug fixes, and backports of non-invasive performance fixes for gcc.
>>> One update per quarter.
>>>
>>> Second year in "maintenance" mode:
>>> Only bug fixes.
>>> Updates when required (e.g. getaddrinfo vuln, or stack clash)
>>>
>>> Individual components (gcc, glibc, newlib, binutils, gdb)
>>> are updated within their respective stable branches, i.e.
>>> kept at the same release (gdb is an exception).
>>>
>>> So, for example, the 6.x release is in stable mode until
>>> 2017.08, and in maintenance mode until 2018.08
>>> (Ryan pointed out that an OOB release would be done to
>>> address stack clash.)
>>
>> Ok, looks good. I take it that you are asking for this update because
>> you have run into some of the issues fixed by later versions?
> 
> Switching from gcc 5.3 to 6.2 triggered an issue which
> *appeared* to go away when using 6.3.
> 
> But when the dust settled, the bug turned out to be in
> our code (as is the case most of the time).
> 
> https://www.spinics.net/lists/gcchelp/msg46864.html
> 
>> Can you please send a patch (relative to the 2017.02.x branch) bumping
>> the toolchains and include the above + any details of the issues you
>> have encountered?
> 
> Romain bumped the version from 6.2-2016.11 to 6.3-2017.02
> on master. IIUC, you don't want to update master, and then
> cherry-pick into the LTS branch?

I guess you also want the latest stable Linaro toolchain 2017.05 in the
2017.02.x branch, right ?

So, feel free to send patches bumping all Linaro toolchain to 2017.05 and Peter
will cherry-pick them to the LTS branch.

Don't forget, you can also use the toolchain-external-custom package to import
any external toolchain, even 2017.05 Linaro toolchain using the 2017.02.x branch.

In the past we had a version choice on some toolchains, but we removed this
option since it was difficult to maintain and time consuming [1].

"The pre-configured external toolchains are handy to get started, but keeping
several versions within buildroot is not so useful."

[1] http://elinux.org/Buildroot:DeveloperDaysELCE2015

> 
> Is the plan to jump straight to 7.1 for master?

There is no plan, when time allow I bump the Linaro toolchains.
You're welcome to send patches bumping to this version.

> 
> I suppose you want to update all 3 toolchains,
> toolchain-external-linaro-{aarch64,arm,armeb}
> Can this be done in a single patch, or should it
> be split across 3 patches?

Usually we use 3 separate patches, one for each toolchains.

> 
> As previously mentioned, IIUC, Linaro is preparing an
> OOB release addressing "stack clash". I plan to wait
> for that release, and then send a patch, is that OK?

Ok for me.

Best regards,
Romain

> 
> Regards.
> 
