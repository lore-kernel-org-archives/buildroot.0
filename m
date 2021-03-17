From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 19:57:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/optee-client: disable -Werror
In-Reply-To: <20210306225353.GX2275@scaer> (Yann E. MORIN's message of "Sat, 6
 Mar 2021 23:53:53 +0100")
References: <20201101204349.2553267-1-fontaine.fabrice@gmail.com>
 <20210306225353.GX2275@scaer>
Message-ID: <8735wty5ea.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabrice, All,
 > On 2020-11-01 21:43 +0100, Fabrice Fontaine spake thusly:
 >> Disable -Werror thanks to CFG_WERROR which is available since version
 >> 3.3.0 and
 >> https://github.com/OP-TEE/optee_client/commit/5355fdb841bce4f7cce3dd37fc31fa91bd625c98
 >> to fix the following build failure with optee-client 3.11.0:
 >> 
 >> /home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c: In function 'ck_create_object':
 >> /home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c:22:9: error: missing initializer for field 'buffer' of 'struct serializer' [-Werror=missing-field-initializers]
 >> struct serializer obj = { };
 >> ^
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/a3d663adb943aee814180f01d6e153b3309be962
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > After reading the thread, I decided to apply this (oldish) patch to
 > next.

 > Indeed, as you mentionned in the thread, we do try to remove -Werror
 > when we hit issues with it.

 > -Werror is very important for the developpers of a package, because they
 > indeed can find and fix their code as early as possible.

 > But for downstreams, that does not help at all, especially since there
 > are a myriad of possible combination of binutils versions, compiler
 > versins, C libraries flavours and versions, optimisations flags and
 > architectures, that it is virtually impossible to guarantee a no-warning
 > build on all those combinations, especially when a new version of any of
 > those gets out.

 > So, applied to next, thanks.

Committed to 2021.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
