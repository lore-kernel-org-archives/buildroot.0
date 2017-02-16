From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Feb 2017 23:11:19 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
	archives
In-Reply-To: <87efyxg5df.fsf@dell.be.48ers.dk>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
 <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be>
 <20170216174124.GB4986@free.fr> <87efyxg5df.fsf@dell.be.48ers.dk>
Message-ID: <20170216221119.GE4986@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-02-16 23:03 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Actually, there is a use-case for being able to specify some of those,
>  > at least the downloaders: git, wget, svn, scp...
> 
>  > I use a script that is called in lieue of each downloader:
> 
>  >     BR2_WGET="/path/to/wrapper wget --passive-ftp -nd -t 3"
>  >     BR2_GIT="/path/to/wrapper git"
>  >     and so on...
> 
>  > That script is responsible for memorising, for each package, whether it
>  > was downloaded from the primary mirror, the official site, or the backup
>  > mirror, then acts according to where the package was downloaded:
[--SNIP--]
> Nice, but presumably you could also simply create a directory with
> wget/git/svn/.. symlinks to your wrapper and prepend that to your path
> before running buildroot, and then change the wrapper to do its stuff
> and call further in the path for the real tool, similar to the recently
> added date wrapper for reproducable builds?

Indeed, that would be doable, if a little bit more involved in the
wrapper. But not something overly complex either.

So, overriding the downloaders is in fact not strictly required.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
