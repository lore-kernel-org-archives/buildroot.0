From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 13:24:10 +0200
Subject: [Buildroot] [PATCH 0/4] new builtin kernel with entropy for the
 test infra
In-Reply-To: <20190803082434.0080779f@windsurf.home>
References: <20190803052216.22292-1-ricardo.martincoski@gmail.com>
 <20190803082434.0080779f@windsurf.home>
Message-ID: <8b2b02d6-354c-bc13-05c9-6c0f27447eba@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/08/2019 08:24, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat,  3 Aug 2019 02:22:12 -0300
> Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:
> 
>> This small series adds a new builtin kernel image to the test infra.
>> It contains the VirtIORNG driver so the target will have enough entropy at
>> startup, a requirement for more and more packages being tested.
>>
>> It also uses this new builtin kernel to speed-up some test cases (atop,
>> syslog-ng, python-crossbar, python-nacl) and fix others (python-txtorcon,
>> python-treq).
>>
>> The binaries I used can be found here [1] and have this version string:
>>> Linux version 4.19.16 (br-user at runner-ed2dce3a-project-3755559-concurrent-0) (gcc version 4.9.4 (Buildroot 2017.08-git-01078-g95b1dae)) #1 Fri Aug 2 23:05:09 UTC 2019  
>>
>> One can see a complete run of "-runtime-tests" before [2] and after [3] this
>> series in the URLs below.
>>
>> In order to provide a v1 of this series, I created a naming convention for the
>> artifacts and also for the string passed to emulator.py in parameter "kernel".
>> It was the first naming that came to mind, so of course it is open to
>> suggestions/improvements.
>>
>> [1] https://gitlab.com/RicardoMartincoski/buildroot/commit/2ed44c7471cf5db246b592e24e9b2cfd69702f0f
>> [2] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/74501223
>> [3] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/74516103
> 
> Thanks a lot for working on this. However, instead of having this new
> kernel as a separate "version" from the current ARMv5 pre-built kernel,
> why don't we simply update the existing one ?

 IMO it's rarely a good idea to overwrite an existing file that can be
downloaded. So I'd apply Ricardo's patches as is.

 Regards,
 Arnout

> 
> One issue is that downloads get cached, so if the filename is the same,
> it won't be redownloaded. Perhaps we need to store hashes of the
> download artifacts, so that we can detect if they need to be
> re-downloaded ?
> 
> Best regards,
> 
> Thomas
> 
