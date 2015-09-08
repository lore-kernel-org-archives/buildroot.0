From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Sep 2015 15:48:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/host-gdb: fix autobuild failure
In-Reply-To: <CA+BsyQ5b=EF8jc6-TWa2udxCnP64SHnXq-3OnUNpx-d8YSWadA@mail.gmail.com>
References: <1441721106-27234-1-git-send-email-brendanheading@gmail.com>	<55EEED12.6000909@mind.be>	<55EEEE0D.5050009@imgtec.com>
 <CA+BsyQ5b=EF8jc6-TWa2udxCnP64SHnXq-3OnUNpx-d8YSWadA@mail.gmail.com>
Message-ID: <55EEF529.1030009@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On 09/08/2015 03:41 PM, Brendan Heading wrote:
>> It is needed for the target as well. You can build the target gdb
>> without building the host gdb, in which case the host-texinfo package
>> would not be installed and you would face the failure again.
>>
>> Brendan, please, can you add the dependency for target gdb as well?
> 
> I'm looking at it, but strangely, I'm not able to reproduce the same
> problem with target GDB - it appears to build just fine without the
> texinfo dependency.
> 
> Looking into why, and will submit an updated patch when I crack it.
> Probably a difference with the config, or there's a patch being added
> somewhere.

Perhaps you trying to build the target gdb in the same buildroot tree
where you have built the host gdb? (which will have makeinfo available
because host-texinfo has been built).

Regards,

Vincent.

> Brendan
> 
