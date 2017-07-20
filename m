From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 23:11:29 +0200
Subject: [Buildroot] [PATCH v8 03/10] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <53db2a2d-2211-b173-8e37-19f55afe49de@mind.be>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-4-git-send-email-wg@grandegger.com>
 <20170720224906.301f524a@windsurf>
 <53db2a2d-2211-b173-8e37-19f55afe49de@mind.be>
Message-ID: <20170720231129.35f31a46@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 23:05:59 +0200, Arnout Vandecappelle wrote:

> >>  support/scripts/fix-rpath | 133 ++++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 133 insertions(+)
> >>  create mode 100755 support/scripts/fix-rpath  
> > 
> > I've applied to master, after removing trailing slashes.  
> 
>  Which trailing slashes?

Gaah, I wanted to say "trailing spaces".

> > This is a little bit disturbing, so I believe it should be fixed in a
> > follow-up patch.  
> 
>  Right! That's because the "if ${PATCHELF} ..." just fails and the error is
> redirected to /dev/null.
> 
>  Better check if ${PATCHELF} is executable somewhere in the beginning.
> 
>  However, there is never a guarantee. If e.g. it would be missing a shared
> library, it would still fail in the same way. To be really sure, you'd have do
> e.g. call patchelf on itself to verify it is actually working.

Perhaps patchelf --help is sufficient?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
