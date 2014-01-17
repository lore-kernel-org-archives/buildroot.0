From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 00:02:34 +0100
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <52D68BA0.6060503@zacarias.com.ar>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
 <52D5AE11.60804@mind.be> <20140114233438.GL3328@free.fr>
 <52D64559.90705@mind.be> <52D68BA0.6060503@zacarias.com.ar>
Message-ID: <20140117230234.GF3982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-01-15 10:22 -0300, Gustavo Zacarias spake thusly:
> On 01/15/2014 05:22 AM, Arnout Vandecappelle wrote:
> 
> >  If the hash file contains the following:
> > 
> > 486fb55c3efa71148fe07895fd713ea3a5ae343a  sha1  libfoo-1.2.3.tar.bz2
> > 
> > then you can now let the script check that the second field is sha1, and
> > later you can support different hash methods. In that case, it is not
> > necessary to update all the files when we want to switch to a new hash
> > method.
> > 
> >  (Incidentally, it also enables Gustavo's suggestion to use whatever
> > upstream provides.)
> 
> Yes.
> A little explanation on why upstream hashes should be used (my mail last
> night was a bit rushed out, busy busy).
> When upstream releases a tarball normally it'll fire off an announcement
> mail to some mailing list with (hopefully) the hash for the tarball(s).
> Usually this hash(es) will also live in some project website hosting.
> If the website is compromised then the hash there can also be
> compromised and you are computing your hash on a bad tarball (if done
> when bumping version) or an altered hash in the website.
> Sent mail (mailing list archives, personal mail) is much harder to
> compromise all at once hence the original hash will still be true if all
> is dandy.
> Of course there's the possibility that the developer machine has been
> compromised or some code has been "sneaked under the carpet" with peer
> review failing to notice, but then there's no hash to save you there and
> it's not the intention of this either.

I understand your concerns.

But, whether we do compute the hashes ourselves, or retrieve them from
an annoucment mail (which by your own saying is not systematic), we
can't blindly accept a patch that contains hashes without verifying
them.

So, whenever Peter would be about to apply a package, he'd have to check
for himself that the hashes are correct.

For that, he'd have to go the package's website, dig up the announcement
mail from the list, and compare the hashes.

So, whether we compute them, or get them from the annoucement mail,
Peter would still have to check them in the end, prior to applying the
patch.

And we still do not have solved the problem of packages for which no
hash has been publicly posted and archived.

So, all that comes to mind now is that we need signatures, not hashes.
But not all packages have signed releases either. So we're back to
square-one.

In the end, I wonder how much we do want to protect the downloads.
I firmly believe that a set of hashes are enough for what we want to do.
If a user is even most concerned about security, then he should (and
would anyway) audit the download for integrity before shipping a
product.

And since we do sign our releases (peter does it), a user can verify our
releases easily, and assess that the hashes are legit.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
