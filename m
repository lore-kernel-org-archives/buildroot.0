From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:46:19 +0200
Subject: [Buildroot] [PATCH 11/11] gst-plugins-base: fix handling of
 freetype
In-Reply-To: <20170404225019.27916-11-ricardo.martincoski@gmail.com>
References: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
 <20170404225019.27916-11-ricardo.martincoski@gmail.com>
Message-ID: <20170406224619.65661d4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Apr 2017 19:50:19 -0300, Ricardo Martincoski wrote:
> In 2010 commit 32d319e6f "gst-plugins-base: ensure <stdint.h> is used"
> introduced a typo (missing backslash) that made the code ineffective.
> 
> It can be confirmed by looking at the output of:
> $ make printvars | grep '^GST_PLUGINS_BASE_CONF_ENV\|^FT2_CONFIG'
> FT2_CONFIG=/bin/false ac_cv_header_stdint_t="stdint.h"
> GST_PLUGINS_BASE_CONF_ENV=
> 
> Add the missing backslash to fix the code.
> While at it, fix the indentation to use one tab instead of two.
> 
> The (end of the) diff of config.log confirms the code is still needed
> when the host has freetype-config installed:
>  1704c1702
>  < configure:22348: result: make use of stdint.h in _stdint.h (assuming C99 compatible system)
>  ---
>  > configure:22348: result: make use of stdint.h in _stdint.h  
>  2499,2500c2497
>  < configure:31316: found /usr/bin/freetype-config
>  < configure:31329: result: /usr/bin/freetype-config
>  ---
>  > configure:31329: result: /bin/false  
>  2820c2817
>  < ac_cv_path_FT2_CONFIG='/usr/bin/freetype-config'
>  ---
>  > ac_cv_path_FT2_CONFIG='/bin/false'  
>  2849d2845
>  < ac_cv_stdint_result='(assuming C99 compatible system)'
>  2996,2998c2992,2994
>  < FT2_CFLAGS='-I/usr/include/freetype2'
>  < FT2_CONFIG='/usr/bin/freetype-config'
>  < FT2_LIBS='-lfreetype'
>  ---
>  > FT2_CFLAGS=''
>  > FT2_CONFIG='/bin/false'
>  > FT2_LIBS=''  

The patch looks good, but this diff format is really unreadable. Could
you regenerate it with "diff -u" so that it becomes readable?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
