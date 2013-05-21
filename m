From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Tue, 21 May 2013 23:10:40 +0200 (CEST)
Subject: [Buildroot] Startup files numbering policy
In-Reply-To: <20130521221707.64d0815d@skate>
References: <1882993282.1023650.1369164262752.JavaMail.root@advansee.com>
 <430640706.1023684.1369164662782.JavaMail.root@advansee.com>
 <20130521221707.64d0815d@skate>
Message-ID: <537887127.1024616.1369170640439.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Tuesday, May 21, 2013 10:17:07 PM, Thomas Petazzoni wrote:
> Dear Beno?t Th?baudeau,
> 
> On Tue, 21 May 2013 21:31:02 +0200 (CEST), Beno?t Th?baudeau wrote:
> 
> > So far, BuildRoot has always used arbitrary Sxx numbers for the startup
> > files in
> > /etc/init.d/, e.g. S91smb in the samba package. Depending on each board
> > needs,
> > these numbers might be more or less appropriate for the startup order. Do
> > you
> > plan to add a mechanism to choose non-default custom numbering for those
> > scripts, or do you have a policy such as "It's up to each board to run
> > post-build scripts for such adjustments."?
> 
> I don't think we will want a mechanism to customize that, a post-build
> script is definitely appropriate.
> 
> However, we could clarify, adjust and/or document the current numbering
> policy, in order to make it clearer and more usable.
> 
> What specific problems do you have with the current numbering? Would a
> change in the numbering policy solve those problems?
> 
> So far, in the projects I've done, I don't remember having issues with
> the numbering policy used by Buildroot. I just added my own scripts, at
> different levels, and the scripts installed by Buildroot were living
> enough "free" numbers at various stages in the initialization to do
> whatever I needed. But it is very well possible that I didn't come
> across the cases you have in your project.

I don't have the exact use case in mind, but I have encountered this issue at
least once on a project with many startup scripts. The board needed many custom
startup scripts in its target skeleton, and in the end there was a collision
with BuildRoot's predefined startup script numbers that broke the expected
startup order. It was also unclear how to number the board-specific startup
scripts before launching the 1st build, and without a list there is always the
risk of a collision when enabling a new package.

I don't think that changing the current script numbering would be a solution,
because that could cause an issue for someone else. There could perhaps be a
document listing the numbering of the startup scripts installed by all BuildRoot
packages. That would make it clear how to assign a new startup script number,
what to expect from BuildRoot, and how to perform custom adjustments (i.e.
post-build script).

Best regards,
Beno?t
