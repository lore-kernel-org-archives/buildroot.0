From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 1 Jan 2017 12:50:45 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: AIGLX
 Extension removed in 1.19.0
In-Reply-To: <vs2njdxqqd.ln2@ID-313208.user.individual.net>
References: <20161231163037.13818-1-romain.naour@gmail.com>
 <vs2njdxqqd.ln2@ID-313208.user.individual.net>
Message-ID: <6c8e7e25-e2e1-de2b-22fb-810395b4b470@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 01/01/2017 ? 11:39, Bernd Kuhls a ?crit :
> Am Sat, 31 Dec 2016 17:30:37 +0100 schrieb Romain Naour:
> 
>> https://cgit.freedesktop.org/xorg/xserver/commit/?
> id=501d8e2beb337e072c93c9310fcd927a099b9c3b
>>
>> Signed-off-by: Romain Naour
>> <romain.naour@gmail.com>
>> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>  package/x11r7/xserver_xorg-server/Config.in | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks for the ack :)

It seems that this new release of xserver is buggy with DRI2 and freeze some
applications (even with my new Fedora 25).

While testing lugaru package [1] with Enlightenment window manager, the game
freeze quickly or even in the game menu.

So I've used elementary_test program to check if the test suite run correctly...
The same problem appear with "GLView Gears" test [2].

It seems I'm not the only one having issues with this release [3] [4].
Reverting back to 1.18.4 fixed this freeze.

I need to test with 1.19.0 using DRI3 as suggested in [3].

Thoughts ?

Best regards,
Romain

[1] http://patchwork.ozlabs.org/patch/706847/
[2] https://phab.enlightenment.org/T5061
[3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=846779#30
[4] https://bugzilla.redhat.com/show_bug.cgi?id=1399396

> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
