From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 07 Dec 2011 06:50:29 -0300
Subject: [Buildroot] [PATCH] Rework of shutdown policy in inittab
In-Reply-To: <CAJhJPsUpmAutWDTyfSjerHReX9CLXVW8fCzdR1vgOHL1qUJqug@mail.gmail.com>
References: <1314966310-4360-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAAXf6LU1QuFL=pOD09e0dzA1ntsauaFSD2qUr-OPEbmXB74fyw@mail.gmail.com>
 <CAJhJPsUpmAutWDTyfSjerHReX9CLXVW8fCzdR1vgOHL1qUJqug@mail.gmail.com>
Message-ID: <9a1c3d148cb1f34974f5a5791cfecc42@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07.12.2011 04:26, Kelvin Cheung wrote:

> Pherhaps solution 1 is simple and feasible.
> Most Sxxxx scripts under dir package provide stop() function
> currently.
> And by this policy, the programs/daemons are just what should be
> killed, which are started at startup.
>  We do not need to maintain consistency between Sxxxx and Kxxxx.

I'd go for option 2. it results in a saner behaviour if people don't 
handle the stop condition as Thomas pointed out.
Otherwise you can get nasty messages from console when people for 
example try to mount some filesystem in a custom script that don't make 
a disctintion between start/stop and things like that.
Regards.
