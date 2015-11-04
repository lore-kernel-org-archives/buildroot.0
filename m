From: Steven Noonan <steven@uplinklabs.net>
Date: Tue, 3 Nov 2015 23:37:16 -0800
Subject: [Buildroot] [git commit] package/gcc: use generic extract
	commands
In-Reply-To: <20151104083427.350f1fd8@free-electrons.com>
References: <20151103223523.6C6E481E82@busybox.osuosl.org>
 <CAKbGBLig-vvPVGE=fMwVyy2nUAbMu_tyJujexW8Ry3finE_WMw@mail.gmail.com>
 <20151104083427.350f1fd8@free-electrons.com>
Message-ID: <CAKbGBLiSSx2Mu880d8VOgKaa+L_MCtOCC4Ry99edaZMAWqC8FQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oops, my patch was late then ;)

On Tue, Nov 3, 2015 at 11:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Steven Noonan,
>
> On Tue, 3 Nov 2015 21:17:36 -0800, Steven Noonan wrote:
>
>> > -HOST_GCC_FINAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
>> > +HOST_GCC_FINAL_TAR_EXCLUDES = $(HOST_GCC_TAR_EXCLUDES)
>>
>> This appears to be wrong. The variable used in pkg-generic.mk is
>> $(2)_EXCLUDES not $(2)_TAR_EXCLUDES. So this doesn't pass any
>> '--exclude's to the tar command.
>
> Indeed. Fixed by
> http://git.buildroot.net/buildroot/commit/?id=4a8478b728429e94e0c85330e1558298d905af3e.
> Thanks for having reported the issue!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
