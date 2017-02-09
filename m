From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Feb 2017 23:00:37 +0100
Subject: [Buildroot] [PATCH 1/6] support/scripts: add script to test a
 package
In-Reply-To: <20170209225033.5b7a5868@free-electrons.com>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <085941ea3e9e9f34405ac10780d5c8aa2a6317aa.1486584734.git.yann.morin.1998@free.fr>
 <20170209225033.5b7a5868@free-electrons.com>
Message-ID: <20170209220037.GE3709@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-09 22:50 +0100, Thomas Petazzoni spake thusly:
> For some reason only your cover letter had PATCHv3, not the patches
> themselves. Could you check what happened?

Yup, I'll check...

> On Wed,  8 Feb 2017 21:15:24 +0100, Yann E. MORIN wrote:
> > This script helps in testing that a package builds fine on a wide range
> > of architectures and toolchains: BE/LE, 32/64-bit, musl/glibc/uclibc...
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > [yann.morin.1998 at free.fr:
> >  - completely rewrite the script from Thomas, with help from Luca
> > ]
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> > Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> First of all, thanks for taking over my initial crappy submission and
> making it something production ready. I've applied your patch, but I
> nonetheless have a few comments about it. See below.
> 
> > +    opts="$( getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}"  )"
> 
> I continue to terribly dislike this whole concept of putting a space
> after an opening parenthesis and before a closing parenthesis.
> 
> I know this is your coding style, but it is *not* the Buildroot coding
> style. So I'd appreciate if the shell scripts could also comply with
> the Buildroot coding style on this.

Fair enough. I'll post a patch fixing this.

> > +    printf "download config"
> 
> I find all these prints to be really useless, and they clutter the
> output for nothing. My original script had a very lean and readable
> output:
> 
> 	<toolchain>:	<status>
> 
> and now it's the much more verbose (and useless):
> 
>                 armv5-ctng-linux-gnueabi: download config, olddefconfig, build: OK
>               armv7-ctng-linux-gnueabihf: download config, olddefconfig, build: OK
> 
> (which would get even more verbose if I had passed a -p option, since
> dirclean would have been added).
> 
> I'd really prefer if we got rid of those additional prints, they are
> not useful, and make the whole thing less readable.

Well, I like that there is so feedback of what's going on under the
hood...

But I'll send updates to 'fix' that.

Thanks! :-)

Regards,
Yann E. MORIN.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
