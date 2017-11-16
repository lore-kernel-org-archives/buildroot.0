From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 16 Nov 2017 20:23:24 +0100
Subject: [Buildroot] [PATCH v1] qt5: bump LTS version to 5.6.3
In-Reply-To: <87375eb8nb.fsf@dell.be.48ers.dk>
References: <20171020184110.13216-1-ps.report@gmx.net>
 <87375eb8nb.fsf@dell.be.48ers.dk>
Message-ID: <20171116202324.061ae3ce@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 16 Nov 2017 15:28:08 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:  
> 
>  > qt5base:
>  >   - move hash file to 5.6.3
>  >   - move 0001-eglfs-rasp-pi-header-inclusion.patch to 5.6.3
>  >   - remove 0002-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch (upstream committed [1])  
> 
>  > qt5declarative:
>  >   - move patches to 5.6.3  
> 
>  > qt5quickcontrols2:
>  >   - move hash file to 5.6.3  
> 
>  > qt5webkit:
>  >   - move patches to 5.6.3  
> 
>  > [1] http://code.qt.io/cgit/qt/qtbase.git/commit/?h=5.6&id=f1b4bd4790860e1ff5afcec111a359bc3a91cfda  
> 
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> Committed to 2017.02.x and 2017.08.x, thanks.
> 
> While backporting, I noticed that qt5webkit is screwed up:
> 
>  > +++ b/package/qt5/qt5webkit/qt5webkit.hash
>  > @@ -1,5 +1,5 @@
>  > -# Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/qtwebkit-opensource-src-5.6.2.tar.xz.mirrorlist
>  > -sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit-opensource-src-5.6.2.tar.xz
>  > +# Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.3/latest_src/submodules/qtwebkit-opensource-src-5.6.3.tar.xz.mirrorlist
>  > +sha256  qtwebkit-opensource-src-5.6.3.tar.xz  
> 
> Empty hash, and the download location isn't correct. The 5.6.x series
> also needs a icu-59.x compatibility fix backported from the 5.9 series.
> 
> I've sent patches for both:
> 
> http://lists.busybox.net/pipermail/buildroot/2017-November/207280.html
> 

Ups, thanks for spotting and many thanks for fixing it...

Regards,
Peter
