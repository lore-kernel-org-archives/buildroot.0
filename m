From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 18 Nov 2012 13:51:00 +0200
Subject: [Buildroot] [PATCH] busybox: needs linux-pam dependency added
 if using custom busybox .config & busybox login applet
In-Reply-To: <CANxTyt6cjey_R_w+ZupOqUF_oaN09eF5jUDt=TWu6fUSNT8SWA@mail.gmail.com>
References: <1353197713-20796-1-git-send-email-stefan.froberg@petroprogram.com>
 <CANxTyt6cjey_R_w+ZupOqUF_oaN09eF5jUDt=TWu6fUSNT8SWA@mail.gmail.com>
Message-ID: <50A8CBA4.903@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi
18.11.2012 4:14, Danomi Manchego kirjoitti:
>
>
>
> On Sat, Nov 17, 2012 at 7:15 PM, Stefan Fr?berg
> <stefan.froberg@petroprogram.com
> <mailto:stefan.froberg@petroprogram.com>> wrote:
>
>     +ifeq ($(shell sed -n "s/CONFIG_LOGIN=\(y\)/\1/p"
>     $(BR2_PACKAGE_BUSYBOX_CONFIG)),y)
>     +BUSYBOX_DEPENDENCIES += linux-pam
>     +endif
>
>  
> Why bother with the sed?  Could you not do "ifeq
> ($(BR2_PACKAGE_LINUX_PAM),y)"?
>
No because I don't have a need for full linux-pam login binary.

I only need linux-pam because I have login applet enabled inside my
custom BusyBox .config file
and that needs Linux Pam headers.


Regards
Stefan

> Just a thought ...
> Danomi -
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121118/e444326d/attachment.html>
