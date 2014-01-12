From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jan 2014 12:27:43 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <87zjn14mtn.fsf@dell.be.48ers.dk>
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
 <20140111234853.GE3391@free.fr> <87zjn14mtn.fsf@dell.be.48ers.dk>
Message-ID: <20140112112743.GA3374@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-01-12 09:38 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > It's a pity we can't get that from a trusted channel (ie. https instead
>  > of plain http). Sigh... :-(
> 
>  > I know we do not do that for the other packages, but I'd like that we
>  > check the authenticity of that specific one. There's no point in adding
>  > a security-related package that we can validate in the first place.
> 
>  > I'd suggest we do that with a _POST_DOWNLOAD_HOOKS, something like:
> 
>  > CA_CERTIFICATES_CHECKSUM = SHA1-hash
>  > define CA_CERTIFICATES_VERIFY_CHECKSUM
>  >     hash=$$( sha1sum $(DL_DIR)/$(CA_CERTIFICATES_SOURCE) |cut -d ' ' -f 1 )
>  >     if [ ! $${hash} = $(CA_CERTIFICATES_CHECKSUM) ]; then
>  >         printf "ERROR: $(CA_CERTIFICATES_SOURCE) has wrong SHA1\n"
>  >         printf "ERROR: Maybe the download was MITMed\n"
>  >         exit 1
>  >     fi
>  > endef
>  > CA_CERTIFICATES_POST_DOWNLOAD_HOOKS += CA_CERTIFICATES_VERIFY_CHECKSUM
> 
>  > I don't know what others think of it. Peter, Thomas, others?
> 
> If we want to do something like this, then I would much prefer to move
> it into the package infrastructure and do it for all packages (but not
> require it, similar to how we're progressively adding licensing info to
> packages).

Eh! I knew you'd say that! :-)

I guess there's no point in adding such a check for git, svn and all
other VCSes. Only 'static' content wouls be elligible to being checked.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
