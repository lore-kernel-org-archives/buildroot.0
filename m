From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Tue, 19 Dec 2017 13:59:04 +0100
Subject: [Buildroot] [PATCH v2 1/1] nginx: Harden patches for using
 pkg-config
In-Reply-To: <20171219134316.6956197a@windsurf>
References: <20171218225903.ocsiikdxr4est2wr@zenon.in.qult.net>
 <20171219101024.ihi276tfg6s5gti6@zenon.in.qult.net>
 <20171219134316.6956197a@windsurf>
Message-ID: <20171219125903.pbudek3j6lsr6hje@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 19, 2017 at 01:43:16PM +0100, thus spake Thomas Petazzoni:
> Hello,
> 
> On Tue, 19 Dec 2017 11:10:24 +0100, Ignacy Gaw?dzki wrote:
> > Don't simply remove "-I" from the output of pkg-config --cflags-only-I
> > but match the -I argument more generally.
> 
> OK, but why? What is this fixing?

Suppose that the lib has been installed in /usr/Some-Install-Location/
then pkg-config --cflags-only-I may return

  -I/usr/Some-Install-Location/include

which, piped through sed 's/-I//g' would end up being

  /usr/Somenstall-Location/include

which is probably not going to work.

-- 
Ignacy Gaw?dzki
R&D Engineer
Green Communications
