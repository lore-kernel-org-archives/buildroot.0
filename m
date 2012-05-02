From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 May 2012 23:10:27 +0200
Subject: [Buildroot] buildroot Digest, Vol 71, Issue 9
In-Reply-To: <4FA1899E.1050408@essensium.com>
References: <mailman.5.1335960002.505.buildroot@busybox.net>
 <4FA1899E.1050408@essensium.com>
Message-ID: <20120502231027.198c48cc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sitjn,

If you want to contribute to the list, you should consider subscribing
to the list in non-digest mode, because replying to your digest
messages break the discussion threads in the list.

Le Wed, 02 May 2012 21:23:10 +0200,
Stijn Souffriau <stijn.souffriau@essensium.com> a ?crit :

> I can fix all the minor issues, no problem. For me, the only two bigger 
> issues are:
> 
>   - uClibc support: glibc specific headers seemed to be needed in order 
> to build. Maybe I can remedy that but I'm not sure. Can't you ignore 
> this for now so that I or somebody else can add uClibc support later? If 
> it's a problem I'll look into it but my time is limited.

Ok, we can probably do this. In general, the maintainer (Peter
Korsgaard), doesn't like a lot to have glibc-specific packages, but if
you post the patches, maybe others can test and see if the uClibc
compatibility issue is complex or not.

>   - host-gnupg: I needed it to sign file system images (useful for 
> remote upgrades). I'm not sure if buildroot will always build host-gnupg 
> and if this is a problem for you, if so I can always make it optional it 
> with yet another config option.

Ok. But why not using the gnupg provided by the Linux distribution for
this? My vision is that we should generally only add host packages if:

 * Either they are used as build dependencies of target packages;

 * Or they are not easily available in Linux distributions, or are
   really important to have in BSP for development boards (this
   includes tools like AT91 SAM-BA, or openocd)

Of course, such a proposal remains to be discussed, but I don't think
we want to replace what the Linux distribution is doing. Before
reworking your patches about this, please wait for other members of the
Buildroot community to speak up: my opinion is not authoritative.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
