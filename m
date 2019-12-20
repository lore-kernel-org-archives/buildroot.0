From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Dec 2019 22:29:10 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libfreeimage: bump version
 to 3.18.0
In-Reply-To: <eggvcgxq94.ln2@ID-313208.user.individual.net>
References: <20190831140614.16535-1-bernd.kuhls@t-online.de>
 <a0739047-1060-f748-735e-9d48af314243@benettiengineering.com>
 <eggvcgxq94.ln2@ID-313208.user.individual.net>
Message-ID: <c788b5fb-56e2-eb13-a2f6-f22bf849c23f@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On 12/20/19 7:29 PM, Bernd Kuhls wrote:
> Am Fri, 20 Dec 2019 17:09:43 +0100 schrieb Giulio Benetti:
> 
>> Can you please rebase against master branch and send a v2? Because I
>> can't apply this patch anymore and I was going to review it.
> 
> Hi Giulio,
> 
> the patch still applies to master, no rebase needed. The problem you are
> seeing results from the DOS linebreaks present in the patch files removed
> by my patch. These DOS linebreaks are present in the patch created by git
> format-patch but are lost when sent to patchworks.
> 
> When applying my patch you need to remove the libfreeimage patches
> manually:
> 
> $ wget http://patchwork.ozlabs.org/patch/1156184/mbox/ -O - | git am
> 
> $ git rm package/libfreeimage/0003-LibWebP-fix-compilation-issue-with-
> GCC-5.x-C-11.patch package/libfreeimage/0004-fix-gcc-6.patch package/
> libfreeimage/0005-Manage-powf64-with-glibc.patch
> 
> $ git am --continue
> Applying: package/libfreeimage: bump version to 3.18.0

I've succesfully applied your patch, but the way you've pointed only 
remove the 3 patches using patch's commit log. So I needed to create a 
patch where I remove the 3 patches and then modify your patch removing 
the "removing" of the 3 patches, then squash and it worked.

Unfortunately it fails on applying the patch:
0003-fix-big-endian-os.patch
with:
'''
Applying 0003-fix-big-endian-os.patch using patch:
patching file Source/FreeImage/PluginBMP.cpp
Hunk #1 FAILED at 518 (different line endings).
Hunk #2 FAILED at 1419 (different line endings).
Hunk #3 FAILED at 1440 (different line endings).
Hunk #4 FAILED at 1461 (different line endings).
4 out of 4 hunks FAILED -- saving rejects to file 
Source/FreeImage/PluginBMP.cpp.rej
patching file Source/FreeImage/PluginDDS.cpp
Hunk #1 FAILED at 356 (different line endings).
1 out of 1 hunk FAILED -- saving rejects to file 
Source/FreeImage/PluginDDS.cpp.rej
'''

and this is due to the fact that upstream sources have DOS newlines, but 
only certain files...., this is why patches 0001 and 0002 work even if 
they have unix newlines.

Anyway I've applied successfully your patch too(you only need to change 
newlines in DOS on 0003 patch on source lines) and it built correctly.

So please send a v2 with patch 0003-fix-big-endian-os.patch with DOS 
newlines.

Thank you

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
