From: Alvaro G. M. <alvaro.gamez@hazent.com>
Date: Thu, 15 Dec 2016 12:09:22 +0100
Subject: [Buildroot] Error compiling host-python after distro upgrade
Message-ID: <20161215110922.oxbto23mn2vavlmq@collins.gmr.ssr.upm.es>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi,

After upgrading my debian machine to latest 'sid' status, I can no longer
compile host-python 2.7.11 from buildroot commit a0997f4.

I know there has been some changes in gcc lately that could make this
happen, but the thing is that I'm still using 'gcc version 4.9.3 (Debian
4.9.3-12)'. I have available another machine with a non upgraded debian
distro with an almost equal 'gcc version 4.9.3 (Debian 4.9.3-10)' in which
python builds succesfully.

So... do you guys know what's the cause for this? A solution that
doesn't involve upgrading buildroot, which I've already thought of but that
I cannot do right now for reasons, would also be greatly appreciated.

Thanks!

make -C /home/agamez/test/buildroot  O=/home/agamez/test/output BR2_EXTERNAL=/home/agamez/test PROJECT_NAME=TEST BR2_DEFCONFIG=/home/agamez/test/defconfig defconfig
  GEN     /home/agamez/test/output/Makefile
#
# configuration written to /home/agamez/test/output/.config
#
make -C /home/agamez/test/buildroot  O=/home/agamez/test/output BR2_EXTERNAL=/home/agamez/test PROJECT_NAME=TEST BR2_DEFCONFIG=/home/agamez/test/defconfig
/usr/bin/make -j1 O=/home/agamez/test/output HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" silentoldconfig
  GEN     /home/agamez/test/output/Makefile
