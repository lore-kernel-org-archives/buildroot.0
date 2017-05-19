From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 19 May 2017 10:01:58 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/avrdude: add linux gpio
	kconfig option
In-Reply-To: <8760gw3ntd.fsf@dell.be.48ers.dk>
References: <1495120094-44581-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87r2zl2dls.fsf@dell.be.48ers.dk>
 <CANQCQpagwa4KgHS0gw-YL_U2-KUV5_tuFM5a0gqt_1TahN6Vjw@mail.gmail.com>
 <8760gw3ntd.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpZ_2FD3KG5oH=U=fc3nZExhmKCaFcpHTx2Ykx2XcyXSSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter

On Fri, May 19, 2017 at 9:48 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>
> Hi,
>
>  >> Didn't you just agree with Baruch that we could just enable it
>  >> unconditially and not have a Config.in option for it?
>  >>
>
>  > Not sure we reached a conclusion.  I guess the question would be,
>  > right now in buildroot it doesn't enable this option.  So if we by
>  > default go linux-gpio it disables the legacy options which were the
>  > previous default (kernel's older then sysfs gpio support)
>
> Do you mean that enabling this driver disables anything else? I don't
> see that. The kernel's gpio sysfs interface is close to 10 years old by
> now, so I doubt that is an issue.
>
> From the looks of it, the linuxgpio driver seems to be very small
> compared to the total size of avrdude, so unconditionally enabling it
> sounds sensible to me.

Ok,  I'm good with unconditionally enabling.

>
> I notice that we are using a fork of avrdude which hasn't really been
> updated significantly since 2013 instead of the official one which had a
> release in 2016. Any reason we shouldn't be using the official one
> instead?

Very good question, we are unsure.  I've added a few people that have
modified that package to this email to ask.

Wojciech / Samuel / Gregory,  any reason to stay on this fork of avrdude?

Matt
