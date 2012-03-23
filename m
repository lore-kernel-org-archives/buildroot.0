From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 23 Mar 2012 09:57:56 +0100
Subject: [Buildroot] ofono package
In-Reply-To: <20120323094557.05470559@skate>
References: <CAAfyv35Rq_ad_obvHC2QZdhBvebLqpsRO7G0B4qpkGZuEYamuA@mail.gmail.com>
 <CAGm1_ks7QkKyFS7wWPMi3ytu4d2QU=k=gVEcnq6ENoA-CM3sKQ@mail.gmail.com>
 <CAAfyv356rwaUgjL2yF+=iaBBQ7zMKZC3pz91bxz=cUwSHnb9sw@mail.gmail.com>
 <20120323094557.05470559@skate>
Message-ID: <CAGm1_kt922_Sd_Ytb=gm3g0LKq4XDMVn2GgH0y8_nwnxaSf4FA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 23, 2012 at 9:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Fri, 23 Mar 2012 09:41:59 +0100,
> Belisko Marek <marek.belisko@gmail.com> a ?crit :
>
>> >> When run make I always got:
>> >> checking for dbus_watch_get_unix_fd in -ldbus-1... yes
>> >> checking for dbus_connection_can_send_type in -ldbus-1... yes
>> >> checking for CAPNG... yes
>> >> checking for USB... yes
>> >> checking for BLUEZ... no
>> >> configure: error: Bluetooth library >= 4.30 is required
>
> Can you post:
>
> ?* The relevant part of configure.{in,ac} which implements the BLUEZ
> ? check
>
> ?* The relevant part of config.log (which explains why the test is
> ? failing)


I think I know the problem. As far as I can see hosts pkg-config will
be used, not BR one. ofono could find dbus and capng first after I
installed these packages on my host.

Yegor
