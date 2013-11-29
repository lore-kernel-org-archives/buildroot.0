From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Nov 2013 11:43:18 -0300
Subject: [Buildroot] [PATCH] hostapd: fix static build failure
In-Reply-To: <20131129153900.1084221a@skate>
References: <1385735143-8323-1-git-send-email-gustavo@zacarias.com.ar>
 <20131129153900.1084221a@skate>
Message-ID: <5298A806.4030602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/29/2013 11:39 AM, Thomas Petazzoni wrote:
> So before this commit we were defining HOSTAPD_LDFLAGS...
> 
>> +HOSTAPD_LIBS += -lnl-3 -lm -lpthread
>>  endif
>>  
>>  define HOSTAPD_LIBNL_CONFIG
>> @@ -93,7 +94,7 @@ endef
>>  
>>  define HOSTAPD_BUILD_CMDS
>>  	$(TARGET_MAKE_ENV) CFLAGS="$(HOSTAPD_CFLAGS)" \
>> -		LDFLAGS="$(TARGET_LDFLAGS)" \
> 
> but not using it? :-)

Yes, there was brokeness!
Probably from the migration to hostapd-2.
Regards.
