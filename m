From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jan 2014 19:34:42 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <87bnzh3vqy.fsf@dell.be.48ers.dk>
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
 <20140111234853.GE3391@free.fr> <87zjn14mtn.fsf@dell.be.48ers.dk>
 <20140112112743.GA3374@free.fr> <87bnzh3vqy.fsf@dell.be.48ers.dk>
Message-ID: <20140112183442.GB3374@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-01-12 19:23 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > I guess there's no point in adding such a check for git, svn and all
>  > other VCSes. Only 'static' content wouls be elligible to being checked.
> 
> Why not? I know git gives you strong integrity guarantees (if you use
> the sha1 atleast), but E.G. svn doesn't.

Because we can't guarantee the reproducibility of an archive generated
by git archive, since at least the file's date may change, end up in the
tarball, and thus generate a different hash, even if the 'content' of
the archive is the same. Also, a different git version may re-order the
files, or whatever.

For a VCS, maybe the list of files and their respective contents are OK,
but we can't say anything about the generated archive.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
