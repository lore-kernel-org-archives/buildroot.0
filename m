From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 15:35:52 +0200
Subject: [Buildroot] [PATCH] cutelyst: new package
In-Reply-To: <CACo8zOfCUVXp2AGbcrFDeCvaeQGNv9_4rdsr6imRo+YYJN6iyw@mail.gmail.com>
References: <20180717204613.22028-1-dantti12@gmail.com>
 <20180718125949.04f926f8@windsurf>
 <CACo8zOfCUVXp2AGbcrFDeCvaeQGNv9_4rdsr6imRo+YYJN6iyw@mail.gmail.com>
Message-ID: <20180718153552.6b91b361@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jul 2018 10:24:53 -0300, Daniel Nicoletti wrote:

> > This way, it is clear that it is a new iteration, and we know what has
> > changed since the previous iteration.  
> Ok, I'm not very used to send patches with format-patch/send-email

No problem at all, it's OK to begin with some topics and learn more.
We're happy with having contributions from newcomers and share what we
believe are best practices to contribute to Buildroot (note that those
best practices also apply to a number of other embedded Linux related
open-source projects: Linux kernel, U-Boot, etc.).

> > You forgot to add an entry to the DEVELOPERS file, so I've added that.  
> Hmm speaking of that, do I need to be subscribed to this buildroot list?
> It's quite high traffic, so if I can subscribe/update package/unsubscribe
> it would work better for me.

You can also remain subscribed all the time, but disable mail delivery
(go to the mailman page, you can adjust your subscription options).
This way, you don't receive e-mails from the list, but you can post to
the list without subscribing/unsubscribing each time.


> > This is because it needs SSL support in Qt. So I've added a "select
> > BR2_PACKAGE_OPENSSL" to make sure SSL support is present in Qt.  
> hmm strange, I added a bunch of ifdefs to cutelyst for it to build without
> SSL support but I guess I missed some, will try again. I guess in the
> spirit of buildroot images trying to be minimal it could be a good thing.

Just do a minimal build with just qt5+cutelyst, and openssl disabled
(you will have to remove the select BR2_PACKAGE_OPENSSL line from
cutelyst/Config.in of course). You'll see the build fail.

> > I've fixed those three issues, and applied your patch. Once again,
> > thanks for your contribution!  
> You welcome, loving this project :)

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
