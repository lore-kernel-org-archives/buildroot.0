From: Matthew Weber <matthew.weber@collins.com>
Date: Mon, 25 Jan 2021 15:30:42 -0600
Subject: [Buildroot] [PATCH 1/2] package/uboot-tools: resolve uboot env
 source file error
In-Reply-To: <20210125221537.5cb4dbdd@windsurf.home>
References: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
 <20210125221537.5cb4dbdd@windsurf.home>
Message-ID: <CANQCQpbmPKCP74bEZHfcAxL33j+ATmgOe6m4eMPQRKS=9A=3hA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Jan 25, 2021 at 3:16 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 25 Jan 2021 08:57:41 -0600
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > From: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> >
> > If Target u-boot is not available, the host build of uboot-tools
> > requires user to provide u-boot environment source file.
> > This change resolves a missing parentheses and updates the comment
> > for the same.
> >
> > Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  package/uboot-tools/uboot-tools.mk | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Applied to master, thanks. I think this bug really shows we need some
> unit tests for this uboot-tools package functionality, in
> supporting/testing/.

I did add autobuilder testing of this feature but it didn't do a case
for when the file isn't provided....
https://github.com/buildroot/buildroot/blob/master/utils/genrandconfig#L304

Matt
