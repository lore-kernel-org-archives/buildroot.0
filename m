From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Aug 2015 10:55:45 +0200
Subject: [Buildroot] .hash files for all packages?
In-Reply-To: <20150811101333.2fd48c22@free-electrons.com>
References: <1438682248-29767-1-git-send-email-joerg.krause@embedded.rocks>
 <20150810162227.6a3cde19@free-electrons.com>
 <1439217249.5186.18.camel@embedded.rocks>
 <20150810205427.156aa7b9@free-electrons.com>
 <20150810204725.GG3676@free.fr>
 <20150811101333.2fd48c22@free-electrons.com>
Message-ID: <20150811085545.GA3627@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-11 10:13 +0200, Thomas Petazzoni spake thusly:
> On Mon, 10 Aug 2015 22:47:25 +0200, Yann E. MORIN wrote:
> > I think the overall goal is to have .hash files for all packages. Having
> > a .hash files for all packages would allow us to make hashes truly
> > mandatory, and make a missing .hash file an error, rather than the
> > warning it is today.
> > 
> > Which in turn would ensure we have hashes for all packages for which it
> > makes sense.
> > 
> > Of course, that would mean adding a 'none' hash for those packages for
> > which we can't have  ahash (like the github helper, or any git/svn/... 
> > checkouts.
> > 
> > So, what J?rg did was in my opinion correct, even if we did not
> > explicitly document that! ;-)
> 
> Ok. I'm a bit worried about having 220 useless hash files,

The problem we have when there is no .hash file, is that we can't
differentiate those two cases;
  - there is no hash for this package, because it does not make sense
    (github helper, git/svn/foo checkout...)
  - we forgot to add a hash for that package.

I can understand that having lots of similarly looking files that jsut
say "don't do hash checks" might seem a bit worrying at first.

But I do think we really do need a way to explicitly say so.

Adding Gustavo in Cc because we already talked about that with him, and
last we discussed this, I think he agreed (well, I have IRC logs to back
that claim up! ;-] )

> so I'd like
> to hear the opinion of others on that. And once we made our decision,
> document it more clearly.

Yes, it should be throughly documented.

But note: this will have an impact on BR2_EXTERNAL trees; they will also
have to provide .hash files for their packages.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
