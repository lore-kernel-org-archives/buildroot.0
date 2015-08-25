From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Aug 2015 20:48:47 +0200
Subject: [Buildroot] [PATCH] package/dropbear: fix when readlink is
	busybox'
In-Reply-To: <20150824154308.GE3619@free.fr> (Yann E. MORIN's message of "Mon, 
 24 Aug 2015 17:43:08 +0200")
References: <1439925953-5345-1-git-send-email-yann.morin.1998@free.fr>
 <87pp2czptc.fsf@dell.be.48ers.dk> <20150824153234.GA3619@free.fr>
 <878u90zogg.fsf@dell.be.48ers.dk> <20150824154308.GE3619@free.fr>
Message-ID: <87zj1fxkz4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> Well, with a RO filesystem you only have the option to either generate
 >> at each boot or bake in a hardcoded host key in the rootfs. Neither is
 >> really great for security.

 > Or, as some are doing (Paul for example), have /etc/dropbear point to a
 > R/W location (e.g. a persistent FS done at first boot) and have the
 > symlink overwritten by an overlay to point to that location.

 > Which is anyway something sane to do in most case of a R/O FS.

Sure, or simply union mount a persistent R/W FS on top of /etc so you
don't need to mess around with symlinks like I usually do.

 >> Those fairly obscure messages are imho not really helpful - But on the
 >> other hand I'm not sure a dedicated message is really warranted.

 > Maybe something along the lines of;

 >     I have no persistent location to store SSH host keys.
 >     I will generate new ones on each boot.
 >     Are you sure that's what you wanted to do?

I don't feel strongly about it. If you think it is needed then that's
fine by me. I think it sounds a bit odd to use the 'I' form, so perhaps
something like this instead:

No persistent location to store SSH host keys. New keys will be
generated at each boot. Are you sure this is what you want to do?

And perhaps the message should contain hints about how to fix this?

-- 
Venlig hilsen,
Peter Korsgaard 
