From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Tue, 12 Jul 2016 08:54:06 -0600
Subject: [Buildroot] 3 patches to buildroot via git send-email - 2nd try
Message-ID: <CAGrGpJBnpic0X+N07Uc33FQ1r+hpw8Fks4G8rTh4Z5PC1Yr2NQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

    Hope it works better this time.   Thanks for advice and help.  Let me
know if any other changes are needed.

Peter



Below are my personal notes used to create the 3 patches

Step 1 - Git buildroot from github
----------------------------------
mkdir ~/Documents/git/buildroot/
cd ~/Documents/git/buildroot/
git clone git://git.buildroot.net/buildroot

cd ~/Documents/git/buildroot/buildroot/
git status
git branch -a
git remote -v
git remote show origin


Step 2 - create 1 branch
-----------------------------------------
git checkout master     # recheck original
git branch sdl2suite
git branch -a            #
git branch
git status


Step 3 - create patch and commit x 3 (one per patch
-----------------------------------------
git checkout sdl2suite     #make changes see 09xpeterBuildrootPatchREADME
git add package/sdl2_image/Config.in        # p17-19 git pro book
git add package/sdl2_image/sdl2_image.mk
git add package/sdl2_image/sdl2_image.hash
git add package/Config.in
git add -A                 # adds all files - don't use here...
    make the changes (add 2 files plus change Config.in)
git status                # make sure you know what you are commiting
git commit -as            # -as=all modified files with signoff
    commit message =
sdl2_image: new package
sdl2_image created from sdl2_image with minor changes for sdl2


rm *~                     # get rid of junk

Step 4 create hash file
----------------------
download sdl2_image via firefox
cd ~/Downloads/FirefoxDownloads/
sha256sum SDL2_ttf-2.0.14.tar.gz  > sdl2_ttf.hash
     edit sdle_ttf.hash file as per below....
# Locally calculated
sha256 a5a69a6abf80bcce713fa873607735fe712f44276a7f048d60a61bb2f6b3c90c
SDL2-2.0.3.tar.gz
add sdl2_ttf.hash to sdl2suite branch


Step 5
------
repeat step 3,4 (3 times) for
sdl2_gfx
sdl2_image
sdl2_ttf



https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

Step 6 submit
-------------
submit via
https://buildroot.org/downloads/manual/manual.html#submitting-patches
$ git fetch --all --tags    # update with latest buildroot version
$ git rebase origin/master    # redo my commits on latest buildroot version
$ git format-patch -M -n -s -o outgoing origin/master
        # -M = detect renames???
        # -n = Name output in [PATCH n/m] format = [PATCH 1/1]
        # -s = signed off
        # -o = output
test the results...
git send-email --to peter.macleod.thompson at gmail.com outgoing/*
submit it....
$ git send-email --to buildroot at buildroot.org outgoing/*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160712/58103474/attachment.html>
