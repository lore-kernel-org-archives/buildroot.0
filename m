From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 18 Jun 2015 10:54:23 +0200
Subject: [Buildroot] Busybox build fails on raspberrypi defconfig
In-Reply-To: <20150617164134.01411faf@free-electrons.com>
References: <CAJtjsKZ9zeYzwSkMKiAvUz50e_7L9HKbNLY8WWwz5e59=AHGSw@mail.gmail.com>
 <CAJtjsKa9Osr3VjF6jBysCFPEKhh4c8HAHVP7FfVj07_N_B1FMQ@mail.gmail.com>
 <20150617164134.01411faf@free-electrons.com>
Message-ID: <CAJtjsKaR=yJDgzzC0JupB7DJYvuxvOwvU2Ziv_6eU1-a8fhyFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

On Wed, Jun 17, 2015 at 4:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Are you sure you did a full rebuild from scratch, and you didn't select
> uClibc-ng but using package/uclibc/uClibc-0.9.33.config as the
> configuration file ? That could explain the problem, because the
> UCLIBC_HAS_UTMP option didn't exist in uClibc-0.9.33.config, so if you
> use that config file with uClibc-ng, UTMP support will be disabled.
>
> Can you double check this?

As I don't know how to do better than make clean and make defconfig to
rebuild from scratch, I've cloned the repository elsewhere.
Indeed, this time, it successfully compiles.

I still don't know why it didn't compile before, as I'm pretty sure
the .config was using uClibc-ng configuration file (because I've
manually changed it to uClibc-0.9.33.config when I reverted to uClibc
0.9.33). At least, I know the problem is not in the git master branch.

Thanks for your help.
-- 
Johan
