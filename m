From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Sep 2012 00:24:25 +0200
Subject: [Buildroot] [PATCH 2/2] target: add different methods to encode
	the root password
In-Reply-To: <5058EFE9.5050707@mind.be>
References: <1347574590-13716-1-git-send-email-yann.morin.1998@free.fr>
 <1347574590-13716-2-git-send-email-yann.morin.1998@free.fr>
 <5058EFE9.5050707@mind.be>
Message-ID: <201209190024.25455.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 19 September 2012 00:04:25 Arnout Vandecappelle wrote:
> On 09/14/12 00:16, Yann E. MORIN wrote:
> > The password can be encoded in different ways (from the weakest
> > to the strongest): des, md5, sha-256, sha-512
> >
> > Add a choice entry to select the method, defaulting to 'des'.
> >
> > Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> 
> I think this is going way too far for just setting the root password. I 
> would just make it an md5 crypt (which is supported by all uClibc versions)
> and be done with it.

OK, I'll respin a single patch with only MD5-encrypted password.

To be noted however, is that MD5 is now sensible to attacks:
    http://www.kb.cert.org/vuls/id/836068

There's even an attack that can find collisions within seconds on a P4:
    http://www.win.tue.nl/hashclash/On%20Collisions%20for%20MD5%20-%20M.M.J.%20Stevens.pdf

Thus, I'll add to the help text that this should not be considered for
production use for publicly-reachable devices (eg. appliances...), and
that the security of the device should not rely on the root password being
strongly-enough encrypted; something in this vein...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