BR2_DEFCONFIG='/home/agamez/test/defconfig' KCONFIG_AUTOCONFIG=/home/agamez/test/output/build/buildroot-config/auto.conf KCONFIG_AUTOHEADER=/home/agamez/test/output/build/buildroot-config/autoconf.h KCONFIG_TRISTATE=/home/agamez/test/output/build/buildroot-config/tristate.config BR2_CONFIG=/home/agamez/test/output/.config BR2_EXTERNAL=/home/agamez/test HOST_GCC_VERSION="4 9" SKIP_LEGACY= /home/agamez/test/output/build/buildroot-config/conf --silentoldconfig Config.in
[7m>>> host-python 2.7.11 Building[27m
PATH="/home/agamez/test/output/host/bin:/home/agamez/test/output/host/sbin:/home/agamez/test/output/host/usr/bin:/home/agamez/test/output/host/usr/sbin:/home/agamez/android-sdk-update-manager/platform-tools/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/EMPIRE-XCcel:/usr/local/ADS2013_06/bin:/home/agamez/bin:/usr/NX/bin" PKG_CONFIG="/home/agamez/test/output/host/usr/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_LIBDIR="/home/agamez/test/output/host/usr/lib/pkgconfig"  /usr/bin/make -j1  -C /home/agamez/test/output/build/host-python-2.7.11/
running build
running build_ext
INFO: Can't locate Tcl/Tk libs and/or headers
building '_ssl' extension
/usr/bin/gcc -pthread -fPIC -fno-strict-aliasing -O2 -I/home/agamez/test/output/host/usr/include -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -I. -IInclude -I./Include -I/home/agamez/test/output/host/usr/include -I/usr/include/x86_64-linux-gnu -I/usr/local/include -I/home/agamez/test/output/build/host-python-2.7.11/Include -I/home/agamez/test/output/build/host-python-2.7.11 -c /home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c -o build/temp.linux-x86_64-2.7/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.o
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?_create_tuple_for_X509_NAME?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:684:35: error: dereferencing pointer to incomplete type
             if (rdn_level != entry->set) {
                                   ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:701:26: error: dereferencing pointer to incomplete type
         rdn_level = entry->set;
                          ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?_get_peer_alt_names?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:804:16: error: dereferencing pointer to incomplete type
         p = ext->value->data;
                ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:809:33: error: dereferencing pointer to incomplete type
                              ext->value->length,
                                 ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:815:31: error: dereferencing pointer to incomplete type
                            ext->value->length));
                               ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:876:17: warning: ?ASN1_STRING_data? is deprecated (declared at /usr/include/openssl/asn1.h:553) [-Wdeprecated-declarations]
                 v = PyString_FromStringAndSize((char *)ASN1_STRING_data(as),
                 ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?_get_crl_dp?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:1029:22: error: dereferencing pointer to incomplete type
     dps = certificate->crldp;
                      ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?PySSL_compression?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:1446:43: error: dereferencing pointer to incomplete type
     if (comp_method == NULL || comp_method->type == NID_undef)
                                           ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:1448:40: error: dereferencing pointer to incomplete type
     short_name = OBJ_nid2sn(comp_method->type);
                                        ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?context_new?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:1997:9: warning: ?TLSv1_method? is deprecated (declared at /usr/include/openssl/ssl.h:1596) [-Wdeprecated-declarations]
         ctx = SSL_CTX_new(TLSv1_method());
         ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2000:9: warning: ?TLSv1_1_method? is deprecated (declared at /usr/include/openssl/ssl.h:1602) [-Wdeprecated-declarations]
         ctx = SSL_CTX_new(TLSv1_1_method());
         ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2002:9: warning: ?TLSv1_2_method? is deprecated (declared at /usr/include/openssl/ssl.h:1608) [-Wdeprecated-declarations]
         ctx = SSL_CTX_new(TLSv1_2_method());
         ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2010:9: warning: implicit declaration of function ?SSLv2_method? [-Wimplicit-function-declaration]
         ctx = SSL_CTX_new(SSLv2_method());
         ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2010:27: warning: passing argument 1 of ?SSL_CTX_new? makes pointer from integer without a cast
         ctx = SSL_CTX_new(SSLv2_method());
                           ^
In file included from /home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:61:0:
/usr/include/openssl/ssl.h:1302:17: note: expected ?const struct SSL_METHOD *? but argument is of type ?int?
 __owur SSL_CTX *SSL_CTX_new(const SSL_METHOD *meth);
                 ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?get_verify_flags?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2331:46: error: dereferencing pointer to incomplete type
     flags = X509_VERIFY_PARAM_get_flags(store->param);
                                              ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?set_verify_flags?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2344:46: error: dereferencing pointer to incomplete type
     flags = X509_VERIFY_PARAM_get_flags(store->param);
                                              ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2348:49: error: dereferencing pointer to incomplete type
         if (!X509_VERIFY_PARAM_clear_flags(store->param, clear)) {
                                                 ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2354:47: error: dereferencing pointer to incomplete type
         if (!X509_VERIFY_PARAM_set_flags(store->param, set)) {
                                               ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?load_cert_chain?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2529:48: error: dereferencing pointer to incomplete type
     pem_password_cb *orig_passwd_cb = self->ctx->default_passwd_callback;
                                                ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2530:43: error: dereferencing pointer to incomplete type
     void *orig_passwd_userdata = self->ctx->default_passwd_callback_userdata;
                                           ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?_add_ca_certs?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2664:47: error: dereferencing pointer to incomplete type
                                      self->ctx->default_passwd_callback,
                                               ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:2665:47: error: dereferencing pointer to incomplete type
                                      self->ctx->default_passwd_callback_userdata);
                                               ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?cert_store_stats?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3154:45: error: dereferencing pointer to incomplete type
     for (i = 0; i < sk_X509_OBJECT_num(store->objs); i++) {
                                             ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3155:41: error: dereferencing pointer to incomplete type
         obj = sk_X509_OBJECT_value(store->objs, i);
                                         ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3156:20: error: dereferencing pointer to incomplete type
         switch (obj->type) {
                    ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3159:38: error: dereferencing pointer to incomplete type
                 if (X509_check_ca(obj->data.x509)) {
                                      ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3166:18: error: ?X509_LU_PKEY? undeclared (first use in this function)
             case X509_LU_PKEY:
                  ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3166:18: note: each undeclared identifier is reported only once for each function it appears in
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: In function ?get_ca_certs?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3211:45: error: dereferencing pointer to incomplete type
     for (i = 0; i < sk_X509_OBJECT_num(store->objs); i++) {
                                             ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3215:41: error: dereferencing pointer to incomplete type
         obj = sk_X509_OBJECT_value(store->objs, i);
                                         ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3216:16: error: dereferencing pointer to incomplete type
         if (obj->type != X509_LU_X509) {
                ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3221:19: error: dereferencing pointer to incomplete type
         cert = obj->data.x509;
                   ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c: At top level:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3838:1: warning: ?_ssl_threadid_callback? defined but not used [-Wunused-function]
 _ssl_threadid_callback(CRYPTO_THREADID *id)
 ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_ssl.c:3851:13: warning: ?_ssl_thread_locking_function? defined but not used [-Wunused-function]
 static void _ssl_thread_locking_function
             ^
building '_hashlib' extension
/usr/bin/gcc -pthread -fPIC -fno-strict-aliasing -O2 -I/home/agamez/test/output/host/usr/include -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -I. -IInclude -I./Include -I/home/agamez/test/output/host/usr/include -I/usr/include/x86_64-linux-gnu -I/usr/local/include -I/home/agamez/test/output/build/host-python-2.7.11/Include -I/home/agamez/test/output/build/host-python-2.7.11 -c /home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c -o build/temp.linux-x86_64-2.7/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.o
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:61:25: error: field ?ctx? has incomplete type
     EVP_MD_CTX          ctx;    /* OpenSSL message digest context */
                         ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c: In function ?EVP_dealloc?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:129:5: warning: implicit declaration of function ?EVP_MD_CTX_cleanup? [-Wimplicit-function-declaration]
     EVP_MD_CTX_cleanup(&self->ctx);
     ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c: In function ?EVP_digest?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:165:16: error: storage size of ?temp_ctx? isn?t known
     EVP_MD_CTX temp_ctx;
                ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:165:16: warning: unused variable ?temp_ctx? [-Wunused-variable]
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c: In function ?EVP_hexdigest?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:185:16: error: storage size of ?temp_ctx? isn?t known
     EVP_MD_CTX temp_ctx;
                ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:185:16: warning: unused variable ?temp_ctx? [-Wunused-variable]
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c: In function ?PKCS5_PBKDF2_HMAC_fast?:
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:521:14: error: storage size of ?hctx_tpl? isn?t known
     HMAC_CTX hctx_tpl, hctx;
              ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:521:24: error: storage size of ?hctx? isn?t known
     HMAC_CTX hctx_tpl, hctx;
                        ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:527:5: warning: implicit declaration of function ?HMAC_CTX_init? [-Wimplicit-function-declaration]
     HMAC_CTX_init(&hctx_tpl);
     ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:532:9: warning: implicit declaration of function ?HMAC_CTX_cleanup? [-Wimplicit-function-declaration]
         HMAC_CTX_cleanup(&hctx_tpl);
         ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:521:24: warning: unused variable ?hctx? [-Wunused-variable]
     HMAC_CTX hctx_tpl, hctx;
                        ^
/home/agamez/test/output/build/host-python-2.7.11/Modules/_hashopenssl.c:521:14: warning: unused variable ?hctx_tpl? [-Wunused-variable]
     HMAC_CTX hctx_tpl, hctx;
              ^

Python build finished, but the necessary bits to build these modules were not found:
_bsddb             _sqlite3           _tkinter        
bsddb185           bz2                dbm             
dl                 gdbm               imageop         
readline           sunaudiodev                        
To find the necessary bits, look in setup.py in detect_modules() for the module's name.


Failed to build these modules:
_hashlib           _ssl                               

Makefile:518: recipe for target 'sharedmods' failed
make[2]: *** [sharedmods] Error 1
package/pkg-generic.mk:195: recipe for target '/home/agamez/test/output/build/host-python-2.7.11/.stamp_built' failed
make[1]: *** [/home/agamez/test/output/build/host-python-2.7.11/.stamp_built] Error 2
common.mk:41: recipe for target 'default' failed
make: *** [default] Error 2

-- 
Alvaro G. M.
