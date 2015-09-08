From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 8 Sep 2015 15:53:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/host-gdb: fix autobuild failure
In-Reply-To: <55EEF529.1030009@imgtec.com>
References: <1441721106-27234-1-git-send-email-brendanheading@gmail.com>
 <55EEED12.6000909@mind.be> <55EEEE0D.5050009@imgtec.com>
 <CA+BsyQ5b=EF8jc6-TWa2udxCnP64SHnXq-3OnUNpx-d8YSWadA@mail.gmail.com>
 <55EEF529.1030009@imgtec.com>
Message-ID: <CA+BsyQ7HibpSPRV_Z=WGit8rCgeV8SETstTbPScuU5qmjq1Zkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Looking into why, and will submit an updated patch when I crack it.
>> Probably a difference with the config, or there's a patch being added
>> somewhere.
>
> Perhaps you trying to build the target gdb in the same buildroot tree
> where you have built the host gdb? (which will have makeinfo available
> because host-texinfo has been built).

No, host-texinfo is not being built at all.

I found the cause - by default the full gdb is not built, only
gdbserver. It seems that a gdbserver-only build does not trigger the
documentation element of "make install" in gdb.

I need to make a better patch as there's already logic in the build to
only depend on texinfo under certain circumstances - and I also need
to test all the combinations (three different GDB versions are
supported). Hopefully will send it through today.

regards

Brendan
