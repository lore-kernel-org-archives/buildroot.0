From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Sep 2017 11:24:50 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
In-Reply-To: <20170910080432.0a6bc7b6@windsurf.lan>
References: <1504977449-30925-1-git-send-email-brain@jikos.cz>
 <20170909220851.56a41dc1@windsurf.lan>
 <a9a2f132-bb2f-a79e-cd8e-4116ae096691@jikos.cz>
 <20170910080432.0a6bc7b6@windsurf.lan>
Message-ID: <20170910092450.GC3536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-09-10 08:04 +0200, Thomas Petazzoni spake thusly:
> On Sat, 9 Sep 2017 22:53:06 +0200, Petr Kulhavy wrote:
> > Is there a command to just clone and compress the repo via BR?
> > The <package>-extract make target fails if the hash doesn't exist and 
> > consequently deletes the temporary files.
> Yeah, it's a bit annoying. If you put a none hash temporarily, then you
> can have the tarball downloaded, calculate its hash, and add it. We
> also had proposals like https://patchwork.ozlabs.org/patch/791357/ to
> help with this.

IIRC, I was opposed to that change, because we want the user to go and
get the hash as provided by upstream (e.g. in a release email).

Having the infra pre-calculate the hash locally defeats the very purpose
of the hashes: check that what we got is what upstream provides.

We accept local calculation of hashes only in the case that upstream
does not provide it.

As an aside, the patch does two things, so should be split.

I'll go and reply that to that original patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
