From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 23:12:59 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
	to be symlinks into /usr
In-Reply-To: <20150904163121.GD4540@free.fr> (Yann E. MORIN's message of "Fri, 
 4 Sep 2015 18:31:21 +0200")
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <20150904101128.4206779d@free-electrons.com>
 <55E9540C.9060000@mind.be> <20150904163121.GD4540@free.fr>
Message-ID: <8737yg3dt0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> I will always turn this option on, even in non-systemd, because it makes for a
 >> better environment. See the Fedora document for a long explanation why split
 >> /usr is just legacy baggage. Other parts of your system will also work better
 >> when this option is turned on - no more confusion between busybox installing
 >> something in /bin and the full package putting it in /usr/bin. No more worries
 >> about a shebang being correct.
 >> 
 >> So no, I don't want this to be hidden.

 > Ditto, I do not want this to be hidden. I want to have the choice of
 > using a merged-usr even without systemd (and I even have a use-case in
 > my head for that).

And as explained, we might even want to default it to y in the future,
just because it is simpler when you have a single rootfs.

Is there any reason why we explicitly add the symlinks for /bin / /sbin
and /lib and don't just do:

ln -sf . usr

-- 
Bye, Peter Korsgaard
