From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 7 Jun 2012 15:49:35 +0200
Subject: [Buildroot] [PATCH 2/3] debug: provide an option to copy the
 gdbserver to the target
In-Reply-To: <20120606213642.062a0bab@skate>
References: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
 <a3beb0b2963c6c7ba6ebf90643537380b117a2f4.1331765391.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LXCk=P8o--c9u8Usq4U6Gz9Rmnr9yzh20c3d-3LJj+g1A@mail.gmail.com>
 <20120606213642.062a0bab@skate>
Message-ID: <CAAXf6LWdwaLvtGnDzawaeuSZ2JGSvLBXdwXq71jCbCJq0OFfdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Jun 6, 2012 at 9:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 6 Jun 2012 12:16:54 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> With this change, buildroot will no longer present the option of
>> building gdbserver itself. If you have an external toolchain, it is
>> now mandatory for it to contain gdbserver (if you want it of course).
>
> Correct.
>
>> I'm not sure if we can always expect this.
>
> I would say it is the case for most external toolchains that exist
> today, so it sounds like (at least to me) like a reasonable solution.

Ok. If it's the case for most external toolchains, I'm ok with the
current behavior.

>
>> In my case, gdb was built by the toolchain, and gdbserver by
>> buildroot. For me it makes sense to follow your strategy and have
>> gdbserver built by crosstool-ng instead (and use that as custom
>> external toolchain).
>
> Building gdb and gdbserver separately is, IMO, a recipe for disaster.
> Even though the gdb remote protocol is supposed to be stable, my
> experience is that using a different version for gdb and gdbserver
> often causes problems.
>
>> But maybe there are cases where custom external toolchains do not
>> contain gdbserver already, and the user would like buildroot to build
>> it? In that case, we could consider changing the depend line to:
>> depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM || !BR2_TOOLCHAIN_EXTERNAL
>>
>> What do you think? Should we cater for this?
>
> Do you have a practical usage for this?
>

Not now no. I used to build gdbserver in buildroot and ignore the one
from the toolchain, but I have now changed that behavior. It's more
logical and sound, as you say.

So let's keep it the way it is.

Best regards,
Thomas
