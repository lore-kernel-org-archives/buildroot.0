From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 May 2021 09:17:57 +0200
Subject: [Buildroot] [PATCH] support/testing: add sudo package test
In-Reply-To: <875yzqs5vu.fsf@dell.be.48ers.dk>
References: <20210505191344.2108832-1-arnout@mind.be>
 <875yzqs5vu.fsf@dell.be.48ers.dk>
Message-ID: <f5d85540-5ea8-f0dd-7de7-3e31cae0923f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/05/2021 22:14, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  > Create a new user 'sudotest' to validate that sudo really works (i.e.
>  > properly has setuid).
> 
>  > Creating the user and adding it to sudoers is done at runtime, otherwise
>  > we'd need to add extra files to the config which complicates things a
>  > little bit.
> 
>  > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  > ---
>  >  support/testing/tests/package/test_sudo.py | 36 ++++++++++++++++++++++
>  >  1 file changed, 36 insertions(+)
>  >  create mode 100644 support/testing/tests/package/test_sudo.py
> 
>  > diff --git a/support/testing/tests/package/test_sudo.py b/support/testing/tests/package/test_sudo.py
>  > new file mode 100644
>  > index 0000000000..f9d0a6f301
>  > --- /dev/null
>  > +++ b/support/testing/tests/package/test_sudo.py
>  > @@ -0,0 +1,36 @@
>  > +import os
>  > +
>  > +import infra.basetest
>  > +
>  > +
>  > +class TestSudo(infra.basetest.BRTest):
>  > +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>  > +        """
>  > +        BR2_PACKAGE_SUDO=y
>  > +        BR2_TARGET_ROOTFS_CPIO=y
>  > +        # BR2_TARGET_ROOTFS_TAR is not set
>  > +        """
> 
> initrd, so that implies writable rootfs - So we don't really need those
> special adduser flags, but OK.

 I'm not sure what you mean. Do you mean the flags to use /tmp as a home
directory? There was a reason I added those for a reason I think, but I forgot
why :-(

 Regards,
 Arnout

> 
> Committed, thanks.
> 
