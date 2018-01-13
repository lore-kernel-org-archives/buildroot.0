From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jan 2018 12:28:43 +0100
Subject: [Buildroot] [PATCH] support/dockerfile: add directives to run
 as non-root
In-Reply-To: <20180112225408.4a91ca0b@windsurf.lan>
References: <20180106152833.10111-1-yann.morin.1998@free.fr>
 <20180112225408.4a91ca0b@windsurf.lan>
Message-ID: <20180113112843.GF3226@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-01-12 22:54 +0100, Thomas Petazzoni spake thusly:
> On Sat,  6 Jan 2018 16:28:33 +0100, Yann E. MORIN wrote:
> > Currently, our jobs on the gitlab-ci infra are running as root, which is
> > problematic for two reasons:
> > 
> >   - this is not the usual way Buildroot is built;
> >   - it may miss issues where running as non-root is problematic.
> > 
> > So, complement our Dockerfile with directives to add a new user and run
> > everything as that user, as demonstrated by this build job:
> >     https://gitlab.com/ymorin/buildroot-ci/-/jobs/46929562
> > 
> > Additional, enforce an UTF-8 locale while running.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  support/docker/Dockerfile | 7 +++++++
> >  1 file changed, 7 insertions(+)
> 
> Applied to master, thanks. Could you update the official Buildroot
> Docker image, so that the Gitlab CI testing benefits from this ?

I would if I could, but I am not supposed to have push-access to that
image, have I?

Regards,
Yann E. MORIN.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
