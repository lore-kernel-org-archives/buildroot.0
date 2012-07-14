From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 01:08:48 +0200
Subject: [Buildroot] [PATCH 1/1] skeleton: add default login port to
 /etc/securetty
In-Reply-To: <5001E2B2.6070509@mind.be>
References: <1342149545-10417-1-git-send-email-roylee17@gmail.com>
 <5001A4D3.1030802@mind.be> <20120714191530.539ca71c@skate>
 <5001E2B2.6070509@mind.be>
Message-ID: <20120715010848.0290501a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 14 Jul 2012 23:20:50 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   I wouldn't like that.  I often use the default skeleton but override e.g.
> inittab in the post-build script.  I can't be bothered with setting
> BR2_TARGET_GENERIC_GETTY_PORT to empty.  So the result is
> that a /etc/securetty would be created which bears no relation with
> the actual login ports defined in inittab...  And all this happens on the
> sly, without any consent from the user or warning in the config menus.
> 
>   Bottom line: automatically adding BR2_TARGET_GENERIC_GETTY_PORT
> to securetty is OK for me, but emptying it is not.

Hmm, ok. But if you're modifying the inittab through a post-build
script, we could also say that it's your responsibility to also
adjust /etc/securetty accordingly, no?

I don't have a strong opinion here, just trying to find the right
balance.

>   BTW I can't think of many circumstances where securetty makes sense
> on an embedded system to begin with: why would you allow shell login
> on some port but not root login?

Is removing /etc/securetty sufficient? Both for Busybox getty, the
full-featured getty, and things like dropbear, openssh, telnet and al?
I think telnet needs pts/[0-n] to be in /etc/securetty otherwise it
doesn't allow root login.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
