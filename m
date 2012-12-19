From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 19 Dec 2012 23:11:31 +0100
Subject: [Buildroot] [PATCH] sg3-utils new package.
In-Reply-To: <20121218100332.7a0c10d0@skate>
References: <1355776546-25189-1-git-send-email-marek.belisko@open-nandra.com>
 <20121218094835.688afe2c@skate>
 <CAAfyv37=U0YtKsNkoCxTA2iRAXwgTETrcuOPWXmvNasnOqZaSA@mail.gmail.com>
 <20121218100332.7a0c10d0@skate>
Message-ID: <CAAfyv35TW9i7-R1KJEnJSkOyV2dvkhabtFPnLip-fifEdop+QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Dec 18, 2012 at 10:03 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Belisko Marek,
>
> On Tue, 18 Dec 2012 09:52:41 +0100, Belisko Marek wrote:
>
>> > Hum, why is this needed? Does sg3_utils installs some libraries or
>> > headers that are useful for other packages?
>> I'm working on adding udisks to buildroot and udisks have dependency on
>> sg3-utils library so this is the reason why installing to staging.
>
> Ok. A comment just before the _INSTALL_STAGING line would be useful,
> then, because for a "utils" package, we don't necessarily expect to
> have a library in it.
>
>> I've read somewhere on ML you was working also on udisks package.
>> Was it successful?
>
> It was a looong time ago. I think I managed to get udisks to build, but
> I hadn't had the time to do some real testing with it: I was first
> doing some testing of polkit, which is a dependency of udisks.
>
> I've put online the 3 patches I had done at that time (note that they
> are old: they still use the old AUTOTARGETS macro name), see:
> http://free-electrons.com/~thomas/pub/udisks-buildroot/
Thanks for patches. I made small update and I can compile polkit without
problems but I have still problems with udisks.

Basically udisks have only autogen.sh script and I was trying to use:
UDISKS_AUTORECONF = YES macro.

With this change it fails during autoreconfiguring:

configure.ac:13: the top level
configure.ac:225: warning: AM_NLS is m4_require'd but not m4_defun'd
aclocal.m4:1204: IT_PROG_INTLTOOL is expanded from...
configure.ac:225: the top level
configure:14234: error: possibly undefined macro: AM_NLS
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.

Am I missing some dependency?

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
