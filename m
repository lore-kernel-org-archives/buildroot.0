From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Fri, 29 May 2015 16:54:45 -0500
Subject: [Buildroot] [PATCH v3 1/1] package/mtd: add patch to fix host
 build error with gcc 5.1
In-Reply-To: <1432928349.3676.3.camel@embedded.rocks>
References: <1432636689-26907-1-git-send-email-joerg.krause@embedded.rocks>
 <1432928349.3676.3.camel@embedded.rocks>
Message-ID: <20150529215445.GA597@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Fri, May 29, 2015 at 09:39:09PM +0200, J?rg Krause wrote:
> Hi all,
> 
> On Di, 2015-05-26 at 12:38 +0200, J?rg Krause wrote:
> > host-mtd build fails with gcc 5.1:
> >   error: redefinition of ?hashtable_iterator_key?
> >   error: redefinition of ?hashtable_iterator_value?
> > 
> > Indeed, both functions are defined twice - once in the header and 
> > once in the
> > source file. This is permitted in C11 (and maybe in C99).
> > 
> > Add a patch sent to upstream:
> > https://patchwork.ozlabs.org/patch/467254/
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Tested-by: Doug Kehn <rdkehn@yahoo.com>

> > ---
> > Changes v2 -> v3:
> >   - Add Sob and URL to patch description (Baruch Siach)
> > 
> > Changes v1 -> v2:
> >   - Use (identical) patch sent upstream
> > ---
> 
> Patch is accepted upstream now. I suggest to add this patch to 2015.05.

Tested on Arch Linux host with GCC 5.1.0 and target
arm-buildroot-linux-gnueabihf toolchain.  Buildroot master
a4a7aeed539631a91cae2c00dec4d20ccc6dda31.

Regards,
...doug
