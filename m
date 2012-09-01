From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Sep 2012 00:54:51 +0200
Subject: [Buildroot] [PATCH 3/5] gettext: remove libintl handling
In-Reply-To: <7baa3f68f46df9cb2c70c264cc0d550f349e2fdc.1342732829.git.thomas.petazzoni@free-electrons.com>
References: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
 <7baa3f68f46df9cb2c70c264cc0d550f349e2fdc.1342732829.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201209020054.51337.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 19 July 2012 23:21:02 Thomas Petazzoni wrote:
> Now, the gettext package always:
> 
>  * install everything to the staging directory
>  * install the libraries to the target directory
> 
> Note that this commit removes BR2_PACKAGE_LIBINTL without updating the
> packages, it is done in a separate commit to ease the review process.
[--SNIP--]
> -config BR2_PACKAGE_LIBINTL
> -	bool "libintl"
> -	depends on BR2_NEEDS_GETTEXT
> -	depends on BR2_USE_WCHAR
> -	help
> -	  Selecting this package installs all of gettext in the staging
> -	  directory and the shared library for it's use in the target.
> -
> -	  http://www.gnu.org/software/gettext/

To avoid breaking the menuconfig, what about:

 config BR2_PACKAGE_LIBINTL
-	bool "libintl"
-	depends on BR2_NEEDS_GETTEXT
-	depends on BR2_USE_WCHAR
-	help
-	  Selecting this package installs all of gettext in the staging
-	  directory and the shared library for it's use in the target.
-
-	  http://www.gnu.org/software/gettext/
+	bool

Thus, we keep an blind config option that can still be selected, although
there is nothing in gettext.mk that uses it, and we do not break the
other packages.

Then, it can be removed entirely in the next patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
