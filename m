From: Joel Lindsay <joel@waveteq.com>
Date: Mon, 7 May 2007 11:15:31 -0700
Subject: [Buildroot] hidden symbol errors when compiling
Message-ID: <012a01c790d3$b322ccd0$aa64a8c0@JOELDESKTOP>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am cross compiling a package (wpa_supplicant) into the latest version of buildroot (binutils 2.17.1, GCC 4.2)

I am getting linker problems I don't understand, and am not sure whats causing it.  They have something to do with a hidden symbol in libgcc.a.  I am compiling against uClibc 0.9.28.

Any help would be appreciated.  Attached is the compiler error.  I have seen some messages that say to tweak some compat settings in uClibc, but I couldn't find the settings.

make[1]: Entering directory `/home/joel/projects/buildroot/build_armeb/wpa_supplicant-0.4.7'
/home/joel/projects/buildroot/build_armeb/staging_dir/bin/armeb-linux-uclibc-gcc -o wpa_supplicant config.o eloop.o common.o md5.o rc4.o sha1.o config_file.o base64.o l2_packet_linux.o eap_tls.o eap_peap.o eap_ttls.o eap_md5.o eap_mschapv2.o eap_leap.o eap_tlv.o eapol_sm.o eap.o eap_tls_common.o tls_openssl.o ms_funcs.o crypto.o wpa.o preauth.o aes_wrap.o wpa_supplicant.o events.o main.o drivers.o driver_madwifi.o driver_wext.o -L/home/joel/projects/buildroot/build_armeb/openssl-0.9.7e/ -lssl -lcrypto
/home/joel/projects/buildroot/build_armeb/staging_dir/lib/gcc/armeb-linux-uclibc/4.2.0/../../../../armeb-linux-uclibc/bin/ld: wpa_supplicant: hidden symbol `__clz_tab' in /home/joel/projects/buildroot/build_armeb/staging_dir/lib/gcc/armeb-linux-uclibc/4.2.0/libgcc.a(_clz.o) is referenced by DSO
/home/joel/projects/buildroot/build_armeb/staging_dir/lib/gcc/armeb-linux-uclibc/4.2.0/../../../../armeb-linux-uclibc/bin/ld: final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[1]: *** [wpa_supplicant] Error 1
make[1]: Leaving directory `/home/joel/projects/buildroot/build_armeb/wpa_supplicant-0.4.7'
make: *** [/home/joel/projects/buildroot/build_armeb/wpa_supplicant-0.4.7/wpa_supplicant] Error 2

Thanks,

Joel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070507/0a41e3de/attachment.htm 
