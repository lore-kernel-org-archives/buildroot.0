From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Dec 2014 19:45:47 +0100
Subject: [Buildroot] [PATCH 3/4] pkg-download: verify the hashes from
 the download wrapper
In-Reply-To: <20141202092904.7b6ce375@free-electrons.com>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
 <eb25ccfd009955fcd6be60822a8c22985aca199d.1417475935.git.yann.morin.1998@free.fr>
 <20141202092904.7b6ce375@free-electrons.com>
Message-ID: <20141203184547.GF4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-02 09:29 +0100, Thomas Petazzoni spake thusly:
> On Tue,  2 Dec 2014 00:24:08 +0100, Yann E. MORIN wrote:
> > Instead of repeating the check in our download rules, delegate the check
> > of the hashes to the download wrapper.
> > 
> > This needs three different changes:
> > 
> >   - add a new argument to the download wrapper, that is the full path to
> >     the hash file; if the hash file does not exist, that does not change
> >     the current behaviour, as the existence of the hash file is done by
> >     the check-hash script;
> 
> It is really time to use getopt in the download wrapper scripts, as we
> have discussed with Fabio recently regarding the fully silent build
> thing.

Yeah, I was afraid you'd say that. :-)

But I'm mostly interested on feedback about the change itself, to check
hashes on locally cached files.

If that is OK, I'll rework the series.

> >   - add a third argument to the check-hash script, to be the basename of
> >     the file to check; this is required because we no longer check the
> >     final file with the finale filename, but anintermediate file with a
> 
> finale -> final
> 
> anintermediate -> an intermediate

Yup x2.

> >     temporary filename;
> > 
> >   - do the actual cal to the check-hash script form within the download
> 
> cal?

call

> form -> from.

Yup, thanks!

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
