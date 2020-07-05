From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jul 2020 19:37:02 +0200
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
In-Reply-To: <20200705145430.20cc4911@windsurf.home>
References: <20200704010533.1854-1-sergio.prado@e-labworks.com>
 <20200705145430.20cc4911@windsurf.home>
Message-ID: <20200705173702.GI2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Sergio, All,

On 2020-07-05 14:54 +0200, Thomas Petazzoni spake thusly:
> On Fri,  3 Jul 2020 22:05:33 -0300
> Sergio Prado <sergio.prado@e-labworks.com> wrote:
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> > +# Locally computed:
> > +sha256  099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645  dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
> 
> Unfortunately, this doesn't work: it seems like our hashes for
> Mercurial fetched packages are not reproducible:

They should be. It was my experience that hg does produce reproducible
archives, even without a complexe dance like we do with the git backend.
See commit 76b51f90c0e which purportedly made them reproducible.

> ERROR: dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz has wrong sha256 hash:
> ERROR: expected: 099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
> ERROR: got     : 926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57

I too got that 926208 sha256 here, with two different hg versions: 3.7.3
and 4.8.2.

> --2020-07-05 14:51:38--  http://sources.buildroot.net/dvb-apps/dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz

dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz  2014-Sep-01 16:03:23 442.7K application/x-gtar-compressed

So, this file was created before the commit that made the archives
reproducible. So, no surprise that the sha256 does not match the
locally-created archive but that from s.b.o.

> Interestingly, python-pygame is also fetched from Mercurial, also has a
> hash file, and it is also wrong:
> 
> >>> python-pygame d61ea8eabd56 Downloading

A full sha1 should be used, rather than a shortened one.

The python-pygame archive was however created after commit 76b51f90c0e...

> requesting all changes
> adding changesets
> adding manifests
> adding file changes
> added 3652 changesets with 15404 changes to 1890 files (+17 heads)                                
> new changesets 4609a0076cda:48e19c7b9ee9
> ERROR: pygame-d61ea8eabd56.tar.gz has wrong sha256 hash:
> ERROR: expected: f95a7dd68ea294d415e36e068d2f533c5a01c67773452d14a535c5c7455681fe
> ERROR: got     : d5e0a43a4e338de4cb282af0ddd6e671055d6b9290030c27cfac41b1f7801232

I too git d5e0a43a4e33.

What machine is pushing the archives to s.b.o. ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
