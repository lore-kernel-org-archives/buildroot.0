From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jun 2013 08:24:22 +0200
Subject: [Buildroot] [PATCH] gpsd: make init script optional
In-Reply-To: <20130616183051.GZ16699@lukather>
References: <1371382468-5838-1-git-send-email-spdawson@gmail.com>
 <20130616130904.GD3495@free.fr>
 <CAHt8ZCPnR+9SG=rDfyzeLQcbT=UWAwhun4PJ31Ohk=60=0+a7g@mail.gmail.com>
 <20130616183051.GZ16699@lukather>
Message-ID: <51BFFD16.7030009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/06/13 20:30, Maxime Ripard wrote:
> On Sun, Jun 16, 2013 at 04:59:06PM +0100, Simon Dawson wrote:
>> Hi Yann, Maxime.
>>
>> On 16 June 2013 14:09, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>> Why would one not want the init script? Is this because of systemd? If so,
>>> then you should use GPSD_INSTALL_INIT_SYSV and GPSD_INSTALL_INIT_SYSTEMD
>>> as pointed out by Maxime.
>>>
>>> This ensures the init script will only be installed if a SysV init
>>> scheme is used (and conversely for the systemd unit).
>>>
>>> Otherwise, please expand on why not wanting the init script should be
>>> configurable at all.
>>
>> There are other possibilities, beyond SysV and systemd: I've
>> previously run gpsd and other managed services using daemontools and
>> runit. My present use case has udev kicking off gpsd in response to
>> hotplug events for a USB GPS device.
>>
>> I seem to always end up having to remove the gpsd SysV init script in
>> my post-build script; hence the desire for a configuration option.
>
> Maybe you can add a BR2_INIT_NONE choice here then to not copy all the
> install scripts.

  There are just a few daemons that you'd want to run from hotplug, most 
of them would still run from init.d.

  But I really would like a better way to manage the services you want to 
run in init.d, and especially their order. I can't come up with a good 
solution, though, so I'm not actively complaining :-)

  I agree with Peter that having an option for each package is not a good 
solution.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
