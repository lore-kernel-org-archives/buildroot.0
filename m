From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 May 2017 16:48:14 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/avrdude: add linux gpio
	kconfig option
In-Reply-To: <CANQCQpagwa4KgHS0gw-YL_U2-KUV5_tuFM5a0gqt_1TahN6Vjw@mail.gmail.com>
 (Matthew Weber's message of "Fri, 19 May 2017 08:58:25 -0500")
References: <1495120094-44581-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87r2zl2dls.fsf@dell.be.48ers.dk>
 <CANQCQpagwa4KgHS0gw-YL_U2-KUV5_tuFM5a0gqt_1TahN6Vjw@mail.gmail.com>
Message-ID: <8760gw3ntd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 >> Didn't you just agree with Baruch that we could just enable it
 >> unconditially and not have a Config.in option for it?
 >> 

 > Not sure we reached a conclusion.  I guess the question would be,
 > right now in buildroot it doesn't enable this option.  So if we by
 > default go linux-gpio it disables the legacy options which were the
 > previous default (kernel's older then sysfs gpio support)

Do you mean that enabling this driver disables anything else? I don't
see that. The kernel's gpio sysfs interface is close to 10 years old by
now, so I doubt that is an issue.

From the looks of it, the linuxgpio driver seems to be very small
compared to the total size of avrdude, so unconditionally enabling it
sounds sensible to me.

I notice that we are using a fork of avrdude which hasn't really been
updated significantly since 2013 instead of the official one which had a
release in 2016. Any reason we shouldn't be using the official one
instead?

-- 
Bye, Peter Korsgaard
