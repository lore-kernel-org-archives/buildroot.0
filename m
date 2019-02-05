From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Feb 2019 19:10:39 +0100
Subject: [Buildroot] [PATCH] utils/test-pkg: clean output dir for
 successful builds
In-Reply-To: <59dd171a-aa7d-1684-969e-e3d3cf3c3ece@mind.be>
References: <20190205161605.1331-1-patrickdepinguin@gmail.com>
 <59dd171a-aa7d-1684-969e-e3d3cf3c3ece@mind.be>
Message-ID: <CAAXf6LX0cVWPBYXJBrXYFmMj13k_Tcr4Y36=3-UjDewQtFAZOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 5, 2019, 17:55 Arnout Vandecappelle <arnout@mind.be wrote:

>
>
> On 05/02/2019 17:16, Thomas De Schampheleire wrote:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > test-pkg will use gigabytes of space when testing all toolchains.
> > Nevertheless, you are normally only interested in the actual build / host
> > tree when there is a build failure.
>
>  Well, except in the situation where you're iteratively fixing the package
> and
> re-testing with the -p option, no? Then your subsequent attempt would be
> happy
> to reuse the build results of all dependencies...
>
>  So, I think it's better to make this optional - perhaps with a -k,--keep
> option
> similar to run-tests.
>

While it does not hurt to make it optional, I don't understand your
example. If your iteratively 'fixing' a package, then the build fails and
we don't clean anyway. Right?

But one could indeed imagine iteratively 'changing' a package where
intermediate iterations actually work and you want to keep the result.

/Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190205/aa372ef5/attachment.html>
