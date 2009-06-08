From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 8 Jun 2009 17:26:48 +0200
Subject: [Buildroot] [PATCH 2/2] Add target support for MXC based	devices
In-Reply-To: <87prdesr1a.fsf@macbook.be.48ers.dk>
References: <1244473080-8195-1-git-send-email-daniel@caiaq.de>
	<1244473080-8195-2-git-send-email-daniel@caiaq.de>
	<87prdesr1a.fsf@macbook.be.48ers.dk>
Message-ID: <20090608152648.GL29236@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 08, 2009 at 05:07:13PM +0200, Peter Korsgaard wrote:
>  Daniel> Devices based on Freescale's MXC SoCs need some extra
>  Daniel> attention to start the gettys from init. In particular, the
>  Daniel> /dev/ttymxc0 inode needs to be created and added to inittab
>  Daniel> and securetty.
> 
> Why are you using the armltd stuff with a freescale board? It would
> imho be nicer to just add the ttymxcX nodes to the serial console
> selection of target/generic (BR2_TARGET_GENERIC_GETTY).

Ok, that's also possible.

> On a related note, I think the /etc/securetty files are more trouble
> than they are worth - We should probably remove the feature from the
> default busybox configs.

... or add ttymxc0 unconditionally to securetty. It doesn't really harm
others.

I didn't want to touch any generic files in my first approach, but
you're right - the changeset looks much cleaner now.

Thanks,
Daniel
