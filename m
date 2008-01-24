From: Ming-Ching Tiew <mingching.tiew@redtone.com>
Date: Wed, 23 Jan 2008 22:15:19 -0500
Subject: [Buildroot] can't develope any programs using ssl in the root
Message-ID: <479802C7.9090108@redtone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I wonder what I am doing wrong, I have enabled openssl and included
the header in the root, but in the root environment, I can't develope
any program which requires openssl, configure will fail with this error
( the example below is tcpdump ) :-

configure:12791: checking for SSLeay
configure:12833: result: /usr
configure:12845: checking for DES_cbc_encrypt in -lcrypto
configure:12875: gcc -o conftest -DINET6 -g -O2  -L/usr/lib  conftest.c 
-lcrypto  ./../libpcap-0.9.5/libpcap.a  >&5
configure:12881: $? = 0
configure:12885: test -z
             || test ! -s conftest.err
configure:12888: $? = 0
configure:12891: test -s conftest
configure:12894: $? = 0
configure:12907: result: yes
configure:12934: checking openssl/evp.h usability
configure:12946: gcc -c -DINET6 -g -O2  -I./../libpcap-0.9.5  
-I/usr/include conftest.c >&5
In file included from /usr/include/openssl/asn1.h:68,
                 from /usr/include/openssl/rsa.h:63,
                 from /usr/include/openssl/evp.h:150,
                 from conftest.c:102:
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:301: error: 
expected specifier-qualifier-list before 'BIGNUM'
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:314: error: 
expected specifier-qualifier-list before 'BIGNUM'
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:331: error: 
expected declaration specifiers or '...' before 'BN_GENCB'
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:335: error: 
expected ')' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:393: error: 
expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:395: error: 
expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:397: error: 
expected ')' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:399: error: 
expected ')' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:400: error: 
expected ')' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:401: error: 
expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:402: error: 
expected ')' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:403: error: 
expected ')' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:404: error: 
expected ')' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:405: error: 
expected ')' before '*' token
/usr/lib/gcc/i686-linux-uclibc/4.2.0/include/openssl/bn.h:406: error: 
expected ')' before '*' token

Anyone has a clue ?



--------------------------------------------
Important Warning! 

*************************** 

This electronic communication (including any attached files) may contain confidential and/or legally privileged information and is only intended for the use of the person to whom it is addressed. If you are not the intended recipient, you do not have permission to read, use, disseminate, distribute, copy or retain any part of this communication or its attachments in any form. If this e-mail was sent to you by mistake, please take the time to notify the sender so that they can identify the problem and avoid any more mistakes in sending e-mail to you. The unauthorised use of information contained in this communication or its attachments may result in legal action against any person who uses it.
