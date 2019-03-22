From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 22 Mar 2019 10:11:40 +0100
Subject: [Buildroot] [PATCH v3] package/optee-client: fix build warnings
 from 3.4.0
In-Reply-To: <1553166000-13510-1-git-send-email-etienne.carriere@linaro.org>
References: <1553166000-13510-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <CAN5uoS_=7DH4GDnfNXzziX-JD5C2Ptp2tmxqVk847vzEOiZW5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Mar 2019 at 12:00, Etienne Carriere
<etienne.carriere@linaro.org> wrote:
>
> Add a patch over current optee-client 3.4.0 to fix build issues
> reported by some toolchains with traces like:
>
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function 'TEEC_InitializeContext':
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:149:28: error: 'gen_caps' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     ctx->reg_mem = gen_caps & TEE_GEN_CAP_REG_MEM;
>                             ^
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_OpenSession?:
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:507:8: error: cast increases required alignment of target type [-Werror=cast-align]
>     arg = (struct tee_ioctl_open_session_arg *)buf;
>           ^
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_InvokeCommand?:
>   /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:581:8: error: cast increases required alignment of target type [-Werror=cast-align]
>     arg = (struct tee_ioctl_invoke_arg *)buf;
>
> The optee-client patch is under review in the OP-TEE project [1] and
> should be merged in the next OP-TEE release 3.5.0.
>
> Fixes [2], [3], [4] and other failing builds reported by autobuild tests.
>
> [1] https://github.com/OP-TEE/optee_client/pull/146
> [2] http://autobuild.buildroot.net/results/80e78cb0bb955e912d6cbe5b30c9b024e7efc802
> [3] http://autobuild.buildroot.net/results/a42c19897d03beb02fde2e7e6da25532be27d5ca
> [4] http://autobuild.buildroot.net/results/827087f91b7481d1c3effd615172bbee86317962
>
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> Changes v2 -> v3:
>   - Update patch from [1] outcome
>

This fix fails to build with CLang
(https://github.com/OP-TEE/optee_client/pull/153).
I will submit a v3 to get it fixed.

Regards,
etienne
