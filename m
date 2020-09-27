From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 27 Sep 2020 15:43:26 +0200
Subject: [Buildroot] [PATCH 1/1]
 configs/stm32mp157c_dk2_trusted_defconfig: new platform
In-Reply-To: <20200927115701.520b50a6@windsurf.hq.k.grp>
References: <20200927061606.10239-1-shlomi.39sd@gmail.com>
 <20200927115701.520b50a6@windsurf.hq.k.grp>
Message-ID: <71a45b4b-22bb-e78e-44c4-72d06c0bae70@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys,

On 27.09.2020 11:57, Thomas Petazzoni wrote:
> Hello Shlomi,
>
> +Bartosz in Cc.
>
> Thanks for your contribution.
>
> On Sun, 27 Sep 2020 09:16:06 +0300
> Shlomi Vaknin <shlomi.39sd@gmail.com> wrote:
>
>> Adding support for trusted configuration for stm32mp157c-dk2.
>> In addtion, the following changes made to the original stm32mp157c_dk2_defconfig:
>> 1. Enable gadget support and wifi support in `linux.config`.
>> 2. Create a new dts file that contains the bindings for the wifi module. This was
>>     copied from the stm32 kernel fork.
>> 3. A txt file for the wifi firmware. This was copied from the yocto bsp layer of st.
>>
>> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> I am not sure it makes sense to have a separate defconfig for this. The
> ATF-based boot is really the one recommended by ST, and it's also the
> only one that allows to use the STM32 Cube Programmer for flashing.
>
> So I would rather suggest that we change the existing stm32mp1
> defconfigs (both DK1 and DK2) to use ATF instead of U-Boot SPL.
>
> Bartosz, what do you think ?
It sounds reasonable for me. The WIFI support would be really 
interesting because our configs don't contain that but I'm a bit 
sceptical to the changes that are not accepted by the upstream (or maybe 
I haven't noticed PR with devicetree changes on the linux mailing 
list?). There is also couple of things on my TODO list that could be 
improved within support of those boards so if everyone is ok with the 
above changes let's start from that.
>
> Thomas
Best
Bartek
