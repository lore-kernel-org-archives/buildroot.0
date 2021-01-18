From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:07:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/sudo: security bump to version
 1.9.5p1
In-Reply-To: <20210117211038.487795-1-fontaine.fabrice@gmail.com>
References: <20210117211038.487795-1-fontaine.fabrice@gmail.com>
Message-ID: <20210118220714.55c336d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Jan 2021 22:10:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fixes CVE-2021-23239, a potential information leak in sudoedit that
>   could be used to test for the existence of directories not normally
>   accessible to the user in certain circumstances. When creating a new
>   file, sudoedit checks to make sure the parent directory of the new
>   file exists before running the editor. However, a race condition
>   exists if the invoking user can replace (or create) the parent
>   directory. If a symbolic link is created in place of the parent
>   directory, sudoedit will run the editor as long as the target of the
>   link exists. If the target of the link does not exist, an error
>   message will be displayed. The race condition can be used to test for
>   the existence of an arbitrary directory. However, it cannot be used to
>   write to an arbitrary location.
> - Fixes CVE-2021-23240, a flaw in the temporary file handling of
>   sudoedit's SELinux RBAC support. On systems where SELinux is enabled,
>   a user with sudoedit permissions may be able to set the owner of an
>   arbitrary file to the user-ID of the target user. On Linux kernels
>   that support protected symlinks setting
>   /proc/sys/fs/protected_symlinks to 1 will prevent the bug from being
>   exploited. For more information, see Symbolic link attack in
>   SELinux-enabled sudoedit.
> - Update license hash:
>   - copyright of python bindings added with
>     https://github.com/sudo-project/sudo/commit/6c1b155fed23348c58a03f6c1193922132b5b66a
>   - a few other files (ISC licenced) added with
>     https://github.com/sudo-project/sudo/commit/d4b2db9078bd54f158261017dcb4d1340398a5fa
>   - year updated with
>     https://github.com/sudo-project/sudo/commit/9e111eae57524ca72002ad1db36eb68ccd50b167
> - Update indentation in hash file (two spaces)
> 
> https://www.sudo.ws/stable.html#1.9.5p1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sudo/sudo.hash | 4 ++--
>  package/sudo/sudo.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
