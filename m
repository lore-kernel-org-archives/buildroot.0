From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 07 Feb 2015 16:47:55 -0300
Subject: [Buildroot] [PATCH 2/4] arm: update processor types
In-Reply-To: <54CFA343.9090806@openwide.fr>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1421951608-31233-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <54CFA343.9090806@openwide.fr>
Message-ID: <54D66BEB.6030002@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

First of all, thanks for the great feedback.

On 02/02/2015 01:18 PM, Romain Naour wrote:
[..]
>> -	default BR2_BINFMT_FLAT if BR2_m68k
>> +	default BR2_BINFMT_FLAT if BR2_m68k || BR2_cortex_m3
> 
> What do you think about adding BR2_ARCH_HAS_EFL_SUPPORT in each architecture
> Config.in.x instead of black-listing them here ?
> 

I've been thinking about this. At first it seemed like a good idea, but
then I realised that Cortex-M3 is not really an architecture, but 
a variant.

Introducing BR2_ARCH_HAS_ELF_SUPPORT would mean selecting it on almost each
architecture and almost each of the ARM variants, except Cortex-M3.

So, it seems like it would be an elegant way of doing this, but I'm not sure
it's worth such an invasive change.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
