From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Sep 2017 23:07:40 +0200
Subject: [Buildroot] [PATCH v2] support/scripts/apply-patches.sh: do not
 apply patches with renames
In-Reply-To: <186d2d2e-a3e0-792f-63b7-24a3ac1d4d41@mind.be>
References: <20170624195936.31528-1-thomas.petazzoni@free-electrons.com>
 <186d2d2e-a3e0-792f-63b7-24a3ac1d4d41@mind.be>
Message-ID: <20170919210740.GA2815@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Bernd, All,

On 2017-09-19 23:01 +0200, Arnout Vandecappelle spake thusly:
> On 24-06-17 21:59, Thomas Petazzoni wrote:
> > Patches with renames apply properly with patch >= 2.7, but not with
> > older patch versions. Since "git format-patch" by default generates
> > patches with renames, Buildroot developers often don't realize that
> > their patches will not apply properly on build machines that have
> > patch < 2.7. In order to prevent such a situation from happening
> > again, this commit adds some logic in apply-patches.sh to refuse
> > applying patches that contain renames.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
>  Applied to master after incorporating Yann's and my suggestions, thanks.

Which leaves the tree with a single patch that contains renames, which
was added by 74a56295 (softether: don't download patch from Github) by
Peter. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
