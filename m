From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 22:51:16 +0100
Subject: [Buildroot] [PATCH 1/1] target-finalize: Use NULL deliminators
 when stripping the target directory.
In-Reply-To: <1426691429-38936-1-git-send-email-andrewp@carallon.com>
References: <1426691429-38936-1-git-send-email-andrewp@carallon.com>
Message-ID: <20150320225116.0fb49a30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew,

On Wed, 18 Mar 2015 15:10:29 +0000, andrewp at carallon.com wrote:
> From: Andrew Parlane <andrewp@carallon.com>
> 
> Special characters in files or directories in the rootfs can cause problems when stripping files.
> For example "target/some song.mp3" gets treated as two entries. "target/some" and "song.mp3" are both passed to $(STRIPCMD). This then errors saying files don't exist.
> 
> Additionally a ' and possibly other special characters in a file path causes xargs to give the error: "xargs: unmatched single quote; by default quotes are special to xargs unless you use the -0 option". This also has the effect of removing this entry and further entries from the list of files to strip.
> This can be demonstrated by having a test directory with the files: "cat" "rabbit's" "elephant". then running the command: "find -name "*" -print | xargs"
> 
> To fix this we pass -print0 to find which seperates entries with a NULL character, and we pass -0 to xargs to tell it to only use NULL characters as the deliminator.
> 
> Signed-off-by: Andrew Parlane <andrewp@carallon.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I rewraped the lines of your commit log that were way too long, and
applied your patch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
