From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 18 Jan 2013 10:25:03 +0100
Subject: [Buildroot] need help adding apache to buildroot
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F40E3AC93@G4W3291.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F40E3A14E@G4W3291.americas.hpqcorp.net>
 <50F71D3A.2010906@zacarias.com.ar>
 <2DD0B9C711CDFC45A3A266C78966CE7F40E3AC93@G4W3291.americas.hpqcorp.net>
Message-ID: <2495590.Ukzi9HXY20@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 17 January 2013 22:41:24 Jenkins, Lee wrote:
[...]
> The good news is I found a patch that provides a CC_FOR_BUILD variable to
> fix the problem. However, the patch is not an "official" apache patch, but
> hosted at a different location here:
> http://people.apache.org/~fuankg/diffs/httpd-2.2.x-cross_compile.diff. If
> I'm reading the buildroot docs correctly, if I add APACHE_PATCH to
> apache.mk it will require the patch to be at the same URL as the tarball.
> Ugh.
> 
> Are the "patch hooks" simply shell commands? How egregious would it be (from
> a buildroot maintainer perspective) to use the patch hooks to wget the
> patch and apply it? :-)
IMHO, this patch is small enough to be included in Buildroot tree.

Download manually the patch, place it in your package directory and name it 
RAWNAME-DESCRIPTION.patch (apache-cross-compile-fix.patch) (Exact naming rule 
is in packages/pkg-generic.mk:$(BUILD_DIR)/%/.stamp_patched).

Patch will be automatically applied.



-- 
J?r?me Pouiller
