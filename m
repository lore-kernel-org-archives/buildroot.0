From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Sep 2015 10:19:24 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <20150904101128.4206779d@free-electrons.com>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <20150904101128.4206779d@free-electrons.com>
Message-ID: <55E9540C.9060000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-09-15 10:11, Thomas Petazzoni wrote:
> Yann,
> 
> On Fri,  4 Sep 2015 01:47:42 +0200, Yann E. MORIN wrote:
> 
>> +config BR2_ROOTFS_MERGED_USR
>> +	bool "Use symlinks to /usr for /bin, /sbin and /lib"
> 
> Shouldn't we make this a blind option? I.e just do merged usr for
> systemd always, and never do it for !systemd.

 I will always turn this option on, even in non-systemd, because it makes for a
better environment. See the Fedora document for a long explanation why split
/usr is just legacy baggage. Other parts of your system will also work better
when this option is turned on - no more confusion between busybox installing
something in /bin and the full package putting it in /usr/bin. No more worries
about a shebang being correct.

 So no, I don't want this to be hidden.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
