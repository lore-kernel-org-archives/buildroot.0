From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2015 11:05:00 +0200
Subject: [Buildroot] [PATCH] wireshark: remove RPATH tag
In-Reply-To: <20150404195923.154d3366@free-electrons.com>
References: <0dae86e37516236d337e8433c63047504f1576f9.1415126141.git.baruch@tkos.co.il>
 <20150404195923.154d3366@free-electrons.com>
Message-ID: <20150405090500.GA4134@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-04 19:59 +0200, Thomas Petazzoni spake thusly:
> On Tue,  4 Nov 2014 20:35:41 +0200, Baruch Siach wrote:
> > Edit libtool to remove RPATH from generated binaries. This is similar to
> > upstream commit making the same change when buiding RPMs.
> > https://code.wireshark.org/review/gitweb?p=wireshark.git;a=commitdiff;h=a4a624e4c5
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/wireshark/wireshark.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> I'm still not sure what to do with this. Yann, Gustavo, Samuel, some
> suggestions ?
> 
> Should we introduce a final check in target-finalize to warn about
> binaries having invalid rpaths, and start fixing them one by one ? Or a
> more brutal approach where we remove all rpaths in target-finalize ?

I have a series doing exactly that; I'll be sending it shortly.

> I'm a bit uncomfortable with having a fix for just one package without
> having a globally defined policy on how to handle this rpath mess.
> Opinions welcome.

I feel the same.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
