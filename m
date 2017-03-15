From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 14 Mar 2017 22:02:31 -0300 (BRT)
Subject: [Buildroot] cmake is not building anymore
In-Reply-To: <1489420484.20145.218.camel@linux.intel.com>
References: <1489417019.20145.214.camel@linux.intel.com>
 <1489420484.20145.218.camel@linux.intel.com>
Message-ID: <544671010.14659188.1489539751977.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
> To: "buildroot" <buildroot@busybox.net>
> Sent: Monday, March 13, 2017 12:54:44 PM
> Subject: Re: [Buildroot] cmake is not building anymore

> On Mon, 2017-03-13 at 16:56 +0200, Andy Shevchenko wrote:
>> Hi!
>> 
>> After update to 2017.02 followed by origin/2017.02.x cmake fails to
>> compile.
>> 
>> output/build/host-cmake-
>> 3.6.3/Utilities/cmlibarchive/libarchive/archive_hmac.c: In function
>> ?__hmac_sha1_cleanup?:
>> output/build/host-cmake-
>> 3.6.3/Utilities/cmlibarchive/libarchive/archive_hmac.c:203:24: error:
>> dereferencing pointer to incomplete type ?archive_hmac_sha1_ctx {aka
>> struct hmac_ctx_st}?
>> ? memset(ctx, 0, sizeof(*ctx));
>> ????????????????????????^~~~
>> 
>> Is it known issue?
> 
> Just did a clean build. Issue still stays.

I attempted to reproduce your problem but cmake build flawlessly:

    $ git checkout -b 2017.02.x origin/2017.02.x
    $ git --no-pager log -n 1 --pretty=oneline
    3bf15bfc84f646efbdeead006378265fa56855a9 libiio: explicitly disable matlab bindings
    [...]
    $ make host-cmake

Please provide some context information:

    $ make BR2_DEFCONFIG=$PWD/my_defconfig savedefconfig; cat my_defconfig
    $ uname -a
    $ cat /etc/lsb-release 
    $ gcc --version

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
