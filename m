From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 2 Jul 2013 19:19:59 +0100
Subject: [Buildroot] [PATCH] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <51D317F6.4090205@mind.be>
References: <1372675884-963-1-git-send-email-markos.chandras@gmail.com>
 <51D26C51.8070108@mind.be>
 <CAG2jQ8j2iucPz356Wkz8=xSOQ=QC2u_7ebZZimRhycBGu4_nvg@mail.gmail.com>
 <51D30004.7060200@mind.be>
 <CAG2jQ8iqGmmMNn7v1ko7==gVxKGtjjmkrd26WD_6_K2hvk-Ukg@mail.gmail.com>
 <51D317F6.4090205@mind.be>
Message-ID: <CAG2jQ8h7QagfbDp88ZKURSohGrw7JjrwtTsoLPKh2LJ3T1MNZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 July 2013 19:12, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> n32 is a 64-bit ABI with 32-bit pointers (something like the new x32 for
>> x86).
>
>
>  Okay, so it's a 64-bit ABI that is called n32 by accident :-)
>
>  Since it's not clear if lib32 is needed for other architectures, and since
> we don't always do it for the 64-bit architectures, it's probably better to
> keep your original condition on $(BR2_MIPS_NABI32).

Ok :)

>>>> +       ln -sfn lib $(TARGET_DIR)/lib32; \
>>>> +               ln -sfn lib $(TARGET_DIR)/usr/lib32;
>>>
>>>
>
>  By the way, shouldn't the same be done in STAGING_DIR?

I am not sure. The only problem I found was with the interpreter path
during runtime.
I can't see why lib32->lib is needed for the STAGING_DIR. Everything
in buildroot seems to depend
on lib and usr/lib and uClibc also uses MULTILIB_DIR="lib". I wouldn't
touch the STAGING_DIR for
now until I hit a real problem.

--
Regards,
Markos Chandras
