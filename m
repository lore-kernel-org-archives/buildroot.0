From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2015 17:38:23 +0200
Subject: [Buildroot] [PATCH] package/dropbear: fix when readlink is
	busybox'
In-Reply-To: <20150824153234.GA3619@free.fr> (Yann E. MORIN's message of "Mon, 
 24 Aug 2015 17:32:34 +0200")
References: <1439925953-5345-1-git-send-email-yann.morin.1998@free.fr>
 <87pp2czptc.fsf@dell.be.48ers.dk> <20150824153234.GA3619@free.fr>
Message-ID: <878u90zogg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> Looking at the recent changes to S50dropbear, isn't it quite noisy with
 >> a RO rootfs? I would imagine those rm and mkdir calls complain with
 >> RO. Perhaps we should add 2>/dev/null to them?

 > Well, on a RO filesystem, we'd create /var/run/dropbear on each boot,
 > and thus regenerate keys on each boot. This means keys from such a
 > device can not really be trusted.

Well, with a RO filesystem you only have the option to either generate
at each boot or bake in a hardcoded host key in the rootfs. Neither is
really great for security.

 > So I'd prefer we get the error messages, as a clue to the user that
 > something is wrong. Maybe we could have had an explicit message, yes.

Those fairly obscure messages are imho not really helpful - But on the
other hand I'm not sure a dedicated message is really warranted.

-- 
Venlig hilsen,
Peter Korsgaard 
