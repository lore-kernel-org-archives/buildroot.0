From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 15:41:45 +0200
Subject: [Buildroot] [PATCH 0/11 v5] Some download-related changes
 (branch yem/check-downloads)
In-Reply-To: <20140601133822.GG3430@free.fr>
References: <cover.1399204808.git.yann.morin.1998@free.fr>
 <20140601152441.045ec06b@free-electrons.com>
 <20140601133822.GG3430@free.fr>
Message-ID: <20140601154145.6fa6e4ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 1 Jun 2014 15:38:22 +0200, Yann E. MORIN wrote:

> Well, that's basically what happens in patch 8/11 (as you noticed
> already!).

Yes, right!

> You said on IRC:
>     at least for the wget download method, it's still wrong.
> 
> What Arnout said is that we want to create the temporary file in the
> same filesystem as for the final file.
> 
> That can only be true if we create the temp file in the same directory
> as the final file, as we have no info about the mountpoints.
> 
> But, as you said you want it to work even for parallel downloads, we
> will have to do a bit of a gymnastic to avoid to builds in different
> directories clobbering each others temp files.
> 
> So, of course, two parallel wget will step on each other's temp file.
> Ditto for the other downloaders.
> 
> So, we must create temp files and temp clones with unique names. I'll
> use mktemp for that.

Ah, yes, indeed, makes sense. It will work even if $(O) and $(DL_DIR)
are in separate file systems *and* provide the atomicity guarantees
that we need to use the same $(DL_DIR) for several parallel builds.

Looks good. I guess you'll respin the series with this change?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
