From: =?iso-8859-15?Q?Herv=E9_CODINA?= <Herve.CODINA@celad.com>
Date: Sat, 24 Oct 2020 16:32:47 +0000
Subject: [Buildroot] [PATCH] Makefile: be careful what we remove from
 saved defconfig
In-Reply-To: <alpine.DEB.2.20.2010231929270.29285@defender.svolli.xa>
References: <20201021200828.3376405-1-yann.morin.1998@free.fr>
 <ad27d198-54b8-596c-a079-46c756a6617a@celad.com>
 <alpine.DEB.2.20.2010231929270.29285@defender.svolli.xa>
Message-ID: <dc3d24c2-bc60-f8b3-e73d-e660a07d2ec1@celad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/10/2020 19:35, Sven Oliver Moll wrote:
> On Fri, 23 Oct 2020, Herv? CODINA wrote:
> 
>> Maybe I acked too quickly ...
>>
>> What do you think about this pattern
>> @$(SED) '/^BR2_DEFCONFIG=/d' -e '/^# BR2_DEFCONFIG /
>> in order to match "BR2_DEFCONFIG=xxxxxxxx" and "# BR2_DEFCONFIG is not set" ?
> [...]
> 
> I don't think that this is necessary, because savedefconfig only saves the ones that are different from preset. So:
> - BR2_DEFCONFIG is the name to save to, so an unset instance does not exist
>  ? (a bit like chicken and egg)
> - BR2_DL_DIR, when unset, will not appear as "# BR2_DL_DIR is unset" in the
>  ? saved *_defconfig
> ...or am I missing something?
> 
> 
> Greetings,
> SvOlli

I didn't fully check if BR2_DEFCONFIG and BR2_DL_DIR can appear commented.
As some commented 'symbols' are present in defconfig files in /configs directory,
my remark was just a kind of belt and suspenders approach :-)

If BR2_DEFCONFIG and BR2_DL_DIR cannot appear commented, using just '/^BR2_DEFCONFIG=/d' and
'/^BR2_DL_DIR=/d' is ok for me.

Herve
