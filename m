From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 May 2019 14:27:25 +0200
Subject: [Buildroot] [PATCH] board/qemu/ppc*: disable Werror while
 building ppc kernel with gcc >= 9.1
In-Reply-To: <4a872624-ceb5-23cb-9005-3284ffbce131@gmail.com>
References: <20190501125236.16786-1-romain.naour@gmail.com>
 <27b861d5-8ead-229b-61ac-95806515d90a@mind.be>
 <4a872624-ceb5-23cb-9005-3284ffbce131@gmail.com>
Message-ID: <b55d30e3-803f-11bb-0054-677eed9df333@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/05/2019 15:57, Romain Naour wrote:
> Hi Arnout,
> 
> Le 01/05/2019 ? 15:32, Arnout Vandecappelle a ?crit?:
>>
>>
>> On 01/05/2019 14:52, Romain Naour wrote:
>>> Add CONFIG_PPC_DISABLE_WERROR only for qemu ppc{64} defconfig
>>> since they are used for CI with toolchain-builder's gitlab [3].
>>
>>  Maybe it would be better to have a single fragment file
>> board/linux-ppc-disable-werror.fragment
>> and include that in all the relevant defconfigs, rather than updating each linux
>> config?
> 
> I'm not sure how to handle such fragments in Buildroot.
> Storing fragments in board directory seems not great.

 Maybe in board/shared then?


> Maybe add a new fragments directory in linux package directory:
> linux/fragments/linux-ppc-disable-werror.fragment

 I don't like that. that. IMO, the linux/ directory should only contain stuff
that is used by the linux package infra itself. IMO the defconfigs should only
refer to paths in board/ and utils/.

 We currently have two exceptions to that "rule": genimage.sh which is in
support/scripts instead of utils, and busybox-minimal.config which is in the
busybox directory.


> Or a new directory configs/fragments/linux/linux-ppc-disable-werror.fragment

 I feel that configs/ is an artefact of the kconfig infra, it would in fact be a
lot more logical to have the defconfigs in the board directory. But
board/fragments/linux would work as well. Though I don't see many other shared
fragments than linux config fragments...

 Regards,
 Arnout


> 
> Thought ?
> 
> Best regards,
> Romain
> 
>>
>>  Regards,
>>  Arnout
>>
> 
