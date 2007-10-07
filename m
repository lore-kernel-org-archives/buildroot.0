From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 7 Oct 2007 18:35:00 +0200
Subject: [Buildroot] Several issues by a buildroot newbie...
In-Reply-To: <4704186D.6070303@cavebear.com>
References: <4704186D.6070303@cavebear.com>
Message-ID: <20071007163500.GK20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 03, 2007 at 03:32:13PM -0700, Karl Auerbach wrote:
>I'm fairly new to buildroot so please excuse me if I inadvertently touch 
>something that has been raised previously:
>
>1. Undefined reference in uClibc:
>    In function `__libc_pthread_init':
>    libc_pthread_init.c:(.text+0xf): undefined reference to
>    `__libc_multiple_threads'

Which version of pthreads do you use?
>
>    I dug through the code and it appears that the missing variable is 
>used as a return value for __libc_pthread_init() but that that return 
>value appears to be squirreled away and perhaps never used.
>
>   In any event, this is, I suspect the cause of the next item, below.
[snip python]

>3. The sudo sources aren't available via the URL given in the 
>package/sudo/sudo.mk.  The site, http://www.courtesan.com/sudo/dist, has 
>upgraded to a newer version and the older one to be downloaded appears 
>no longer on that site.

It should be updated, yes. Please submit a tested patch. TIA.
>
>4. The lockfile-progs.c (in package lockfile-progs) uses rindex() but 
>does not include the correct header file that defines it.  This can be 
>repaired by a patch that either changes rindex() to strrchr() or 
>including the correct header.  (I did the former.)

Please submit a patch to use strrchr.

thanks,
