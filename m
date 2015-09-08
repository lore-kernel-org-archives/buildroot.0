From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 9 Sep 2015 00:09:01 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gdb: host-texinfo needed for
 full gdb
In-Reply-To: <55EF582F.1090407@mind.be>
References: <1441740443-7280-1-git-send-email-brendanheading@gmail.com>
 <55EF582F.1090407@mind.be>
Message-ID: <55EF5C7D.3040908@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

Le 08/09/2015 23:50, Arnout Vandecappelle a ?crit :
> On 08-09-15 21:27, Brendan Heading wrote:
>> Fixes :
>> http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
> 
>  So, we now have three versions to fix this:
> 
> Romain patches gdb to avoid recursing in the doc directory [1][2]
> Vicente does the same but with a sed instead of patch [3].
> Brendan adds host-texinfo to dependencies (this patch) [4].
> 
>  Which one do we choose?
> 
>  host-texinfo takes a bit of time to build because it also depends on
> host-ncurses, but it's not a huge problem.
> 
>  The best solution is adding an upstreamable --disable-doc, but that will take a
> bit of work still (esp. because we can't easily autoreconfigure).

I sent a patch to gdb mailing list to add --disable-docs option but it's not
tested since I can't regenerate the configure script locally.

See https://sourceware.org/ml/gdb-patches/2015-09/msg00073.html

I'm waiting for a review.

> 
>  So for me Brendan's patch is fine. What do the others think?

I would prefer to avoid host-texinfo dependency if possible.

Best regards,
Romain

> 
> 
>  Regards,
>  Arnout
> 
> 
> [1] http://patchwork.ozlabs.org/patch/514907/
> [2] http://patchwork.ozlabs.org/patch/514908/
> [3] http://patchwork.ozlabs.org/patch/515401/
> [4] http://patchwork.ozlabs.org/patch/515527/
> 
>>
>> .. and many others.
>>
>> when building the full gdb (ie not just gdbserver) on the host or target
>> the "make install" phase seems to expect makeinfo (from texinfo) to be
>> present.
>>
>> Added a dependency so that the host always depends on host-texinfo, and
>> the target depends on it if the full GDB is being built. No need to set
>> ac_cv_prog_MAKEINFO anymore as it doesn't seem to achieve the desired
>> effect.
>>
>> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> [snip]
> 
> 
