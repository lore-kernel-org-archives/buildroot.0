From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 3 Nov 2020 18:50:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/optee-client: fix build with
 gcc 4.8
In-Reply-To: <20201103173043.29373-1-fontaine.fabrice@gmail.com>
References: <20201103173043.29373-1-fontaine.fabrice@gmail.com>
Message-ID: <CAN5uoS_vwpka6+8g13_f=WrmeEhM9m65N3sEMpMq0Y9XY83nHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks for fixes.

Regards,
Etienne


On Tue, 3 Nov 2020 at 18:31, Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fix the following build failure with optee-client 3.11.0 and gcc 4.8:
>
> /home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c: In function 'ck_create_object':
> /home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c:22:9: error: missing initializer for field 'buffer' of 'struct serializer' [-Werror=missing-field-initializers]
>   struct serializer obj = { };
>          ^
>
> Build failure is raised since version 3.10.0 and
> https://github.com/OP-TEE/optee_client/commit/c3279f424348bdd3378d236fd038fdd7bc76e10a
> https://github.com/OP-TEE/optee_client/commit/e88c264ba358941d2166b18eeac448e617ffa887
> https://github.com/OP-TEE/optee_client/commit/85a7ea7861339356b39c73926f2b5cb9added45b
>
> Fixes:
>  - http://autobuild.buildroot.org/results/a3d663adb943aee814180f01d6e153b3309be962
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-libckteec-replace-initializer.patch  | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
> (...)
