From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 16 Aug 2019 19:26:33 +0530
Subject: [Buildroot] [PATCH v3 1/3] autobuild-run: maintain consistency
 in diffoscope command
In-Reply-To: <20190813161944.1610eb65@windsurf.home>
References: <20190813041206.20715-1-itsatharva@gmail.com>
 <20190813161944.1610eb65@windsurf.home>
Message-ID: <CABM+sgrRD5AsCe2fgawfzSxayn+xjriCjF7_9zmr3-MuE_6LMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 13, 2019 at 7:49 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Atharva,
>
> On Tue, 13 Aug 2019 09:42:04 +0530
> Atharva Lele <itsatharva@gmail.com> wrote:
>
> > Since we are outputting to two file types, we can't just redirect stdout.
> > Instead, we use diffoscope's ability to output to a file to maintain
> > consistency in the command.
> >
> > This patch also fixes a typo in the command. For text output,
> > it should be reproducibility_results_txt instead of
> > reproducibility_results_text.
> >
> > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> > ---
> >  scripts/autobuild-run | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Applied to buildroot-test, thanks. However, the code running diffoscope
> is still executed inside a with open(reproducible_results, 'w') as
> diff, which is no longer needed, as diffoscope outputs directly to the
> reproducible_results file.
>
> You should move that this file opening inside the else condition which
> is used when diffoscope is not available.
>

Oh right, slipped my mind. I'll send a patch to fix it!

Apologies for the late reply, but your email got buried between
message delivery failures since emails to Yann are bouncing.

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thank you for the review!

-- 
Regards,
Atharva Lele
