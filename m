From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Sep 2015 15:58:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/host-gdb: fix autobuild failure
In-Reply-To: <CA+BsyQ7HibpSPRV_Z=WGit8rCgeV8SETstTbPScuU5qmjq1Zkw@mail.gmail.com>
References: <1441721106-27234-1-git-send-email-brendanheading@gmail.com>	<55EEED12.6000909@mind.be>	<55EEEE0D.5050009@imgtec.com>	<CA+BsyQ5b=EF8jc6-TWa2udxCnP64SHnXq-3OnUNpx-d8YSWadA@mail.gmail.com>	<55EEF529.1030009@imgtec.com>
 <CA+BsyQ7HibpSPRV_Z=WGit8rCgeV8SETstTbPScuU5qmjq1Zkw@mail.gmail.com>
Message-ID: <55EEF783.4010401@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On 09/08/2015 03:53 PM, Brendan Heading wrote:
>>> Looking into why, and will submit an updated patch when I crack it.
>>> Probably a difference with the config, or there's a patch being added
>>> somewhere.
>>
>> Perhaps you trying to build the target gdb in the same buildroot tree
>> where you have built the host gdb? (which will have makeinfo available
>> because host-texinfo has been built).
> 
> No, host-texinfo is not being built at all.
> 
> I found the cause - by default the full gdb is not built, only
> gdbserver. It seems that a gdbserver-only build does not trigger the
> documentation element of "make install" in gdb.

Indeed, I was reproducing the autobuild failure with the full gdb.

> I need to make a better patch as there's already logic in the build to
> only depend on texinfo under certain circumstances - and I also need
> to test all the combinations (three different GDB versions are
> supported). Hopefully will send it through today.

When you do it, could you please use a better subject? "fix autobuild
failure" doesn't give any information about what the patch does.
"host-texinfo needed for full gdb" gives more information, for instance.

Regards,

Vincent.

> regards
> 
> Brendan
> 
