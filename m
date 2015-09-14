From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Sep 2015 23:26:12 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <8737yg3dt0.fsf@dell.be.48ers.dk>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <20150904101128.4206779d@free-electrons.com> <55E9540C.9060000@mind.be>
 <20150904163121.GD4540@free.fr> <8737yg3dt0.fsf@dell.be.48ers.dk>
Message-ID: <55F73B74.1020708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-15 23:12, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
>>> I will always turn this option on, even in non-systemd, because it makes for a
>  >> better environment. See the Fedora document for a long explanation why split
>  >> /usr is just legacy baggage. Other parts of your system will also work better
>  >> when this option is turned on - no more confusion between busybox installing
>  >> something in /bin and the full package putting it in /usr/bin. No more worries
>  >> about a shebang being correct.
>  >> 
>  >> So no, I don't want this to be hidden.
> 
>  > Ditto, I do not want this to be hidden. I want to have the choice of
>  > using a merged-usr even without systemd (and I even have a use-case in
>  > my head for that).
> 
> And as explained, we might even want to default it to y in the future,
> just because it is simpler when you have a single rootfs.
> 
> Is there any reason why we explicitly add the symlinks for /bin / /sbin
> and /lib and don't just do:
> 
> ln -sf . usr

 Well, in Fedora I think the idea was that / could be an initramfs and /usr
would be mounted read-only. But since we don't directly support that use case,
making /usr a symlink would indeed be an option.

 However, I'm not really in favour of it. I don't see that it brings a lot of
benefit, other than reducing the number of symlinks from 3 to 1. But it does
create /share and /local which looks weird could potentially conflict with
existing user directories (e.g. a mountpoint for windows shares...). Also it
makes it more complicated for the user to implement a fedora-like mounted /usr.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
