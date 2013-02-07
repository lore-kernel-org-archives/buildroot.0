From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Feb 2013 14:39:34 +0100
Subject: [Buildroot] Extend and use the <pkg>_CONFIG_FIXUP infra
In-Reply-To: <1360192218-30930-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360192218-30930-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130207143934.5a335849@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

In the following patch series, if we agree on "[PATCH 1/5] package:
rename <pkg>_CONFIG_FIXUP to <pkg>_CONFIG_SCRIPTS", then I believe it
would be better to take it for 2013.02 so that we don't have
<pkg>_CONFIG_FIXUP introduced in 2013.02 and then later a rename of
this new variable.

However, the other patches, 2 to 5, should probably not be taken for
2013.02, but only applied to -next once it opens.

Best regards,

Thomas

On Thu,  7 Feb 2013 00:10:13 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> This patch series improves on the <pkg>_CONFIG_FIXUP work done by
> Stefan Fr?berg by:
> 
>  * Renaming the variable to <pkg>_CONFIG_SCRIPTS. I believe this is
>    needed, because we will not only "fixup" those files, but also
>    remove them from the target directory. Also, I don't think the
>    variable name should indicate what will happen to these files. It
>    should just indicate what those files are.
> 
>  * Extending the <pkg>_CONFIG_SCRIPTS handling to remove the config
>    scripts from the TARGET_DIR, unless BR2_HAVE_DEVFILES is set (even
>    though it is deprecated, it is still here).
> 
>  * Use <pkg>_CONFIG_SCRIPTS in a number of packages that were already
>    fixing manually their <foo>-config script and for which the new
>    infrastructure does exactly the same thing.
> 
>  * Use <pkg>_CONFIG_SCRIPTS in a number of packages that were doing a
>    bit more than the infrastructure: fixing the includedir and libdir
>    fields. A manual inspection of each of those packages shows that by
>    default, the includedir and libdir are described relatively to
>    prefix and exec_prefix, so fixing up those is sufficient, and this
>    is what the infrastructure does.
> 
>  * Use <pkg>_CONFIG_SCRIPTS to fix up gpg-error-config installed by
>    the libgpg-error package. This is done separately from the previous
>    patch, because libgpg-error was not previously doing any fix up of
>    its gpg-error-config script.
> 
> Best regards,
> 
> Thomas
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
