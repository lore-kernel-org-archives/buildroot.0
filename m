From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 May 2013 22:17:07 +0200
Subject: [Buildroot] Startup files numbering policy
In-Reply-To: <430640706.1023684.1369164662782.JavaMail.root@advansee.com>
References: <1882993282.1023650.1369164262752.JavaMail.root@advansee.com>
 <430640706.1023684.1369164662782.JavaMail.root@advansee.com>
Message-ID: <20130521221707.64d0815d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Tue, 21 May 2013 21:31:02 +0200 (CEST), Beno?t Th?baudeau wrote:

> So far, BuildRoot has always used arbitrary Sxx numbers for the startup files in
> /etc/init.d/, e.g. S91smb in the samba package. Depending on each board needs,
> these numbers might be more or less appropriate for the startup order. Do you
> plan to add a mechanism to choose non-default custom numbering for those
> scripts, or do you have a policy such as "It's up to each board to run
> post-build scripts for such adjustments."?

I don't think we will want a mechanism to customize that, a post-build
script is definitely appropriate.

However, we could clarify, adjust and/or document the current numbering
policy, in order to make it clearer and more usable.

What specific problems do you have with the current numbering? Would a
change in the numbering policy solve those problems?

So far, in the projects I've done, I don't remember having issues with
the numbering policy used by Buildroot. I just added my own scripts, at
different levels, and the scripts installed by Buildroot were living
enough "free" numbers at various stages in the initialization to do
whatever I needed. But it is very well possible that I didn't come
across the cases you have in your project.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
