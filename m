From: sjhill at realitydiluted.com <sjhill@realitydiluted.com>
Date: Thu, 17 Apr 2008 08:35:34 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/package/sfdisk
In-Reply-To: <20080417132321.210B43C4FC@busybox.net>
References: <20080417132321.210B43C4FC@busybox.net>
Message-ID: <20080417133534.GA32044@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 17, 2008 at 06:23:21AM -0700, nkukard at uclibc.org wrote:
> Author: nkukard
> Date: 2008-04-17 06:23:20 -0700 (Thu, 17 Apr 2008)
> New Revision: 21754
> 
> Log:
> * Fix _llseek not being defined in some cases
> * Add index & rindex defines if they're not defined either (legacy susv4 functions)
> 
> 
> Added:
>    trunk/buildroot/package/sfdisk/sfdisk.005.no-llseek-fix.patch
>    trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch
> 
Please revert the index/rindex patch. You should be patching the code to
NOT use those functions, not define them again. Remove the usage of them
and then submit a patch to the upstream maintainer of sfdisk.

-Steve
