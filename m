From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Mon, 18 Feb 2013 12:40:27 +0100
Subject: [Buildroot] QUILT helper
In-Reply-To: <7241967.ZJo92yCnzW@sagittae>
References: <50F92F70.2070808@syscom-instruments.com>
 <50FACBAA.7020602@mind.be> <7241967.ZJo92yCnzW@sagittae>
Message-ID: <5122132B.5000402@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14. 02. 13 17:53, J?r?me Pouiller wrote:
>
> A way to work with patches for a package is currently:
>    make $PKG-dirclean
>    make $PKG-extract
>    cd build/$PKG-$PKG_VERSION
>    git init
>    git add .
>    git rm --cached .stamp_*
>    git commit -m 'initial tarball'
>    git tag initial
>
> After that, import all relevant patches using
>    git am $PATCH
> or
>    git apply $PATCH
>    git commit -a -m "$PATCH"
> depending of format of $PATCH
>
> After that, you may create manually files .stamp_patched and
> .applied_patches_list
>
> Use git rebase to edit each patch. Once you are satisfied, use
>    git format-patch initial
>
> Copy your work in package/$PKG directory
>
> IFAIK you may also use guilt on top of git. Guilt which have nearly same
> commands than quilt. Use "guilt push/pop/refresh" instead of rebase and "guilt
> export" instead of "git format-patch".
>
> We could add an option to apply-patches.sh to automatically do first steps. We
> could do:
>     make $PKG-dirclean
>     make CREATE_GIT=1 $PKG-patch
>     cd build/$PKG-$PKG_VERSION
>     git rebase -i
>     git format-patch initial
>
> And with guilt:
>     make $PKG-dirclean
>     make CREATE_GIT=1 $PKG-patch
>     cd build/$PKG-$PKG_VERSION
>     guilt push/pop/refresh
>     guilt export
>
> What do you think about it?
>

Hello J?r?me,

I think using QUILT directly will be the best. Because, we don't need 
git here. We just need a buildroot system to init quilt env, copy 
patches and when the job is done, copy the patches from quilt env to the 
package directory.

I want so much this feature ! I'm the only one here :) ?

I began to do some research about how openwrt do that and how we can do 
this in buildroot. But, I'm pretty busy and don't have time to do it 
now. If someone who know internal stuff in buildroot can tell where to 
do the modifications, it will be appreciable.

Cheers,
avd.
