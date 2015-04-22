From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 00:18:15 +0200
Subject: [Buildroot] Towards 2015.05-rc1
In-Reply-To: <20150419230245.64cf1410@free-electrons.com>
References: <20150419220053.2c1d5b62@free-electrons.com>
 <XnsA481E23CAF8E0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150419230245.64cf1410@free-electrons.com>
Message-ID: <55381E27.4020502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/19/15 23:02, Thomas Petazzoni wrote:
> Bernd,
> 
> On Sun, 19 Apr 2015 22:14:24 +0200, Bernd Kuhls wrote:
> 
>> if possible and time allows for all involved persons I would like to see the 
>> libudev series stuff in the next buildroot release. 
> 
> As far as I remember, someone needs to take over this series, no? I
> believe you originally authored it, then Yann took over, then Peter
> proposed to take over but did not resend it as far as I know.
> 
> On my side, I am still a bit concerned by the usefulness of this
> series. The use cases you have are anyway running big things (Kodi,
> etc.) so I'm not sure why running udevd or not makes a big difference.
> It does seem a lot of additional complexity for not such a huge
> benefit.

 Since udev rules are IMHO a lot more complicated than mdev rules and you
usually don't need that complexity in embedded systems, I think there really is
a case to be made for avoiding full udev. Of course, it's always possible to
remove the udev start script in a post-build script (which effectively makes
udev dead code), but it is definitely nice to know which packages will work
without udev running. So that's what I would like this libudev stuff to do.

 For example, I have one system that used to be based on mdev. Now we have to
add modem-manager to it, and modem-manager depends on udev. So I've enabled
udev, but now I have to replace the mdev rules with udev rules and I probably
also have to get rid of some of the default udev rules which are not appropriate.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
