From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 18 Jan 2021 21:40:09 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/zstd: build multithreaded
 library if supported
In-Reply-To: <20210117153052.0d4448ff@windsurf.home>
References: <20201204095703.4714-1-patrickdepinguin@gmail.com>
 <20210117153052.0d4448ff@windsurf.home>
Message-ID: <CAAXf6LUEYZApE5bsFKx7cysNnQj+GNtpU9traCa-AYn=+i05XA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

El dom, 17 ene 2021 a las 15:30, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> On Fri,  4 Dec 2020 10:57:01 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > libzstd.so is built without multi-threading support by default.
> > The 'HAVE_THREAD' flag is not respected by lib/Makefile, only by
> > programs/Makefile.
> >
> > Use the %-mt recipe in lib/Makefile to enable multithreading.
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > ---
> > v2: split off of next patch
>
> Applied to master, thanks. It would be good to have a patch that
> enables the multi-threading for the host variant of zstd.
>

Thanks, I just sent such patch for host-zstd.

I learned that upstream has added a clean way of building the zstd cli
programs against its own libzstd, currently in its 'dev' branch (not
yet released). This will provide an alternative implementation than my
2/2 patch.
With that new 'zstd-dll' target we can link both target and host zstd
dynamically. I have the Buildroot changes ready, but am waiting for a
new release of zstd (1.4.9 or 1.5.x ?).

Best regards,
Thomas
