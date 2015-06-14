From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 17:56:43 +0200
Subject: [Buildroot] [PATCHv2 15/15] fs/iso9660: add support for grub2
In-Reply-To: <1433802108-14351-16-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-16-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614155643.GN3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-09 00:21 +0200, Thomas Petazzoni spake thusly:
> After having extended the iso9660 support to allow isolinux as an
> alternative to grub, this commit adds grub2 as a third
> alternative. With the previous work done to support isolinux, adding
> support for grub2 is fairly trivial.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, see a small comment, below...

[--SNIP--]
> diff --git a/fs/iso9660/grub.cfg b/fs/iso9660/grub.cfg
> new file mode 100644
> index 0000000..90e1039
> --- /dev/null
> +++ b/fs/iso9660/grub.cfg
> @@ -0,0 +1,7 @@
> +set default="0"
> +set timeout="5"

For grub, the timeout is 10s. I don't mind which value we use, I don't
even really mind they differ, but do we maybe want some consistency? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
