From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 30 Apr 2015 10:16:45 -0500
Subject: [Buildroot] [PATCH 7/8] configs: add defconfig for Atmel
	sama5d3 Xplained
In-Reply-To: <20150430151402.GG12076@piout.net>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1430398311-10804-8-git-send-email-alexandre.belloni@free-electrons.com>
 <CAMQcK5+XSqStQkJTBQUwzsWvCjQk=Uq8Z5g0yP_p1TXqsQCoLg@mail.gmail.com>
 <20150430151402.GG12076@piout.net>
Message-ID: <CAMQcK5LW9eWuJ1nn_h6Tb4O5TBdtd2VuB1HoPrVqzg7b3mXJNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandre,

On Thu, Apr 30, 2015 at 10:14 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> On 30/04/2015 at 09:46:44 -0500, Ryan Barnett wrote :
>> Alexandre,
>>
>> On Thu, Apr 30, 2015 at 7:51 AM, Alexandre Belloni
>> <alexandre.belloni@free-electrons.com> wrote:
>> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>> > ---
>> >  configs/atmel_sama5d3_xplained_defconfig | 22 ++++++++++++++++++++++
>> >  1 file changed, 22 insertions(+)
>> >  create mode 100644 configs/atmel_sama5d3_xplained_defconfig
>> >
>> > diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
>> > new file mode 100644
>> > index 000000000000..ba3c9cd664bd
>> > --- /dev/null
>> > +++ b/configs/atmel_sama5d3_xplained_defconfig
>> > @@ -0,0 +1,22 @@
>> > +BR2_arm=y
>> > +BR2_cortex_a5=y
>> > +BR2_ARM_EABIHF=y
>> > +BR2_ARM_FPU_VFPV4D16=y
>> > +BR2_ARM_INSTRUCTIONS_THUMB2=y
>> > +BR2_LINUX_KERNEL=y
>> > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
>> > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-3.18-at91"
>>
>> 'linux-3.18-at91' appears to be a branch which means that it could be
>> updated and break this config?
>>
>> I believe in order to ensure that a build is reproducible for everyone
>> that this should be a tag or commit SHA. This would also apply to all
>> your other new NAND configurations for the Atmel boards.
>>
>
> That is the expected behaviour. This branch must not break. I'm not
> saying it won't break but if it ever breaks, it will definitively be
> fixed.

OK - that is fine as I don't really have a strong opinion on this so
leaving it as the branch is fine with me. I was more so making the
observation.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
