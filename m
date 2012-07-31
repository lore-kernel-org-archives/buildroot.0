From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 31 Jul 2012 18:41:09 +0100
Subject: [Buildroot] [PATCH] at91bootstrap3: new package
In-Reply-To: <5017F269.6090508@mind.be>
References: <1343389506-7469-1-git-send-email-spdawson@gmail.com>
 <5017F269.6090508@mind.be>
Message-ID: <CAHt8ZCOE8Pmevb4i0=uS1RJ2Lsz16sFVfC2YO2kWnrTJK8vNcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout. Thanks for the detailed comments.

On 31 July 2012 15:57, Arnout Vandecappelle <arnout@mind.be> wrote:
>  First comment: in the commit message you could mention why
> this is a new package rather than a bump of at91bootstrap
> (perhaps quoting Thomas).

Okay. Will do so.

>  It's actually in board/<processor>/<board>_defconfig, no?

Yes, quite right.

>> +We have to get JUMP_ADDR consistant with what is used by u-boot
>
>
>  While your at it: spelling correction consistant -> consistent.

Okay.

>  Just for clarity, I'd put a --- and/or some whitespace between the S-o-b
> and the diff.

Okay.
>> +AT91BOOTSTRAP3_DEFCONFIG = \
>> +       $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))
>> +AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE = \
>> +       $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
>
>
>  AFAICS these are used only once so defining a variable is unnecessary.

In fact, these variables are all used more than once in the makefile.
I've no objection to not using the variables though, if you think it
makes things cleaner.

>  I smell a refactoring opportunity here, because this pattern is used in
> a few bootloaders and in the kernel...

Yes, agreed. A job for another day.

Simon.
