From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 22 Oct 2020 21:53:43 +0200
Subject: [Buildroot] Minnowboard set up problem
In-Reply-To: <CALbLrU2J46KsUr8b+8U=0M24En3B+w9rwn3YJ6ve=COdZ7RATw@mail.gmail.com>
References: <CALbLrU2J46KsUr8b+8U=0M24En3B+w9rwn3YJ6ve=COdZ7RATw@mail.gmail.com>
Message-ID: <20201022215343.7acadee4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Facu Ramallo,

On Thu, 22 Oct 2020 15:53:00 -0300, Facu Ramallo <facku24@gmail.com> wrote:

> Hi guys!
>
> I'm brandly new with buildroot. I'm trying to build a system for my
> minnowboard. After a little research, I found out that the basic steps to
> start are:
>
>    - *make minnowboard_max_defconfig*
>    - *make*
>    - *dd if=sdcard.img of=my_sdcard bs=1M*
>
> And I could finally start my linux distribution on my minnowboard. But,
> then I used
>
>    - *make menuconfig*
>
> In order to enable the packages for openssh, I want to send some code
> through  scp. But, after enable those packages, run
>
>    - *make*
>    - *dd if=sdcard.img of=my_sdcard bs=1M*
>
> And the problem is that after my system boots, I don't read the
> messages "*Wellcome
> to Buildroot*" and "*buildroot login:*" anymore.
>
> Can you tell me please, if I did something wrong?

Would suspect a long startup time of the sshd daemon because of lack
of enough random data (search for 'ssh random booting' for details)...

Try to wait longer...

Regards,
Peter

>
> Regards!
