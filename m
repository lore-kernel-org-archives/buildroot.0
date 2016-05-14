From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 May 2016 16:59:05 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160514154655.57ae0bad@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
Message-ID: <20160514145905.GA3877@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-05-14 15:46 +0200, Thomas Petazzoni spake thusly:
> >         i686 |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/e5b005a3ac9d7313b71eaf492d03d6b61b87e683/
> 
> /usr/bin/ld: BFD (GNU Binutils for Ubuntu) 2.24 internal error, aborting at ../../bfd/merge.c line 873 in _bfd_merged_section_offset
> 
> Yann, this is happening on your machine. Can you have a look, and see
> if it's reproducible, or if it's a bug due a HW issue?

I'm not sure my machine is the only one to have the issue. There are
very similar issues building host-python3:

    http://autobuild.buildroot.net/?reason=host-python3-3.4.3

    http://autobuild.buildroot.net/results/831/831d5942a732caf2af39b3974244d889ece04fc5/build-end.log
    http://autobuild.buildroot.net/results/49d/49d02998eeb5817d92574f61f6786a4f5c71d131/build-end.log
    http://autobuild.buildroot.net/results/02f/02f9af623678514456be799d99edfbf93b42282f/build-end.log
    http://autobuild.buildroot.net/results/760/76044495f1b62b21efe092274f7d3bd6325c0e49/build-end.log
    http://autobuild.buildroot.net/results/1d2/1d2852508195278e50b48127c3b37630421a5784/build-end.log
    http://autobuild.buildroot.net/results/a78/a782a0df8d8a2f557890652432e051190b45b161/build-end.log
    http://autobuild.buildroot.net/results/879/879dd23c6195b0df55961a6143f45217e34276ef/build-end.log
    http://autobuild.buildroot.net/results/42f/42fa44d763e0d5f9d83628615f3d7b7f89f58f6a/build-end.log
    http://autobuild.buildroot.net/results/e0e/e0ec63e1988ba2e9b6dc15ed394af55ee8b57ed2/build-end.log
    http://autobuild.buildroot.net/results/0f4/0f4b0afab6f03cd6b671f756f164acea96b8f7dc/build-end.log
    http://autobuild.buildroot.net/results/068/068c5ddb493727192cdbb61219bb1a6ea2f773ef/build-end.log
    http://autobuild.buildroot.net/results/3ea/3eab97affdb825268c172dc624f3d3011942e42d/build-end.log
    http://autobuild.buildroot.net/results/895/8951013d2778f37733e14ac5e70e7b89f9202d37/build-end.log

All failing with at least one module being truncated (i.e. empty):
    Modules/getbuildinfo.o: file not recognized: File truncated
    Objects/unicodeobject.o: file not recognized: File truncated

Except this one:
    http://autobuild.buildroot.net/results/39b/39b8bbb0add467b8f4f16dfc798c3e972a20075c/build-end.log

which failed with:
    /usr/bin/ld: final link failed: File truncated

So it all looks to me like there is a parallel build issue. I'll be
investigating

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
