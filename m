From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Feb 2015 15:43:32 +0100
Subject: [Buildroot] [PATCH 2/4] arm: update processor types
In-Reply-To: <54D66BEB.6030002@vanguardiasur.com.ar>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1421951608-31233-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <54CFA343.9090806@openwide.fr> <54D66BEB.6030002@vanguardiasur.com.ar>
Message-ID: <54DF5F14.2010900@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ezequiel,

Le 07/02/2015 20:47, Ezequiel Garcia a ?crit :
> Hi Romain,
> 
> First of all, thanks for the great feedback.

You're welcome :)

> 
> On 02/02/2015 01:18 PM, Romain Naour wrote:
> [..]
>>> -	default BR2_BINFMT_FLAT if BR2_m68k
>>> +	default BR2_BINFMT_FLAT if BR2_m68k || BR2_cortex_m3
>>
>> What do you think about adding BR2_ARCH_HAS_EFL_SUPPORT in each architecture
>> Config.in.x instead of black-listing them here ?
>>
> 
> I've been thinking about this. At first it seemed like a good idea, but
> then I realised that Cortex-M3 is not really an architecture, but 
> a variant.
> 
> Introducing BR2_ARCH_HAS_ELF_SUPPORT would mean selecting it on almost each
> architecture and almost each of the ARM variants, except Cortex-M3.
> 
> So, it seems like it would be an elegant way of doing this, but I'm not sure
> it's worth such an invasive change.
> 

We may introduce BR2_ARCH_HAS_ELF_SUPPORT as an hidden option which is set to y
by default except for BR2_bfin, BR2_m68k and BR2_cortex_m3. (like for BR2_USE_MMU)

config BR2_ARCH_HAS_ELF_SUPPORT
	bool
	default y if !(BR2_bfin || BR2_m68k || BR2_cortex_m3)

What other developer think ?

Best regards,
Romain
