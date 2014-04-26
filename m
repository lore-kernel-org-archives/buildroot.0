From: Frank Bergmann <frank@frajasalo.de>
Date: Sat, 26 Apr 2014 22:27:47 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-18
In-Reply-To: <qcft2bxqc.ln2@ID-313208.user.individual.net>
References: <20140419063009.6CB4810148A@stock.ovh.net>
 <20140419090850.339ca98f@skate>
 <22et2bxh5o.ln2@ID-313208.user.individual.net>
 <qcft2bxqc.ln2@ID-313208.user.individual.net>
Message-ID: <535C16C3.9040401@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26.04.2014 21:52, Bernd Kuhls wrote:
> Bernd Kuhls <berndkuhls@hotmail.com> wrote in
> news:22et2bxh5o.ln2 at ID-313208.user.individual.net:
>
>> Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com>
>> wrote in news:20140419090850.339ca98f at skate:
>>
>>>>       nios2 |                 minidlna-1.1.2 | NOK |
>>>>       http://autobuild.buildroot.net/results/1948b8998a8795436990178b669
>>>>       1 a690327c67aa/
>>>
>>> Not sure who can take care of this.
>>>
>>> checking for avformat_open_input in -lavformat... no
>>> configure: error: Could not find libavformat - part of ffmpeg
>>> make: ***
>>> [/home/test/test/3/output/build/minidlna-1.1.2/.stamp_configured] Error
>>> 1
>>
>> Hi,
>>
>> although I do not have any experience with nios2 I will try to take care
>> of this build error.
>>
>> Regards, Bernd
>>
>
> Hi,
>
> it seems we hit the _gp linker bug again which Peter planned to
> investigate: http://patchwork.ozlabs.org/patch/312275/
>
> Here is the minidlna/config.log snippet regarding the current autobuild
> error. Sorry, no solution from me this time.

Hello,

there are some packages that are affected by this bug. Shall all these 
packages be deactivated for nios2 ?

binutils, gcc and gdb seems to have support for nios2 now but glibc 
lacks of it. And it seems that will not change in the near future. So an 
own buildroot toolchain can't be set up right now.

Regards,
Frank Bergmann.
