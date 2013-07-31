From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 31 Jul 2013 08:50:32 +0200
Subject: [Buildroot] [PATCH] toolchain/gcc: Introduce
	BR2_ARCH_HAS_GCC_x_y_PLUS
In-Reply-To: <5183E67C.9040202@mind.be>
References: <1367570270-2242-1-git-send-email-mjonker@synopsys.com>
 <5183E67C.9040202@mind.be>
Message-ID: <CAAXf6LXbF7J5EuTo=Lf14uH6-JaBv8scJrZ=Qt=9FjMKt_6z1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, May 3, 2013 at 6:31 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/05/13 10:37, Mischa Jonker wrote:
>>
>> This patch eliminates the long "depends on" lines in
>> toolchain/gcc/Config.in by letting architectures specify
>> from which GCC version the architecture is supported.
>>
>> Architectures that support only one specific version of GCC
>> should bypass the GCC version selection mechanism.
>>
>> Signed-off-by: Mischa Jonker<mjonker@synopsys.com>
>> ---
>>   arch/Config.in.arm      |    6 ++++
>>   arch/Config.in.powerpc  |    7 ++++
>>   arch/Config.in.x86      |    1 +
>>   toolchain/gcc/Config.in |   73
>> +++++++++++++++++++++++++++++++++-------------
>>   4 files changed, 66 insertions(+), 21 deletions(-)
>
>
>  Now this looks good! If the 'depends on' statements had been split up into
> one line per architecture, the - would have been bigger than the +! So this
> gets my
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>

This patch has been lying around for a while. It will need to be
updated a bit because e.g. the gcc package has moved, but other than
that are there reasons not to include it?

Best regards,
Thomas
