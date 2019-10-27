From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 27 Oct 2019 20:15:38 +0100
Subject: [Buildroot] [PATCH v2 5/7] board/qemu/*/launch.sh: add qemu
 launch script
In-Reply-To: <20191027191500.30ee192b@windsurf.dhcp.lyon.intranet>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557075239-30667-6-git-send-email-jugurtha.belkalem@smile.fr>
 <20190802235829.17b89102@windsurf.home>
 <584f74c1-c7a1-a529-a6f1-f57f4d153865@smile.fr>
 <20191027175223.573ace6c@windsurf.dhcp.lyon.intranet>
 <59e19185-c2a1-4a0a-6924-084be110b751@smile.fr>
 <20191027191500.30ee192b@windsurf.dhcp.lyon.intranet>
Message-ID: <3eb17074-f7b7-1c80-892f-5897f9c954f1@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 27/10/2019 ? 19:15, Thomas Petazzoni a ?crit?:
> On Sun, 27 Oct 2019 18:59:09 +0100
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> There are some readme.txt containing several qemu command lines, those are not
>> even used by toolchain builder.
>>
>> Do we want to add more options to launch.Sh to handle theses special cases ?
> 
> I don't think it makes sense to add more options to launch.sh, as these
> options will not be known by the automated testing stuff, as it will
> only know about "run launch.sh".

Agree

> 
>> arm-versatile:
>> - MMU emulation
>> - noMMU emulation
> 
> These are two separate defconfigs, so we should have two separate
> launch.sh scripts.

Ok, so I'll move all nommu related stuff outside of arm-versatile directory:

board/qemu/arm-versatile/
board/qemu/arm-versatile-nommu/

> 
>> arm-vexpress-tz:
>> The readme.txt has a lot of information and contain several qemu command lines.
>> Only the first one is interesting for automated tested.
> 
> This one is really special IMO.>
>> csky:
>> - ck860 smp
>> - ck810/ck807
>> - ck610
> 
> These ones could be split into several launch.sh scripts, one for each
> platform.

Same for them, I'll create one directory for each variant of csky.

Romain

> 
> Thomas
> 
