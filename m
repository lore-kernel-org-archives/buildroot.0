From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2019 23:18:32 +0100
Subject: [Buildroot] [PATCH 08/11] support/download: implement
 source-check in git backend
In-Reply-To: <20190103215953.012ee1a8@windsurf>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-9-patrickdepinguin@gmail.com>
 <20190103215953.012ee1a8@windsurf>
Message-ID: <20190103221832.GI5991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, DS, Thomas P, All,

On 2019-01-03 21:59 +0100, Thomas Petazzoni spake thusly:
> On Thu,  3 Jan 2019 21:40:23 +0100, Thomas De Schampheleire wrote:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > 
> > The implementation is the same as originally was present.
> > It suffers from the disadvantage that an invalid revision on a valid URL
> > will not be detected.
> > 
> > However, git does not seem to allow a good way to remotely check the
> > validity of a revision, without cloning the repository.
> > 
> > For source-check, we don't want to do such download which can be large.
> 
> While I understand the limitation, I don't really agree with the
> conclusion: we should go ahead and download the full thing. Indeed the
> selling argument for source-check in your cover letter is precisely to
> verify that the version of the package that has been committed by
> someone is *really* available. If there's no version check in the git,
> bzr and cvs source-check implementation, it makes the selling point of
> the cover letter a bit moot, no?

Agreed here. *If* we were to re-add support for source-check, it should
really behave as it says on the can: check that the source really
exists. If a backend can't do a cheap check, then it has to download
everything.

> Of course, I realize that your primary interest is in hg, and hg has
> this capability. But still we should ensure git/bzr/cvs provide the same
> guarantees, by falling back to the slower but working method of
> downloading everything.

Yup.

But this is not an endorsement of re-adding source-check, mind you1 ;-)
I'm still unconvinced we need it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
