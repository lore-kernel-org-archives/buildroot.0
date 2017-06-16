From: Chakra D <2chakrass@gmail.com>
Date: Fri, 16 Jun 2017 21:43:49 +0530
Subject: [Buildroot] [PATCH] board: Add nanopi-m1 Support
In-Reply-To: <20170615221508.27a297ab@windsurf.lan>
References: <1497547465-15445-1-git-send-email-chakra@openedev.com>
 <20170615221508.27a297ab@windsurf.lan>
Message-ID: <CAA4kGkoqCAqnwcYaVR1+fqYF64vdwfEc0ZdABU9PeanN2-783A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the feedback - please find my answers inline

On Fri, Jun 16, 2017 at 1:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 15 Jun 2017 22:54:25 +0530, Chakra Divi wrote:
>> Add initial support for nanopi-m1 board
>> with below features
>> - U-Boot 2017.07-rc1
>
> Are you using this -rc1 because it's the first U-Boot version with
> support for this board?

Yes i have verified and found that nanopi-m1 is supported from rc1. Is
this an issue ?

>
>> - Linux 4.11
>> - Default packages from buildroot
>>
>> Created a new folder nanopi under buildroot
>> board; any new board for nanopi can be added
>> here
>
> We already have the support for another nanopi board
> in board/nanopi-neo/. Perhaps some refactoring is needed?

As Arnout suggested, will move "nanopi-neo" also under this vendor folder

> Also is "nanopi" really the vendor name? We normally like to have
> board/<vendor>/<boardname>/.

vendor is "friendlyarm"

yuefei , can you please confirm this - shall i go ahead with folder
name "friendlyarm" ?

>> diff --git a/board/nanopi/post-image.sh b/board/nanopi/post-image.sh
>> new file mode 100755
>> index 0000000..359b4c9
>> --- /dev/null
>> +++ b/board/nanopi/post-image.sh
>> @@ -0,0 +1,14 @@
>> +#!/bin/sh
>> +
>> +BOARD_DIR="$(dirname $0)"
>> +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
>> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
>> +
>> +rm -rf "${GENIMAGE_TMP}"
>> +
>> +genimage                               \
>> +     --rootpath "${TARGET_DIR}"     \
>> +     --tmppath "${GENIMAGE_TMP}"    \
>> +     --inputpath "${BINARIES_DIR}"  \
>> +     --outputpath "${BINARIES_DIR}" \
>> +     --config "${GENIMAGE_CFG}"
>
> Could you use support/scripts/genimage.sh instead ?
>

Ok will update

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
