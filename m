From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 12 Feb 2018 12:32:03 -0300
Subject: [Buildroot] [PATCH 1/1] toolchain: use -ffp-contract=off on
 MIPS in the wrapper when needed
In-Reply-To: <20180116210339.4c541835@windsurf>
References: <1516128616-20127-1-git-send-email-johannes.schmitz1@gmail.com>
 <20180116210339.4c541835@windsurf>
Message-ID: <CAAEAJfA1NEVzLMsaP-CbF7dBO1-mqm72ighraxN41y6m=t44pQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 16 January 2018 at 17:03, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 16 Jan 2018 19:50:16 +0100, Johannes Schmitz wrote:
>> This fix is necessary for to build for MIPS, for example for the MIPS
>> XBurst architecture used on ci20 boards.
>>
>> GCC has replaced (no)mfused-madd with ffp-contract.
>> Find more details and a long discussion at
>> https://gcc.gnu.org/ml/gcc-patches/2015-06/msg00876.html
>>
>> Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>
>
> Within just 3 minutes, you sent this patch 3 times. Two times the exact
> same version, and one time a different version. There is also no
> version number on the patches, making it very difficult to understand
> what is *the* correct patch.
>
> Could you add a version number to your patches (git format-patch -v X),
> include a changelog between version (below the --- sign that follows
> the Signed-off-by line) and try to avoid sending 3 times the same patch
> in a row ? :-)
>

According to the last mail from Johannes, you should pick
his last patch:

<1516128787-20711-1-git-send-email-johannes.schmitz1@gmail.com>

Which means:

https://patchwork.ozlabs.org/patch/861859/

I can confirm it unbreaks ci20_defconfig:

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
