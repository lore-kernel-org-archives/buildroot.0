From: Matthew Weber <matt@thewebers.ws>
Date: Wed, 30 Mar 2016 19:41:00 -0500
Subject: [Buildroot] [PATCH 1/1] buildroot-test: enable toolchains based
 on hostarch
In-Reply-To: <20160330165525.4378cef8@free-electrons.com>
References: <1459302445-1256-1-git-send-email-matt@thewebers.ws>
 <20160330165525.4378cef8@free-electrons.com>
Message-ID: <CAFt09wOZO-VodhttV3qsc5s_z0D7JzGij6ShPxYz1F0iyv-uMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Mar 30, 2016 at 9:55 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 29 Mar 2016 20:47:25 -0500, Matt Weber wrote:
>
>> +http://autobuild.buildroot.org/toolchains/configs/br-aarch64-glibc.config,x86_64,glibc
>> +http://autobuild.buildroot.org/toolchains/configs/br-arc-full-internal.config,x86_64,uclibc
>
> This is not correct. The host arch should be empty, or some magic value
> that says "any arch". Ditto for all "internal" toolchain configurations.

I guess I don't completely follow why "any arch" for the internals, as
that host arch entry should represent the arch of the system the
toolchain was built on, correct?  Or are you saying that because an
internal normally would be built from scratch it would work on any
arch?  If so, maybe we need a test that checks the gcc executable for
arch rather then using this host arch entry?

I do have a bug as we would still want to allow the i386 toolchains to
execute on a x86_64 system.  Currently it excludes those with this
update.

>
> Also, I need to think about the deployment: if I deploy the new CSV
> file on the server, but the build slaves have not yet updated their
> autobuild-run script, what will happen.
>
> I believe it *should* be fine: the old version of the autobuild-run
> script will detect the host arch as "x86" so it will only use a subset
> of the toolchains, but it will not fail badly or report errors. Then
> when the script gets updated, it will properly detect the host arch as
> x86_64 for the 64 bits machine, and it will restart using all possible
> toolchains.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Thanks,
Matt
