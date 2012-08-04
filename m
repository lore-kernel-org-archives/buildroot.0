From: Kevin Wilson <wkevils@gmail.com>
Date: Sat, 4 Aug 2012 16:55:08 +0300
Subject: [Buildroot] avoiding the need to enter password
In-Reply-To: <20120804130507.13db9c42@skate>
References: <CAGXs5wVSxtaZP47Owd+O+gqzqCZZcmuYJ-msSyTyU7pyED_q=g@mail.gmail.com>
 <20120804130507.13db9c42@skate>
Message-ID: <CAGXs5wViA3UoPPd6_Q1SHuC8JO_M6hTemt80LntGuu0rU_jY6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks.

> doing so that anyone connecting to your
> system with a serial port has direct root access.
This is ok.

I tried it replacing  /bin.sh instead of the
/sbin/getty line in /etc/inittab and indeed it boots into prompt
without need to enter password.
Is there a way to enforce it running the /etc/profile in boot
in such a case ?
(It seems to me that /etc/profile is not executed)


On Sat, Aug 4, 2012 at 2:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Sat, 4 Aug 2012 12:48:19 +0300,
> Kevin Wilson <wkevils@gmail.com> a ?crit :
>
>> When booting to Buildroot  (which I had built from tree) I get the
>> message: Welcome to Buildroot
>> buildroot login:
>>
>> Is there a way to disable the need to enter password so that it will
>> boot automatically instead that I will have each time enter the
>> default password (which is "root")?
>
> The default password is not "root". The default password is empty.
>
> You can change /etc/inittab so that instead of starting /sbin/getty it
> starts /bin/sh. But obviously, doing so that anyone connecting to your
> system with a serial port has direct root access.
>
> But generally, this isn't needed: you just start whatever application
> you need through /etc/init.d/ scripts, and those applications get
> started regardless of whether you logged into the system or not.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
