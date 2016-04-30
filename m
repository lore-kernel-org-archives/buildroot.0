From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 Apr 2016 16:56:34 +0200
Subject: [Buildroot] [PATCH 2/4] package/efl: bump to 1.17.0
In-Reply-To: <5724A39E.8000308@zacarias.com.ar>
References: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
 <1461790014-17051-2-git-send-email-romain.naour@gmail.com>
 <572355E6.4040400@zacarias.com.ar>
 <f6b845e4-97b0-a3f5-57c5-dfce944dcd6a@gmail.com>
 <5724A39E.8000308@zacarias.com.ar>
Message-ID: <5724C7A2.7040704@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Le 30/04/2016 14:22, Gustavo Zacarias a ?crit :
> On 29/04/16 17:26, Romain Naour wrote:
> 
>> Weird, I'm able to build host-efl here... let me retry again.
>> Can you share your Buildroot config and the host-efl config.log ?
>>
>> Can you try to autoreconf the efl package ?
>> EFL_AUTORECONF = YES
>> EFL_GETTEXTIZE = YES
> 
> Hi Romain.
> It fails the same, so https://www.zacarias.com.ar/host-efl-config.log
> and https://www.zacarias.com.ar/efl-defconfig.txt

I'm unable to reproduce your issue :-(

But probably the issue is here:
USE_EVAS_LIBS='  [...] -lfreetype -L/usr/lib -lluajit-5.1 '

It seems that it doesn't use the luajit library from host-luajit package...
Otherwise I don't know.

Best regards,
Romain

> Thanks!
> Regards.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
