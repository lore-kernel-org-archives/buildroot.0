From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jul 2015 18:47:27 +0200
Subject: [Buildroot] [PATCHv4] Makefile: fix performance regression
 casued by the umask handling
In-Reply-To: <55A83195.8080204@mind.be>
References: <1437085987-4512-1-git-send-email-yann.morin.1998@free.fr>
 <55A83195.8080204@mind.be>
Message-ID: <20150717164727.GB3637@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Guido, All,

On 2015-07-17 00:35 +0200, Arnout Vandecappelle spake thusly:
> On 07/17/15 00:33, Yann E. MORIN wrote:
> > From: Guido Mart?nez <guido@vanguardiasur.com.ar>
> > 
> > Commit bee5745c introduced an extra level of 'make' when the umask is
> > different from 0022. However, when several targets were specified on
> > the command line, a new make instance would be called for each target.
> > This introduces a huge performance overhead when many targets are
> > specified on the command line.
> > 
> > To fix this, use the same approach as used in the mkmakefile script:
> > an addition target on which the MAKECMDGOALS depend, so that this
> > target is run only once.
> > 
> > Note that the mkmakefile script contains a special exception for
> > Makefile, because the Makefile in the output directory is generated.
> > Since the top-level Makefile is not generated, this exception is not
> > needed here.
> > 
> > While we're at it, also fix the whitespace in the UMASK assignment.
> > 
> > Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > [yann.morin.1998 at free.fr: aggregate patches from Arnout and Guido]
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Someone finally got it right :-)

Almost... I made a typo in the subject... ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
