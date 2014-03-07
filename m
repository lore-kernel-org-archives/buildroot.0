From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 7 Mar 2014 14:14:45 +0100
Subject: [Buildroot] [PATCH 6/6] liburcu: disable build with gcc-4.8.x
	on ARM
In-Reply-To: <20140307140423.064ce228@skate>
References: <1393717193-19774-1-git-send-email-s.martin49@gmail.com>
 <1393717193-19774-7-git-send-email-s.martin49@gmail.com>
 <20140306231723.32e217fd@skate>
 <CAHXCMM+YsCrFrnW06BdJ=AGR3VrUhZb_2UA+NevfdJXF=D+HTg@mail.gmail.com>
 <20140307140423.064ce228@skate>
Message-ID: <CAHXCMMLgnj7CEVFnkjjkc=PH9NfXZtDe92tnpo3YwwmTHjk-Qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 7, 2014 at 2:04 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Fri, 7 Mar 2014 13:59:29 +0100, Samuel Martin wrote:
>
>> > The exclusion of BR2_GCC_VERSION_4_8_X is wrong, because we have in
>> > Buildroot the patch fixing the
>> > http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854 gcc bug.
>> >
>> > But generally, I'm not really happy with this approach, as we would
>> > have to update these dependencies every time we bump/change the
>> > external toolchain Kconfig options... Unfortunately I don't have a
>> > better suggestion.
>>
>> I did this because of the patch in liburcu checking for the compiler version.
>> I did not notice BR carries the patch fixing this bug.
>
> So liburcu checks itself that the gcc version should be different than
> 4.8.0, 4.8.1 and 4.8.2 ?

Yes, it's done by this patch:
http://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=4b79310

> It doesn't take into account that the 4.8.2
> might have been patched to fix the problem ?

Nope :-/

> Can this test be disabled ?

Certainly, I'm just not sure checking the compiler has the fix will be
easy... anyway.

Just to be clear, your suggestion is only about enabling gcc-4.8.2
(with the fix), not gcc-4.8.0 nor gcc-4.8.1, right?
Then we have to check for each external toolchain if it has the fix.

What about custom toolchain based on gcc-4.8.2? Shall we able it
(warning the user) or just disabling it?

Regards,

-- 
Samuel
