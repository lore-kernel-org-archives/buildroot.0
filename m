From: Francesco <francesco.montorsi@gmail.com>
Date: Tue, 9 Apr 2013 10:21:31 +0200
Subject: [Buildroot] syslog messages during boot not recorded?
In-Reply-To: <CAKW0qiihqK3F7yCQm6X2F8mk3PjF1q3Noj+19xKm3AyYXdvNNQ@mail.gmail.com>
References: <loom.20130408T181747-784@post.gmane.org>
 <5162F298.7060909@zacarias.com.ar>
 <CAKW0qihWyAonXk7=TB_Hq8q3E_pBuCv94D7eQ890ePx6b_CbMw@mail.gmail.com>
 <5162F662.1010608@zacarias.com.ar>
 <CAKW0qiihqK3F7yCQm6X2F8mk3PjF1q3Noj+19xKm3AyYXdvNNQ@mail.gmail.com>
Message-ID: <CAKW0qiisGpio87MM3NFWoKZqvRSnH4_ieeaoh2F+45pRs-=UgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In any case, something I do not understand is the reason why
/var/log/messages contains a lot of messages marked as "kernel: " and
referring to the boot of the system (hardware configuration, CPU
features, etc etc etc)... these messages are probably generated much
earlier than /etc/init.d scripts are run!

Thanks for any hint,
Francesco


2013/4/9 Francesco <francesco.montorsi@gmail.com>:
> 2013/4/8 Gustavo Zacarias <gustavo@zacarias.com.ar>:
>> It's a feature of BUSYBOX, not buildroot, meant for syslogd to work in
>> scenarios where your /var/log directory isn't writable for example.
>> Which begs the question, is it writable?
> good point... my /var/log is a symbolic link to /tmp and "ls -l" shows
> that its permissions (after system boot) are "drwxrwxrwt".
> I think the problem may be due to /tmp being mounted AFTER/AT THE END
> of the system boot... in fact, /tmp is a tmpfs... the relevant line in
> /etc/fstab is:
>
>      tmpfs           /tmp           tmpfs    defaults          0      0
>
> now my question is: how do I ensure that /tmp is mounted before
> /etc/init.d scripts are run?
>
> Thanks a lot!
> Francesco
