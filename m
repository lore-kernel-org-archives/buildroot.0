From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 08 Dec 2014 22:55:55 +0100
Subject: [Buildroot] [PATCHv2 03/12] binutils/2.23: add patch to warn
 about unsafe library paths
In-Reply-To: <54833B8A.5070401@openwide.fr>
References: <1417470913-1280-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470913-1280-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <54833B8A.5070401@openwide.fr>
Message-ID: <54861E6B.803@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 06/12/2014 18:23, Romain Naour a ?crit :
> Hi Thomas,
> 
> Le 01/12/2014 22:55, Thomas Petazzoni a ?crit :
>> This commit adds a patch to binutils borrowed from CodeSourcery/Yocto
>> that warns about unsafe library paths (i.e /usr/lib, /usr/local/lib,
>> etc.). The patch was adapted to binutils 2.23, and modified to support
>> the BR_COMPILER_PARANOID_UNSAFE_PATH environment variable to error out
>> instead of just warn when unsafe paths are used. Even though erroring
>> out can be chosen by passing --error-poison-system-directories, we are
>> not sure this option in LDFLAGS will always be passed, so having an
>> environment variable guarantees it will always be passed, and also
>> allows to have an identical behavior to the external toolchain
>> wrapper.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
> 
> Tested-by: Romain Naour <romain.naour@openwide.fr>
> 
> Tested with the following internal toolchain

Please ignore this email, I accidentally sent the mail...

Thanks,
Romain Naour
