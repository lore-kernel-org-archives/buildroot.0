From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Mar 2017 21:38:48 +0100
Subject: [Buildroot] Howto change group of /dev/snd when using devtmpfs
In-Reply-To: <1490289749.16805.1.camel@embedded.rocks>
References: <1490289749.16805.1.camel@embedded.rocks>
Message-ID: <8bf1cfe0-1811-d0b9-69f6-f26877a95f06@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-03-17 18:22, J?rg Krause wrote:
> Hi,
> 
> I need some help to get the group changed for "/dev/snd" when using
> devtmpfs. By default, "/dev/snd" and subnodes have the following
> settings:
> 
> """
> # ls -l /dev/snd/
> total 0
> crw-------    1 root     root      116,   0 Jan  1  1970 controlC0
> crw-------    1 root     root      116,  16 Jan  1  1970 pcmC0D0p
> crw-------    1 root     root      116,  25 Jan  1  1970 pcmC0D1c
> crw-------    1 root     root      116,  33 Jan  1  1970 timer
> """
> 
> I'd like to change the group to audio.

 That's exactly what mdev and (e)udev are meant for. devtmpfs creates device
nodes automatically but only with defaults (default names, default user/group,
default permissions). If you want to change anything, you need a helper.

 Of course, you can also write a script as /sbin/hotplug. But then I wonder why
not use mdev - it hardly increases the busybox size.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
