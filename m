From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 15 Jul 2015 23:30:21 +0200
Subject: [Buildroot] Buildroot enhancement proposal: on starting a GUI
 service at boot
In-Reply-To: <20150715222602.67784238@free-electrons.com>
References: <CA+TH9VkiLkeg+9LWedL=2GBkAN4iAK1eO0+cs0_QW4qp7SS1qg@mail.gmail.com>
 <20150715222602.67784238@free-electrons.com>
Message-ID: <CA+TH9V=gL_H07QutRH5TZsDWeL5Bzvf4S0cxxXfv0hqQgQVeUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-07-15 22:26 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Angelo,
>
> On Wed, 15 Jul 2015 17:21:13 +0200, Angelo Compagnucci wrote:
>> One of the common use-case for an embedded system is to start a gui at
>> boot. Probably it will be the main point of interaction after all and
>> the most sensitive process in the whole system.
>>
>> I'm thinking on adding a custom option to set correctly a gui service
>> to be started at boot, something that will make easier for a buildroot
>> user to start a custom gui service at boot instead of fighting with
>> overlay and service scipts/files.
>>
>> Note that this gui service is different from a standard service: it
>> should be respawned if someting goes wrong and this cannot be done in
>> a normal busybox/systemv init script: for busybox/systemv it should be
>> added directly to /etc/inittab.
>>
>> Actually I'm more oriented in adding an option into "System
>> configuration": a string that will contain the command line to be
>> added as a service. The matter is to individuate which init system is
>> in use and acting accordingly: adding a line in /etc/inittab for
>> busybox and systemv or adding a service file for systemd.
>>
>> Aside from technical difficulty which is none, what could be the best
>> way to implement such behaviour? Is it a desirable feature for
>> buildroot?
>> If yes, what is the best approach to have it accepted, a "package", an
>> option, where?
>
> I don't really understand what would be the usefulness of such a thing.
> The mechanism to start a "GUI service" highly depends on which
> graphical library you're using. Starting a Qt on framebuffer
> application will be very different from starting an application under
> X.org.
>
> To me, this is exactly the sort of things that is so system-specific
> that it belongs to a project-specific rootfs overlay. You're saying
> "fighting with overlay and service scripts/files", but I don't really
> see where a "fight" is needed. A rootfs overlay is dead simple to us,
> and if a Buildroot user is not capable of using a rootfs overlay, he
> will probably not be capable of doing lots of other tasks/tweaks needed
> to get his embedded Linux system running correctly.

Yes, obviously. But also configuring the network could have many many
options and this is exactly for that reason that we have a simple
option to enable dhcp easily. It is simple, it is handy and it works.
Before that option was included, the first thing I did for every new
project was to create an overlay with /etc/network/interface and the
dhcp enabled.
I think that a gui service option should not cover all possible cases,
only the simplest one: having a supervised xinit that calls your
application and restarts it if crashes. Handy or not ?!

Probably your are right on the fact that if a user doesn't know how to
make a proper overlay probably he/she is using the wrong tool, but
honestly, having such an handy option could benefit many.

Sincerely, Angelo.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
