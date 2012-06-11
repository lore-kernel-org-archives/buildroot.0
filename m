From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 11 Jun 2012 09:08:04 +0100
Subject: [Buildroot] [PATCH] synergy: Remove -Werror from CXXFLAGS
In-Reply-To: <87ipeygwlz.fsf@macbook.be.48ers.dk>
References: <1339063094-25298-1-git-send-email-markos.chandras@imgtec.com>
 <87ipeygwlz.fsf@macbook.be.48ers.dk>
Message-ID: <4FD5A764.4040200@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/2012 08:02 AM, Peter Korsgaard wrote:

>>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:
> 
>  Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>  Markos> ---
>  Markos>  package/synergy/synergy-1.3.1-remove-werror.patch |   29 +++++++++++++++++++++
>  Markos>  1 files changed, 29 insertions(+), 0 deletions(-)
>  Markos>  create mode 100644 package/synergy/synergy-1.3.1-remove-werror.patch
> 
>  Markos> diff --git a/package/synergy/synergy-1.3.1-remove-werror.patch b/package/synergy/synergy-1.3.1-remove-werror.patch
>  Markos> new file mode 100644
>  Markos> index 0000000..fe55778
>  Markos> --- /dev/null
>  Markos> +++ b/package/synergy/synergy-1.3.1-remove-werror.patch
>  Markos> @@ -0,0 +1,29 @@
>  Markos> +Remove -Werror from CXXFLAGS
>  Markos> +
>  Markos> +Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>  Markos> +
>  Markos> +Index: synergy-1.3.1/configure
>  Markos> +===================================================================
>  Markos> +--- synergy-1.3.1.orig/configure
>  Markos> ++++ synergy-1.3.1/configure
> 
> Please patch configure.ac (and ass SYNERGY_AUTORECONF = YES in
> synergy.mk) instead of the generated configure script.
> 
> Out of interest, on what configs do you see warnings? I haven't noticed
> any build errors on the autobuilder.
> 

Hi Peter,

There is no configure.ac in the sources and this is why I patched the
generated configure file.

As for the errors, I guess it depends on the toolchain and gcc version
that is being used. I am seeing something like this:

cc1plus: warnings being treated as errors
CTCPSocket.cpp: In member function 'virtual void CTCPSocket::write(const
void*, UInt32)':
CTCPSocket.cpp:143: warning: 'wasEmpty' may be used uninitialized in
this function

-- 
markos
