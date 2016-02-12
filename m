From: Romain Izard <romain.izard.pro@gmail.com>
Date: Fri, 12 Feb 2016 14:48:03 +0100
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of
 installed programs
In-Reply-To: <CAGkQfmO7+XR4zixkn+UN_wWr+=ZgyXX-FajQrqhEqRWQiwBv=g@mail.gmail.com>
References: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
 <20160203173440.6d0567d7@free-electrons.com>
 <CAGkQfmO7+XR4zixkn+UN_wWr+=ZgyXX-FajQrqhEqRWQiwBv=g@mail.gmail.com>
Message-ID: <CAGkQfmPWrA7P29mfJDPk_-03a4bXLzAhPp3A7+wcLS6OafATqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2016-02-03 18:13 GMT+01:00 Romain Izard <romain.izard.pro@gmail.com>:
> 2016-02-03 17:34 GMT+01:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
>>
>> On Wed,  3 Feb 2016 12:14:48 +0100, Romain Izard wrote:
>>
>> > +menuconfig BR2_PACKAGE_COREUTILS_SELECT
>> > +     bool "Override the default set of installed coreutils"
>> > +     depends on BR2_PACKAGE_COREUTILS
>> > +
>> > +if BR2_PACKAGE_COREUTILS_SELECT
>> >

[...]

>> >
>> > +endif
>>
>> This is really a loooooong list of options that will be annoying to
>> maintain I believe.
>>
>
> Is the coreutils package moving that fast ?
>
> The list is now done, and it's not that hard to customize
> the "gen-list-of-programs.sh" script from coreutils to generate
> a new version, even to reproduce the few manual tweaks I used.
>
> And adding/removing an entry from time to time does not look that annoying.
> This type of list can be an issue when different development branches
> touch the same file, but here I do not expect it to be an issue.
>
>> What about instead having a string option to list the requested binaries?
>> If empty, then the default programs are built and installed.  If
>> non-empty, then only the programs listed in the string option will be
>> built and installed.
>
> That's what I wanted to do in the beginning.
>
> From what I understand from the coreutils configure.ac and m4/* files,
> it is not possible to start from an empty list, and then add requested
> programs, at least without patching.
>
> As coreutils is one of the longest-lived GNU projects, its autotool
> configuration is so elaborate that I do not feel comfortable with
> changing it.
>
> As a bonus, as each program is documented (with the headline
> from its man page in the coreutils package), the user experience
> in Kconfig is quite good, whereas a comma-separated, 30-word
> configuration option will be cumbersome to edit and review.
>
> The same pattern also exists in the util-linux package, but with half
> as many options.

What is your point of view regarding my comments?
Is patching the coreutils mainline to implement your proposed
behavior the only way to proceed on this topic?

Best regards,
-- 
Romain Izard
