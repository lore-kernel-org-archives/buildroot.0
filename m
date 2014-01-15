From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jan 2014 10:22:40 -0300
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <52D64559.90705@mind.be>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
 <52D5AE11.60804@mind.be> <20140114233438.GL3328@free.fr>
 <52D64559.90705@mind.be>
Message-ID: <52D68BA0.6060503@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/15/2014 05:22 AM, Arnout Vandecappelle wrote:

>  If the hash file contains the following:
> 
> 486fb55c3efa71148fe07895fd713ea3a5ae343a  sha1  libfoo-1.2.3.tar.bz2
> 
> then you can now let the script check that the second field is sha1, and
> later you can support different hash methods. In that case, it is not
> necessary to update all the files when we want to switch to a new hash
> method.
> 
>  (Incidentally, it also enables Gustavo's suggestion to use whatever
> upstream provides.)

Yes.
A little explanation on why upstream hashes should be used (my mail last
night was a bit rushed out, busy busy).
When upstream releases a tarball normally it'll fire off an announcement
mail to some mailing list with (hopefully) the hash for the tarball(s).
Usually this hash(es) will also live in some project website hosting.
If the website is compromised then the hash there can also be
compromised and you are computing your hash on a bad tarball (if done
when bumping version) or an altered hash in the website.
Sent mail (mailing list archives, personal mail) is much harder to
compromise all at once hence the original hash will still be true if all
is dandy.
Of course there's the possibility that the developer machine has been
compromised or some code has been "sneaked under the carpet" with peer
review failing to notice, but then there's no hash to save you there and
it's not the intention of this either.
Regards.
