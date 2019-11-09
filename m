From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Nov 2019 18:13:20 +0100
Subject: [Buildroot] [PATCH] infra/pkg-generic: use site method for
 same-site extra downloads
In-Reply-To: <20191108172645.22584-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 8 Nov 2019 18:26:45 +0100")
References: <20191108172645.22584-1-yann.morin.1998@free.fr>
Message-ID: <87pni1km6n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When a package specifies extra downloads, it has the option to only name
 > the basename of the extra download, in which case that extra download
 > will be retrieved from the same location the main download is retrieved
 > from.

 > In that case, if the extra download contains a '+', it would confuse the
 > dl-wrapper, which believes the LHS of the '+' is the site method, and
 > the RHS the actual URI, and so the dl-wrapper mangles and damages the
 > URI when fetching such extra downloads, like that happens with android
 > tools, where the proper URI and mangled URIs of the extra download are,
 > respectively:

 >     https://launchpad.net/ubuntu/+archive/primary/+files/android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz
 >     http://archive/primary/+files/android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz

 > We fix that by always propagating the site method to extra downloads,
 > but only when they are specified as relative to the main download URI.

 > For the extra downloads that specify a full URI, it is not systematic
 > that it is the same site method. For example, a main download could be a
 > git clone, but an extra download a pure http download; in that case we
 > can't replicate the site method for extra downloads, so they'll have to
 > take appropriate care to specify the required method and encoding if
 > needed.

 > Reported-by: Jemy Zhang <jemy.zhang@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Jemy Zhang <jemy.zhang@gmail.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
