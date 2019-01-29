From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 16:49:57 +0100
Subject: [Buildroot] [PATCH v7 3/8] package/pound: Fix build with
 OpenSSL 1.1.x
In-Reply-To: <20190129093919.22060-3-patrick.havelange@essensium.com> (Patrick
 Havelange's message of "Tue, 29 Jan 2019 10:39:14 +0100")
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
 <20190129093919.22060-3-patrick.havelange@essensium.com>
Message-ID: <87lg3379ay.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:

 > From: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

 > ---
 > Changes v7:
 >   - none

 > Changes v6:
 >   - none

This looks to break building against libressl:

/home/peko/source/buildroot/output-pound/host/bin/arm-none-linux-gnueabi-gcc -DF_CONF=\"/etc/pound.cfg\" -DVERSION=\"2.8\" -DC_SSL=\"\" -DC_T_RSA=\"0\" -DC_DH_LEN=\"2048\" -DC_MAXBUF=\"0\" -DC_OWNER=\"peko\" -DC_GROUP=\"peko\" -DC_SUPER=\"0\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -pthread -DUPER -DNEED_STACK -DHAVE_SYSLOG_H=1 -pthread -DDH_LEN=2048 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_REENTRANT -D_THREAD_SAFE -c -o svc.o svc.c
In file included from poundctl.c:28:0:
pound.h:348:3: warning: data definition has no type or storage class [enabled by default]
   DEFINE_LHASH_OF(TABNODE);
   ^
In file included from http.c:28:0:
pound.h:348:3: warning: data definition has no type or storage class [enabled by default]
   DEFINE_LHASH_OF(TABNODE);
   ^
In file included from pound.c:28:0:
pound.h:348:3: warning: data definition has no type or storage class [enabled by default]
   DEFINE_LHASH_OF(TABNODE);
   ^
In file included from config.c:32:0:
pound.h:348:3: warning: data definition has no type or storage class [enabled by default]
   DEFINE_LHASH_OF(TABNODE);
   ^
config.c: In function 't_hash':

-- 
Bye, Peter Korsgaard
