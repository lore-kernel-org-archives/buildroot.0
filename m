From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 20 Jun 2013 21:21:38 +0100
Subject: [Buildroot] [PATCH v2] wvstreams: Pass -fPIC to CFLAGS when
	building PIC objects
In-Reply-To: <87ehbwom8i.fsf@dell.be.48ers.dk>
References: <1371737650-12310-1-git-send-email-markos.chandras@gmail.com>
 <87ehbwom8i.fsf@dell.be.48ers.dk>
Message-ID: <CAG2jQ8hTJZ_PrCPHVxEHGDvQN5Th+h7xWDhyAOJ8Tp_QnUAuuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 June 2013 16:06, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:
>
>  Markos> From: Markos Chandras <markos.chandras@imgtec.com>
>  Markos> The argp bundled dependency which is linked to the libwvutils.so
>  Markos> shared library, wasn't built with -fPIC.
>  Markos> MIPS will refuce to link a non-PIC library with a shared one.
>
>  Markos> We fix this problem by appending -fPIC to CFLAGS and build all the
>  Markos> shared objects with -fPIC.
>
>  Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>  Markos> ---
>  Markos>  package/wvstreams/wvstreams.mk | 4 ++++
>  Markos>  1 file changed, 4 insertions(+)
>
>  Markos> diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
>  Markos> index 65f48d4..fddaad7 100644
>  Markos> --- a/package/wvstreams/wvstreams.mk
>  Markos> +++ b/package/wvstreams/wvstreams.mk
>  Markos> @@ -27,6 +27,10 @@ WVSTREAMS_CONF_OPT += \
>  Markos>  # needed for openssl detection when statically linking (as ssl needs lz)
>  Markos>  WVSTREAMS_CONF_ENV += LIBS=-lz
>
>  Markos> +ifneq ($(BR2_PREFER_STATIC_LIB),y)
>  Markos> +      WVSTREAMS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
>
> Committed with this changed to a +=, thanks.
>
> --
> Bye, Peter Korsgaard

Thank you Peter

--
Regards,
Markos Chandras
