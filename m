From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Jan 2014 21:33:54 -0300
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <20140117230234.GF3982@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
 <52D5AE11.60804@mind.be> <20140114233438.GL3328@free.fr>
 <52D64559.90705@mind.be> <52D68BA0.6060503@zacarias.com.ar>
 <20140117230234.GF3982@free.fr>
Message-ID: <52D9CBF2.7030904@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/17/2014 08:02 PM, Yann E. MORIN wrote:

> I understand your concerns.
> 
> But, whether we do compute the hashes ourselves, or retrieve them from
> an annoucment mail (which by your own saying is not systematic), we
> can't blindly accept a patch that contains hashes without verifying
> them.
> 
> So, whenever Peter would be about to apply a package, he'd have to check
> for himself that the hashes are correct.
> 
> For that, he'd have to go the package's website, dig up the announcement
> mail from the list, and compare the hashes.
> 
> So, whether we compute them, or get them from the annoucement mail,
> Peter would still have to check them in the end, prior to applying the
> patch.
> 
> And we still do not have solved the problem of packages for which no
> hash has been publicly posted and archived.
> 
> So, all that comes to mind now is that we need signatures, not hashes.
> But not all packages have signed releases either. So we're back to
> square-one.
> 
> In the end, I wonder how much we do want to protect the downloads.
> I firmly believe that a set of hashes are enough for what we want to do.
> If a user is even most concerned about security, then he should (and
> would anyway) audit the download for integrity before shipping a
> product.
> 
> And since we do sign our releases (peter does it), a user can verify our
> releases easily, and assess that the hashes are legit.

The hashes are first and foremost a consistency feature, they are not in
any way a security feature and anyone who believes that is fooling himself.
My comment was to just give an extra degree of consistency since the
developer's box can be compromised without his knowledge and would emit
a perfectly valid hashed tarball with a backdoor, weakness or whatnot.
This would need guidelines as to the preferred origin of the hashes, and
yes not everyone does hashes and/or announcements so it's only that,
guidelines :)
I don't know if i'd go as far as a chain of trust, the burden would be
too much at the moment i think, if we add file size combined with the
hash the collisions would be reduced and you get a certain degree of
extra protection.
Peter or some other committer shouldn't need to get too involved in
this, basically make the check against the submitted package and it will
match or not.
If at some point it's discovered there was a compromise upstream you can
compare hashes and know if you're affected (depending on the package
being submitted/updated after the compromise or not).
But remember, short of doing source code audit there's never any
guarantee, so i wouldn't want to sign that everything is fine in an
irresponsible way when many of the packages are just built tested.
Regards.
