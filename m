From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 11:26:00 +0300
Subject: [Buildroot] [PATCH v2 1/4] support/scripts: add fix_rpaths
In-Reply-To: <1436775527-2484-2-git-send-email-s.martin49@gmail.com>
References: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
 <1436775527-2484-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150713082600.GH2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Mon, Jul 13, 2015 at 10:18:44AM +0200, Samuel Martin wrote:
> This pyhton script leverages patchelf program to fix the RPATH of binaries.
> 
> It offers 2 actions:
> - clear the RPATH;
> - set the RPATH using relative paths between every single binary and the
>   libraries directories.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  support/scripts/fix_rpaths | 302 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 302 insertions(+)
>  create mode 100755 support/scripts/fix_rpaths
> 
> diff --git a/support/scripts/fix_rpaths b/support/scripts/fix_rpaths
> new file mode 100755
> index 0000000..1c840e0
> --- /dev/null
> +++ b/support/scripts/fix_rpaths
> @@ -0,0 +1,302 @@
> +#!/usr/bin/env python
> +##
> +## Author(s):
> +##  - Samuel Martin <s.martin49@gmail.com>
> +##
> +## Copyright (C) 2013 Samuel Martin
> +##
> +## This program is free software; you can redistribute it and/or modify
> +## it under the terms of the GNU General Public License as published by
> +## the Free Software Foundation; either version 2 of the License, or
> +## (at your option) any later version.
> +##
> +## This program is distributed in the hope that it will be useful,
> +## but WITHOUT ANY WARRANTY; without even the implied warranty of
> +## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +## GNU General Public License for more details.
> +##
> +## You should have received a copy of the GNU General Public License
> +## along with this program; if not, write to the Free Software
> +## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> +##

Please remove the FSF address paragraph. The address is old already, and may 
change again in the future.

> +""" This script scans a direcotry for EFL files and fix their RPATH, making
> +them relative.
> +"""

EFL files?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
