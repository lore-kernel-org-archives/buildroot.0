From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 06 May 2018 19:17:28 +0200
Subject: [Buildroot] [RFC v2 3/3] freeswitch: bump to git
 master8f10ae54a18a19fc6ed938e4f662bd218ba54b5e
References: <20180503212436.2521-1-ps.report@gmx.net>
 <20180503212436.2521-3-ps.report@gmx.net> <20180503234802.5a0e48e6@gmx.net>
Message-ID: <8up3sexvvk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 03 May 2018 23:48:02 +0200 schrieb Peter Seiderer:

>> +# run bootstrap.sh (normal AUTORECONF is broken)
>> +define FREESWITCH_RUN_BOOTSTRAP +	cd $(@D) && ./bootstrap.sh +endef 
+
>> +FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_RUN_BOOTSTRAP
> 
> ...needs additional:
> 
> FREESWITCH_DEPENDENCIES += host-automake host-autoconf host-libtool

Hi Peter,

and

-       cd $(@D) && ./bootstrap.sh
+       cd $(@D) && PATH=$(BR_PATH) ./bootstrap.sh

otherwise libtool will not be found:

cd /home/buildroot/br8/output/build/freeswitch-
ed4920e792c25e67e8fd2435fe9ab0163a45e6d9 && ./bootstrap.sh
bootstrap: checking installation...
bootstrap: autoconf version 2.69 (ok)
bootstrap: automake version 1.15 (ok)
bootstrap: aclocal version 1.15 (ok)
bootstrap: libtool not found.
You need libtool version 1.5.14 or newer to build FreeSWITCH from source.

Regards, Bernd
