From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Jan 2012 22:36:36 +0100
Subject: [Buildroot] [PATCH 13/14] libelementary: Add new package
In-Reply-To: <CAFbHwiTeF+Q5AT5hPws9M=S2cdtc6_Vq2mNcf+u8vu_7UksOBg@mail.gmail.com>
 (Will Newton's message of "Thu, 26 Jan 2012 17:42:56 +0000")
References: <CAFbHwiTeF+Q5AT5hPws9M=S2cdtc6_Vq2mNcf+u8vu_7UksOBg@mail.gmail.com>
Message-ID: <87aa56i42j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed with minor tweak, thanks.

 Will> diff --git a/package/efl/libelementary/Config.in
 Will> b/package/efl/libelementary/Config.in
 Will> new file mode 100644
 Will> index 0000000..507f142
 Will> --- /dev/null
 Will> +++ b/package/efl/libelementary/Config.in
 Will> @@ -0,0 +1,19 @@
 Will> +config BR2_PACKAGE_LIBELEMENTARY
 Will> +	bool "libelementary"
 Will> +	select BR2_PACKAGE_LIBEINA
 Will> +	select BR2_PACKAGE_LIBEVAS
 Will> +	select BR2_PACKAGE_LIBECORE
 Will> +	select BR2_PACKAGE_LIBEDJE
 Will> +	help
 Will> +	  Elementary is a widget toolkit and EFL wrapper and convenience
 Will> +	  library to make it easy to build applications and tools with UIs
 Will> +	  with less code.
 Will> +

Missing upstream URL.


 Will> +if BR2_PACKAGE_LIBELEMENTARY
 Will> +
 Will> +config BR2_PACKAGE_LIBELEMENTARY_EXAMPLES
 Will> +	bool "libelementary examples"
 Will> +	help
 Will> +	  Build and install the elemenatry examples.
 Will> +

I agree with Arnout here, so I dropped this option. Once this is fixed
upstream we can re-add it if you like.

 Will> b/package/efl/libelementary/libelementary-0.8.0.65643-examples1.patch
 Will> new file mode 100644
 Will> index 0000000..9b81ab6
 Will> --- /dev/null
 Will> +++ b/package/efl/libelementary/libelementary-0.8.0.65643-examples1.patch
 Will> @@ -0,0 +1,10 @@
 Will> +index_example01 requires a dict.txt file containing strings that does
 Will> not seem to be
 Will> +included in the snapshot. Add a dumym file to allow it to build.

Have these been sent upstream? Please add a git-style Signed-off-by line
in the patch header in the future.

-- 
Bye, Peter Korsgaard
