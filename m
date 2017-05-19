From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 19 May 2017 08:58:25 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/avrdude: add linux gpio
	kconfig option
In-Reply-To: <87r2zl2dls.fsf@dell.be.48ers.dk>
References: <1495120094-44581-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87r2zl2dls.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpagwa4KgHS0gw-YL_U2-KUV5_tuFM5a0gqt_1TahN6Vjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter / Baruch,

On Fri, May 19, 2017 at 8:14 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
>
>  > From: Sam Voss <samuel.voss@rockwellcollins.com>
>  > Add the option to enable linux sysfs gpio framework
>  > configure option in menuconfig.
>
>  > Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
>  > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
>  > ---
>
>  > Change Log
>
>  > v1 -> v2
>  >  - upstream accepted linux gpio fix, removed patch
>
> Didn't you just agree with Baruch that we could just enable it
> unconditially and not have a Config.in option for it?
>

Not sure we reached a conclusion.  I guess the question would be,
right now in buildroot it doesn't enable this option.  So if we by
default go linux-gpio it disables the legacy options which were the
previous default (kernel's older then sysfs gpio support).  I'm good
either way, but the fundamental package behavior changes.

Matt
