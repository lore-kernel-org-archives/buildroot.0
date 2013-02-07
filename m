From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 07 Feb 2013 18:44:49 +0100
Subject: [Buildroot] [PATCH 1/3] Documentation update : add tips to
 build manual,
 add information about buildroot toolchain not being relocable and put some
 hints to use it,
 move the Beyond Buildroot section before FAQs and add content
In-Reply-To: <1360097491-20121-1-git-send-email-contact@team-ard.com>
References: <1360097491-20121-1-git-send-email-contact@team-ard.com>
Message-ID: <5113E811.2050003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Willy,

  When there are review comments you want to integrate, you should still 
send it as a single patch. You can update an existing patch by doing 'git 
commit --amend' instead of a single commit. Or, if you committed it in 
pieces, you can use 'git rebase -i origin/master'. That will give you an 
editor where you can tell git what to do with each patch. Select 'reword' 
for the first patch, and 'fixup' for the subsequent patches.

  The patch comment should be wrapped at 75 columns. It should look more 
or less as follows:

<<<<<<
manual: extend "Beyond buildroot" section

* Explain how to create a bootable disk image for PC.
* Explain how to use PXE + NFS-root

Signed-off-by: ...
---
v3: [new things in v3]
v2: [new things in v2]
 >>>>>>

In other words: a title that fits on a 75-column line, then one  or more 
paragraphs of explanation, then your Sob, then a line with three dashes, 
and then any other comments that shouldn't go into the git history, e.g. 
your patch changelog. The text after the three dashes is removed 
automatically when the patch is applied by git-am.

  As someone else noted before on the list, this patch is doing three 
things so it should really be three patches. Splitting a patch is a bit 
more complex in git, but here goes.

git log --oneline -1
# This prints something like:
# 123abcd manual: extend "Beyond buildroot" section
# note the commit ID (123abcd in this example).
git reset HEAD^
# Now you have undone the commit.
git add -p
# This allows you to interactively select which things you want to have
# committed in this patch. Use '?' for help.
git commit -c 123abcd # commit ID you noted before
# This makes a commit and reuses the commit message you had before.
git add -p
git commit
...


  I'm not going to comment on the patch itself, it's too difficult when 
it has such long lines and with the extra 'review modifications'. I will 
comment when you resend, though.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
