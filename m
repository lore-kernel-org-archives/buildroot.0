From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 15 Jul 2015 10:07:52 -0400
Subject: [Buildroot] [PATCH 1/2] pkg-download: add optional destination
	filename
In-Reply-To: <20150715003949.7506a433@free-electrons.com>
References: <1429462679-4769-1-git-send-email-fhunleth@troodon-software.com>
 <20150715003949.7506a433@free-electrons.com>
Message-ID: <CA+-urNSO_UX6zfMEmyPdrUJNne7NvGAQB9Fw5Oq11xpRz61Sxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 14, 2015 at 6:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Frank Hunleth,
>
> On Sun, 19 Apr 2015 12:57:58 -0400, Frank Hunleth wrote:
> > This adds an optional parameter to the DOWNLOAD macro so that it's
> > possible to specify a destination filename that's different from one
> > being downloaded.
> >
> > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> > ---
> >  package/pkg-download.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> This patch is still pending in patchwork, but the discussion in PATCH
> 2/2 didn't really reached a conclusion other than the fact that you had
> a very specific case of a patch being updated by upstream without being
> renamed, and that you were going to talk with upstream about this. We
> haven't heard from you about this specific problem since end of April,
> and anyway the proposed implementation wasn't matching our requirements.
>
> So I've marked this patch as Rejected in patchwork. Of course, if you
> still have the issue, let's reopen the discussion and work on a proper
> solution for the problem.

Yes, this is the right answer. Thanks for closing the loop.

To summarize what happened between then and now, I traded messages
with people on the Intel Edison mailing list, but the responses took
about as long as my project. The change to maintain the kernel and
uboot sources outside of their massive Yocto tar ball is on their
"roadmap". That would get rid of the patch file naming conflicts that
started this whole patch series.

For me, I ended up copying the uboot and kernel patches to the local
BR tree for the project. Since I'm finished with the work on the
Edison, I don't have a need for the patch anymore. However, if others
run into issues with getting Buildroot to work on the Edison, I don't
mind digging up my notes and sharing.

Thanks,
Frank
