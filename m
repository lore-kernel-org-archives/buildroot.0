From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 19 May 2015 13:00:58 -0300
Subject: [Buildroot] [PATCH v2 2/6] pkg-utils: implement INFLATE for
 .deb files
In-Reply-To: <20150518215558.0cde581c@free-electrons.com>
References: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
 <1431959088-15257-3-git-send-email-guido@vanguardiasur.com.ar>
 <20150518215558.0cde581c@free-electrons.com>
Message-ID: <20150519160058.GB23051@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 18, 2015 at 09:55:58PM +0200, Thomas Petazzoni wrote:
> Dear Guido Mart?nez,
> 
> On Mon, 18 May 2015 11:24:44 -0300, Guido Mart?nez wrote:
> 
> > +ar fp ${DEBFILE} data.tar.xz | ${XZCAT} -d
> 
> Are all Debian .deb packages compressed with the xz compression? How
> many packages would benefit for this being supported at the package
> infra level vs. handling it directly in the toolchain-external package?
I had tried with several packages and found they were all XZ-compressed,
but I just tried with ~6000 packages and saw that only 90% are
XZ-compressed, so this wouldn't work.

I also don't know of any packages we might want to use are only shipped
the .deb format.

> We normally try to not clutter the package infra with features only
> useful to one package, especially when the feature can easily be
> implemented at the package level.
Yeah, I agree. I'll drop this and revert back to custom extract
commands.

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
