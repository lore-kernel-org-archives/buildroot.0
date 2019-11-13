From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 12 Nov 2019 22:09:36 -0300
Subject: [Buildroot] [PATCH] configs/pc_x86_64_efi: add GPT partition
 table support.
In-Reply-To: <20191112231458.2c775567@windsurf>
References: <20190807135457.6201-1-alexandre.payen@smile.fr>
 <20191112231458.2c775567@windsurf>
Message-ID: <CAJ4jsadt96wNM-ig2+PHC+9Ns6u=eNrax3LUJXH0K3FmCzhAcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 12, 2019 at 7:14 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> (Resending with Carlos new e-mail address)
>
> On Wed,  7 Aug 2019 15:54:57 +0200
> Aalx <alexandre.payen@smile.fr> wrote:
>
> > From: Alexandre PAYEN <alexandre.payen@smile.fr>
> >
> > Based on commit fee29b05bb7db25e37c8a5175ce00dc712554edf[1].
> > It add the use of GPT partition table on pc_x86_64_efi.
> > This commit removed the use of genimage and replace it with a shell
> > script.
> >
> > Since version 11, genimage support GPT partition table.
> >
> > Tested in QEMU, not on a physical device.
> >
> > So:
> > - revert commit fee29b05bb7db25e37c8a5175ce00dc712554edf[1]
> > - add GPT support
> > - tweak shell script to add the correct UUID in genimage config.
> >
> > [1]: https://git.buildroot.net/buildroot/commit/?id=fee29b05bb7db25e37c8a5175ce00dc712554edf
> > [2]: https://git.buildroot.net/buildroot/commit/?id=79b8540d624ac4846ba341b1b9691eccacf0bc05
> >
> > Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
> > Cc: Carlos Santos <casantos@datacom.com.br>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> So, I kind of screwed up: I applied this version of the patch, taking
> into account the comments from Carlos, and then only realized that
> Carlos has sent a v2.
>
> From a quick look, Carlos v2 seems identical to the changes I've done
> to this v1.
>
> Carlos, could you double check that what I have applied is OK ? I did a
> test build, and booted under Qemu and it worked fine here.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

It's OK. The "set -e" at the beginning of board/pc/post-image-efi.sh
is nice to have but not essential.

-- 
Carlos Santos <unixmania@gmail.com>
