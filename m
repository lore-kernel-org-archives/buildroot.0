From: Gregory Dymarek <gregd72002@gmail.com>
Date: Fri, 28 Mar 2014 13:31:31 +0000
Subject: [Buildroot] Xenomai support for pre and post patches
In-Reply-To: <20140328120909.260739cf@skate>
References: <CAEbDrgmqihPwKwxhr-WGQmAShN2Ahr7SsovCXgLgbtDUz+RWgg@mail.gmail.com>
 <CAEbDrgk-oaAJgHv=w02Hdzef9t7zphqWKBuq87eyD=FWHrA=Aw@mail.gmail.com>
 <20140328120909.260739cf@skate>
Message-ID: <CAEbDrgm2y0LM+Y1zF=976y2AyOUEJZqgHrwqSa9W+cu2WwGKFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the information.

With your instructions I can see how to define the PRE patch (one that
is applied to kernel before Xenomai Adeos patch). However, there are
number of boards that require POST patch. A post patch is one that has
to be applied to kernel after Xenomai Adeos patch.

The examples are: raspberry, zynq, beaglebone, mxc

Is there a way to stage global patches?

Regards,
Gregory

On 28 March 2014 11:09, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Gregory Dymarek,
>
> Thanks for your contribution!
>
> On Fri, 28 Mar 2014 09:42:19 +0000, Gregory Dymarek wrote:
>
>> The following patch adds support for pre- and post- adeos patches to
>> Xenomai.
>
> Can you explain why this is needed? You can already apply patches on
> any package using the BR2_GLOBAL_PATCH_DIR option. See
> http://buildroot.org/downloads/manual/manual.html#packages-custom for
> details about it.
>
> Basically, you can do:
>
>         BR2_GLOBAL_PATCH_DIR=board/<company>/<project>/
>
> and then, in:
>
>         board/<company>/<project>/xenomai/
>
> you put your patches, and then will be applied to Xenomai before it is
> being built.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
