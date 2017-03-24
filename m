From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 24 Mar 2017 08:52:19 +0100
Subject: [Buildroot] Howto change group of /dev/snd when using devtmpfs
In-Reply-To: <8bf1cfe0-1811-d0b9-69f6-f26877a95f06@mind.be>
References: <1490289749.16805.1.camel@embedded.rocks>
 <8bf1cfe0-1811-d0b9-69f6-f26877a95f06@mind.be>
Message-ID: <1490341939.3829.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, 2017-03-23 at 21:38 +0100, Arnout Vandecappelle wrote:
> 
> On 23-03-17 18:22, J?rg Krause wrote:
> > Hi,
> > 
> > I need some help to get the group changed for "/dev/snd" when using
> > devtmpfs. By default, "/dev/snd" and subnodes have the following
> > settings:
> > 
> > """
> > # ls -l /dev/snd/
> > total 0
> > crw-------????1 root?????root??????116,???0 Jan??1??1970 controlC0
> > crw-------????1 root?????root??????116,??16 Jan??1??1970 pcmC0D0p
> > crw-------????1 root?????root??????116,??25 Jan??1??1970 pcmC0D1c
> > crw-------????1 root?????root??????116,??33 Jan??1??1970 timer
> > """
> > 
> > I'd like to change the group to audio.
> 
> ?That's exactly what mdev and (e)udev are meant for. devtmpfs creates
> device
> nodes automatically but only with defaults (default names, default
> user/group,
> default permissions). If you want to change anything, you need a
> helper.
> 
> ?Of course, you can also write a script as /sbin/hotplug. But then I
> wonder why
> not use mdev - it hardly increases the busybox size.

Thanks! I tried mdev before, but it didn't work. After some digging I
found that the mdev.conf in Buildroot is outdated, because the syntax
changed?[1] in Busybox 1.23.

Strange, that nobody noticed this for two years...

[1] http://lists.busybox.net/pipermail/busybox/2015-February/082297.htm
l

J?rg
