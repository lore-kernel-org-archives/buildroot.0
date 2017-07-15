From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 15 Jul 2017 13:32:10 -0400
Subject: [Buildroot] [PATCH 02/15] libwebsockets: support libressl
In-Reply-To: <20170715000852.6a2f8105@windsurf>
References: <20170714181537.17479-1-aduskett@gmail.com>
 <20170714181537.17479-2-aduskett@gmail.com>
 <20170715000852.6a2f8105@windsurf>
Message-ID: <CAFSsvmr2fwckB=5L01NEo8mtxz6PCww7eptYULmA0rQ-yXX5oQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Fri, Jul 14, 2017 at 6:08 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 14 Jul 2017 14:15:24 -0400, Adam Duskett wrote:
>
>> +else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
>> +LIBWEBSOCKETS_DEPENDENCIES += libressl host-openssl
>> +LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
>
> I'm wondering: do we want to mix using libressl on the target, and
> openssl on the host?
>
> I don't necessarily see a big problem with this, but I'm just
> wondering, since it might be a bit confusing.
>
I know you asked Arnout, but I wanted to throw my two cents in here
as well.

If I make libressl a host package, Libwebsockets compiles and works
just fine with it.  I would personally like to make libressl a host package as
well.

> Arnout, what do you think?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
