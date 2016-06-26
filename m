From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Jun 2016 06:36:43 +0300
Subject: [Buildroot] 3 patches to buildroot via git send-email
In-Reply-To: <CAGrGpJD9MX_aNzwu357LziPAOMYLbHeQt=sKAukPCav2-anbog@mail.gmail.com>
References: <CAGrGpJD9MX_aNzwu357LziPAOMYLbHeQt=sKAukPCav2-anbog@mail.gmail.com>
Message-ID: <20160626033643.GB2319@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sat, Jun 25, 2016 at 09:20:04PM -0600, Peter Thompson wrote:
> I submitted 3 patches to buildroot via git send-email got sdl2_ttf,
> sdl2_image, sdl2_gfx.    I hope they arrived properly.    If not, please
> let me know.    Below are my personal notes I used to make the submission.

They all arrived. You can see them in the list archive at:

http://lists.busybox.net/pipermail/buildroot/2016-June/165082.html
http://lists.busybox.net/pipermail/buildroot/2016-June/165083.html
http://lists.busybox.net/pipermail/buildroot/2016-June/165084.html

The subject line for all these patches is wrong, though. It should be e.g.:

  sdl2_ttf: new package

The first line of your git commit log becomes the subject line when you 
generate an email with 'git format-patch'.

Hope this helps,
baruch

> -------------------  submit patch to Buildroot --------------
> see https://buildroot.org/downloads/manual/manual.html#submitting-patches
> see http://free-electrons.com/~thomas/buildroot/manual/html/ch02.html
> 
> Step 1 - Git buildroot from github
> ----------------------------------
> mkdir ~/Documents/git/buildroot/
> cd ~/Documents/git/buildroot/
> git clone git://git.buildroot.net/buildroot
> 
> cd ~/Documents/git/buildroot/buildroot/
> git status
> git branch -a
> git remote -v
> git remote show origin
> 
> 
> Step 2 - create 3 branches (1 per patch)
> -----------------------------------------
> git checkout master     # recheck original
> git branch sdl2_gfx
> git branch sdl2_image
> git branch sdl2_ttf
> git branch -a            #
> 
> 
> Step 3 - create patch, test, submit
> -----------------------------------------
> git checkout sdl2_image     #make changes see 09xpeterBuildrootPatchREADME
> git add package/sdl2_image/Config.in        # p17-19 git pro book
> git add package/sdl2_image/sdl2_image.mk
> git add package/Config.in
> git add -A                 # adds all files - don't use here...
> git status                # make sure you know what you are commiting
> git commit -as            # -as=all modified files with signoff
> rm *~                     # get rid of junk
> 
> 
> submit via
> https://buildroot.org/downloads/manual/manual.html#submitting-patches
> $ git fetch --all --tags    # update with latest buildroot version
> $ git rebase origin/master    # redo my commits on latest buildroot version
> $ git format-patch -M -n -s -o outgoing origin/master #format and send it
> $ git send-email --to buildroot at buildroot.org outgoing/*
> 
> repeat Step 3 for all sdl2-gfx, sdl2_image, sdl2_ttf

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
