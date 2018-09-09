From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Sep 2018 12:42:26 +0200
Subject: [Buildroot] [PATCH v1 4/4] qt5virtualkeyboard: add hashes of
 3rd-party licenses
In-Reply-To: <20180905233435.2e2d72c9@windsurf>
References: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
 <20180903123747.5234-5-gael.portay@savoirfairelinux.com>
 <20180905233435.2e2d72c9@windsurf>
Message-ID: <20180909104226.GG2841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Ga?l, All,

On 2018-09-05 23:34 +0200, Thomas Petazzoni spake thusly:
> On Mon,  3 Sep 2018 08:37:47 -0400, Ga?l PORTAY wrote:
> > Add missing license hashes for those three third-parties:
[--SNIP--]
> >  package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash | 5 +++++
> >  package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash     | 3 +++
> I'm not happy with how we handle per-version hash files. What you did
> is identical to what we do in qt5base, and you don't have much choice
> right now, but it's not great.
> 
> The download infrastructure only checks the main hash file, i.e
> package/<pkg>/<pkg>.hash, so we have to list in this file the hashes
> for all files that are downloaded, regardless of their version.
> 
> However, the legal-info stuff looks first in
> package/<pkg>/<version>/<pkg>.hash, and only if it doesn't exist, it
> looks in package/<pkg>/<pkg>.hash. This means that we can store
> per-version hashes for license files in
> package/<pkg>/<version>/<pkg>.hash. This is needed because a file named
> COPYING may exist in two different versions of a given package, but
> with different contents, and therefore different hashes.
> 
> I think this is not very consistent today. I see two possible options:
> 
>  (1) Make the download stuff consistent with the legal-info stuff so
>      that we can move the hashes for the downloaded stuff to the
>      per-version folders.
> 
>  (2) Keep things as they are today in terms of infra, but move the
>      hashes for license files in qt5base and qt5virtualkeyboard to
>      per-version directories.
> 
> I am fine with (2), but I find the current situation where hashes for
> some license files are in the main folder, and some hashes are in a
> per-version folder is very confusing.
> 
> Yann ?

I think we should do (1). However, it might not be so trivial... :-/

Then, (1) implies we have to do (2) as well.

Furthermore, we should also check that, if there is a versioned
sub-directory, then there is no un-versioned .hash file, because it is
not going to be used.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
