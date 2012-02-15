From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Wed, 15 Feb 2012 17:51:04 +0100
Subject: [Buildroot] [RFC PATCH 4/6] apply-patches.sh: directories are
 considered as a collection of patches
In-Reply-To: <201202102340.46608.arnout@mind.be>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
 <4497cd4c9ca71e3bba7da6b9906319f6c40862be.1328492511.git.ludovic.desroches@atmel.com>
 <201202102340.46608.arnout@mind.be>
Message-ID: <20120215165104.GI4723@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Fri, Feb 10, 2012 at 11:40:46PM +0100, Arnout Vandecappelle wrote:
>    On Monday 06 February 2012 02:47:17 ludovic.desroches at atmel.com wrote:
> 
>    > From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
>    >
> 
>    > Behaviour of directories is changed: it is no more considered as an
>    overlay,
> 
>    > but rather a collection of patches. Subdirectories are not supported.
> 
>    Actually, I think the directory feature could be removed completely.
>    It's
> 
>    not used anywhere at the moment and I don't see why anyone would want
>    to use it.
> 

Even if this feature is not used, I think we have to keep it. For instance,
into an archive we may have several directories with patches into each of them.

>    > -# Check for rejects because if there are some, even if patches are
>    well
> 
>    > -# applied, at the end it will complain about rejects into builddir.
> 
>    > -if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')'
>    -print`" ] ; then
> 
>    > - echo "There are remaining reject files into ${builddir}, please
>    delete them."
> 
>    > -fi
> 
>    I still think it's better to keep these checks before the definition
> 
>    of the apply_patch function.
> 

Unintentional mistake, I will keep these checks.

> 
>    > + echo "Applying $patch using ${type}: "
> 
>    > + echo ${1} >> ${builddir}/.applied_patches_list
> 
>    Shouldn't this be 'echo $path/$patch' ? Not that it matters that
>    much...
> 

You're right, I have seen it after sending patches.

Regards

Ludovic
