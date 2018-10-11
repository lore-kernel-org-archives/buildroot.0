From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Thu, 11 Oct 2018 12:25:17 +0000
Subject: [Buildroot] pppd - fails to build on current git.
Message-ID: <414f8bfe86f14594b5433f40b56bde6d@WETSRVEX02.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

pppd fails to build on current git-snapshot.


=================================================================

pppcrypt.c: In function 'DesSetkey':
pppcrypt.c:122:2: warning: implicit declaration of function 'setkey'; did you mean 'DesSetkey'? [-Wimplicit-function-declaration]
  setkey((const char *)crypt_key);
  ^~~~~~
  DesSetkey
pppcrypt.c: In function 'DesEncrypt':
pppcrypt.c:137:2: warning: implicit declaration of function 'encrypt'; did you mean 'crypt'? [-Wimplicit-function-declaration]
  encrypt((char *)des_input, 0);
  ^~~~~~~
  crypt
...
pppcrypt.o: In function `DesSetkey':
pppcrypt.c:(.text+0x140): undefined reference to `setkey'
pppcrypt.o: In function `DesEncrypt':
pppcrypt.c:(.text+0x184): undefined reference to `encrypt'
pppcrypt.o: In function `DesDecrypt':
pppcrypt.c:(.text+0x1dc): undefined reference to `encrypt'
collect2: error: ld returned 1 exit status
Makefile:217: recipe for target 'pppd' failed
make[3]: *** [pppd] Error 1
Makefile:13: recipe for target 'all' failed

==============================================================


Probably based on ongoing work as stated here : https://sourceware.org/ml/libc-alpha/2017-08/msg01257.html
"The function prototypes for crypt and encrypt are removed from unistd.h, and the function prototype for setkey is removed from
stdlib.h"


Regards
Noel
