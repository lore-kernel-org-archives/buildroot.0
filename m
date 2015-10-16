From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 Oct 2015 18:30:46 +0200
Subject: [Buildroot] [PATCH] fs/common.mk: support comments in user
	table files
In-Reply-To: <87d1we3l4i.fsf@dell.be.48ers.dk>
References: <1445007019-23720-1-git-send-email-peter@korsgaard.com>
 <20151016170128.6a821cd0@free-electrons.com>
 <87d1we3l4i.fsf@dell.be.48ers.dk>
Message-ID: <20151016163046.GA4104@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2015-10-16 17:10 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Peter, Yann,
>  > On Fri, 16 Oct 2015 16:50:19 +0200, Peter Korsgaard wrote:
>  >> The format of the users table files is non trivial, so it is sometimes handy
>  >> to add comments explaining the syntax (or simply the reason for the user)
>  >> inline in the files.
>  >> 
>  >> Support comment lines prefixed with '#' similar to shell / makedevs files and strip
>  >> those lines before passing to the mkusers script.
>  >> 
>  >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
>  > Shouldn't it the responsibility of the mkusers script to ignore such
>  > comments instead ?
> 
> It could be, but that is more work as it iterates over the (combined)
> file multiple times,

Arguably, we could read the file only once and store the lines in
variables. Then, we could do the filtering in the script.

However, that script is not supposed to be called outside of Buildroot,
so we don't really care where we do the filtering.

> and comments only really makes sense for custom
> users files (and nog <PKG>_USERS) so just stripping those lines when
> handling the custom files imho makes sense.

Still, the script could probably use a bit of love in this area...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
