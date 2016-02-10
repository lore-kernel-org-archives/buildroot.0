From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Tue, 9 Feb 2016 22:27:17 -0300
Subject: [Buildroot] [PATCH v2] linux: add conditional patch for
 timeconst.pl
In-Reply-To: <56BA863D.3030600@mind.be>
References: <1454852508-27544-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <56BA718A.5060500@mind.be> <56BA73F2.7080009@free-electrons.com>
 <56BA863D.3030600@mind.be>
Message-ID: <56BA91F5.9050202@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/16 21:37, Arnout Vandecappelle wrote:

>   Well, you're already duplicating code because you first to patch and then
> APPLY_PATCHES. My idea was something like:
>
> 	$(Q)cd $(@D); patch -p1 -f -s >/dev/null 2>&1 \
> 		< $(LINUX_PKGDIR)/0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional \
> 		&& echo 0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional >
> .applied_patches_list
>
>   But really it's equally hacky so it doesn't matter much. Actually, my version
> is especially hacky because it relies on the fact that the patch has a single
> hunk so it will always pass or fail atomically.

Remember that this will leave a reject file behind for the case where 
the kernel is already patched (few releases, but still...)

>   I considered that as well, like making it handle *.conditional this way. But
> since this is the only patch for the time being, it's a bit redundant...
>
>
>   Bottom line: keep it as it is.

If the need arises with one or two more patches like this then yes, we 
can add some *.patch.maybe logic (personally i wouldn't call it 
conditional since a condition must be met, though 'maybe' sucks as well).
Regards.
