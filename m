From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 13 Jul 2011 22:46:14 +0200
Subject: [Buildroot] [PATCH 2/2] source: print messages when all sources
	downloaded
In-Reply-To: <87fwmadnuq.fsf@macbook.be.48ers.dk>
References: <1310512066-11450-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <201107132011.51230.yann.morin.1998@anciens.enib.fr>
 <87fwmadnuq.fsf@macbook.be.48ers.dk>
Message-ID: <201107132246.14553.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Wednesday 13 July 2011 20:42:05 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:
>  Yann> Indeed. We could print the message only if DL_MODE==DOWNLOAD. Would that
>  Yann> be OK with you?
> 
> We could, but I'm not really sure if we should. We don't do anything
> like that for any of the other make targets.

OK, I'll ditch this change, then...

>  Yann> Incidentally, external-deps and source-check will not be really complete
>  Yann> when crostool-NG is the backend, as there is no way to ask such a thing
>  Yann> to crosstool-NG.
> 
> Ok, also not by playing games with a replacement wget/curl/whatever that
> just prints basename $1 or similar?

Nope, there's curently no way.

I could add that, but I'm not sure how much it would make sense in the
crosstool-NG case by itself.

Also, if buildroot wanted crosstool-NG to print the list of its required
sources, it would mean building crosstool-NG, which first requires building
host-gawk and host-automake anyway... Which I find ugly...

>  Yann> Note that source-check is currently borked due to some unconfigured
>  Yann> defconfig files for bootloaders and kernel. Eg. for barebox:
[--SNIP--]
> Yes, we currently require a buildable .config for make
> source/source-check/external-deps, which I don't really think is big
> issue for normal use cases. I do hit it when I update the
> sources.buildroot.net mirror using make allyesconfig && make source, so
> we could try to get rid of that restriction if it doesn't make the
> linux/barebox/uboot Makefiles too ugly.

What I'm doing here is to have the _DEFCONFIG options to default to
'(none)' so it satisfies the checks.

It is the responsibility of the user to set correct values in place of the
defaults. But that does not really change from what's required today, the
user is already responsible for that.

Of course, it'll be up to you to accept or ditch such a change, if you don't
mind setting those manually. After all, it's only three options. For now...
:-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
