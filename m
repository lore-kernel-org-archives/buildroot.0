From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jan 2014 22:01:12 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <87lhyl2b5w.fsf@dell.be.48ers.dk>
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
 <20140111234853.GE3391@free.fr> <87zjn14mtn.fsf@dell.be.48ers.dk>
 <20140112112743.GA3374@free.fr> <87bnzh3vqy.fsf@dell.be.48ers.dk>
 <20140112183442.GB3374@free.fr> <8738kt3t5f.fsf@dell.be.48ers.dk>
 <20140112200937.GC3374@free.fr> <87lhyl2b5w.fsf@dell.be.48ers.dk>
Message-ID: <20140112210111.GD3374@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-01-12 21:32 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > An third alternative is to add a package/pkg/pkg.hash file, which
>  > contains the list of files, and their hashes; in fact, the output of the
>  > hash util we'd use:
>  >     ABCDEF1234567890  foo-1.2.3.patch
>  >     ABCDEF1234567890  bla.patch
>  >     ABCDEF1234567890  file.bin
> 
> That sounds good to me, and is easy to handle. Another alternative would
> be to make <pkg>_CHECKSUM a list of hashes, in the same order as the
> files are handled (_SOURCE, _EXTRA_DOWNLOADS, _PATCH).

And how do you suggest we correlate the hash from that list to the file
we're actually just downloaded?

The tarball is in one variable, the patches in a second, and the extra
files in a third.

We'd have to look in each of those variables to find the file, and
derive an offset in the list form that, and then extract the n-th
element of that list.

I guess this is not so easy as you think it is. ;-)

>  > Also, we'd have to settle for a hash function.
[--SNIP--]
> Next to their strength is also the issue about how likely it is that
> those tools are available on the build host.

Right, those pesky companies using "Enterprise Editions" and then stuck
back in the 20th century... ;-]

sha1 shall it be, then. ;-)

(Note: sha2 was added to coreutils seven years ago, 2005-10-23)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
