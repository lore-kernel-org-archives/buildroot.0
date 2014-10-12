From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 14:56:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: new package
In-Reply-To: <CA+TH9VmmxYDhPg7+LE73S3c-hXTB1h-aVP-_8MuBWqH5FvEkAg@mail.gmail.com>
References: <1413100208-12776-1-git-send-email-angelo.compagnucci@gmail.com>
 <1413100208-12776-3-git-send-email-angelo.compagnucci@gmail.com>
 <20141012102554.39aa340a@free-electrons.com>
 <CA+TH9VmaCh+6X7CQVWPctUQTz1mLZyrXB1FyAObNceO_9=BeWQ@mail.gmail.com>
 <20141012110213.5b7c6c8a@free-electrons.com>
 <CA+TH9V=5MVzboiyLDxuuJwXJ=v-t9eZ-8kPF0q=AhXtDsS-1Rg@mail.gmail.com>
 <20141012114519.30aa9822@free-electrons.com>
 <CA+TH9VmmxYDhPg7+LE73S3c-hXTB1h-aVP-_8MuBWqH5FvEkAg@mail.gmail.com>
Message-ID: <20141012145609.447bbbc7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Sun, 12 Oct 2014 12:06:35 +0200, Angelo Compagnucci wrote:

> >> This way the dependency is met only when MONO_ASSEMBLY_INCLUDED.
> >> By the way, I'll remove this logic, make 4.5 as default version and if
> >> nothing selected, I'll default evenly on 4.5.
> >
> > Ok, right. Then don't add a condition around the host-autotools-package
> > call, this is useless.
> 
> OK! So it the end I can keep that logic? I think it's valuable!
> Obviously I can add a note on Config help.

 * You should make sure one of the Runtime version is enabled by
   default by adding a 'default y'

 * You should use the configure options of Mono to enable/disable the
   appropriate runtime versions, which will remove the need for this
   MONO_ASSEMBLY_INCLUDED variable.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
