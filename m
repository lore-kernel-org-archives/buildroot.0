From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 30 Mar 2012 08:05:33 -0700
Subject: [Buildroot] DNS and static ip
In-Reply-To: <20120330161909.49b269c7@skate>
References: <CALo-6+jx5kYrPK26BR0b=vdLg11LGQnhonWXEUJU+-0RnKD2iw@mail.gmail.com>
 <20120330161909.49b269c7@skate>
Message-ID: <CALo-6+iH-2P2TUbuco9HvSdwLy21A23Won94pM1zO_SXk_qoxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ah, here is the problem, Thomas. In the build I am working with
resolv.conf is not in the skeleton, but after booting it is a softlink

resolv.conf -> ../tmp/resolv.conf

So, perhaps the problem is my understanding how this softlink was
created. I dont see it in device_table.txt and dont know where to look
next.

Charles Krinke

In the system I am looking at, /etc/resolv.conf is a

On Fri, Mar 30, 2012 at 7:19 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 30 Mar 2012 07:15:22 -0700,
> Charles Krinke <charles.krinke@gmail.com> a ?crit :
>
>> I am searching for a little knowledge on DNS with staticIP addresses
>> in busybox.
>>
>> Is there a setting, like "nameserver = 8.8.8.8" that can be added to
>> /etc/network/interfaces when one uses static ip addresses in busybox
>> or said differently "What is the proper way to deal with DNS in
>> busybox with static ip addresses?"
>
> nameserver 8.8.8.8
>
> in /etc/resolv.conf. It is not different than using dynamic addressing
> with DHCP, except that in the DHCP case, the DHCP client automatically
> fills this file for you.
>
> Or maybe I did not understand your question properly?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Charles Krinke
