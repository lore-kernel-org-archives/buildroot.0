From: Laurent GONZALEZ <br22@gezedo.com>
Date: Wed, 30 May 2018 14:12:20 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <20180529233219.0eca0f54@windsurf.home>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <20180529233219.0eca0f54@windsurf.home>
Message-ID: <5d5e71dc-66ad-3a09-9e1e-863df0de89f2@gezedo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/05/2018 23:32, Thomas Petazzoni wrote:
> Hello Christophe,
>
> On Tue, 29 May 2018 12:09:27 +0000, Christophe PRIOUZEAU wrote:
>> Due to runtime issue with the usage of BINUTILS 2.29.x,
>> we need to use the version 2.28.x
>>
>> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
> I know those patches have been committed, but I'd like to say I'm not
> totally happy with them: to me, they don't implement the right approach.
>
> Your patches only fix specifically the STM32 defconfigs. Any other
> Buildroot user doing Cortex-M4 stuff, for other platforms, will fall
> into the same binutils issue.
>
> So in fact the proposal that was made back in April at
> http://lists.busybox.net/pipermail/buildroot/2018-April/219223.html was
> in the end better.

Similarly, one can argue that this patch impacts every software, whereas
only linux kernel is not compatible with newer binutils.

Using this kernel patch may help to only fix what need to be fixed:

http://lists.infradead.org/pipermail/linux-arm-kernel/2018-March/565390.html
