From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 23 Jun 2017 23:57:36 +0200
Subject: [Buildroot] [PATCH 3/3] docs/manual: document hashes for
 license files
In-Reply-To: <41013c99543173da1ec547219c7f67e52d323a40.1497772831.git.yann.morin.1998@free.fr>
References: <cover.1497772831.git.yann.morin.1998@free.fr>
 <41013c99543173da1ec547219c7f67e52d323a40.1497772831.git.yann.morin.1998@free.fr>
Message-ID: <53055153-3e6a-c7ae-0e39-3fcea6476669@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 18/06/2017 10:01, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  docs/manual/adding-packages-directory.txt | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 08f5d42f91..5007d5368d 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -443,7 +443,7 @@ Optionally, you can add a third file, named +libfoo.hash+, that contains
>  the hashes of the downloaded files for the +libfoo+ package.
>  
>  The hashes stored in that file are used to validate the integrity of the
> -downloaded files.
> +downloaded files and of the license files.
>  
>  The format of this file is one line for each file for which to check the
>  hash, each line being space-separated, with these three fields:
> @@ -458,7 +458,10 @@ hash, each line being space-separated, with these three fields:
>  ** for +sha256+, 64 hexadecimal characters
>  ** for +sha384+, 96 hexadecimal characters
>  ** for +sha512+, 128 hexadecimal characters
> -* the name of the file, without any directory component
> +* the name of the file:
> +** for a source archive: the basename of the file, without any directory
> +   component,
> +** for a license file: the path as it appears in +FOO_LICENSE_FILES+.
>  
>  Lines starting with a +#+ sign are considered comments, and ignored. Empty
>  lines are ignored.
> @@ -476,6 +479,11 @@ strong hash yourself (preferably +sha256+, but not +md5+), and mention
>  this in a comment line above the hashes.
>  
>  .Note
> +The hashes for license files are used to detect a license change when a
> +package version is bumped, so a (relatively) weak hash like +sha1+ is
> +enough for license files.

I wouldn't spend words to say people can use a weak hash in this case.
What's the advantage if they use weak hashes? Not computational time,
hash files are usually small. Not ease of use: typing 'sha256sum' is not
more difficult than 'md5sum'.

So I'd just drop that note.

-- 
Luca
