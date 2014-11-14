From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Nov 2014 19:27:56 -0300
Subject: [Buildroot] [PATCH 07/10] dhcp: install dhclient to /sbin
In-Reply-To: <54667F72.4050009@mind.be>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-8-git-send-email-gustavo@zacarias.com.ar>
 <54667F72.4050009@mind.be>
Message-ID: <546681EC.90805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/14/2014 07:17 PM, Arnout Vandecappelle wrote:

>> --- a/package/dhcp/dhcp.mk
>> +++ b/package/dhcp/dhcp.mk
>> @@ -59,7 +59,7 @@ define DHCP_INSTALL_CLIENT
>>  	mkdir -p $(TARGET_DIR)/var/lib
>>  	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
>>  	$(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient \
>> -		$(TARGET_DIR)/usr/sbin/dhclient
>> +		$(TARGET_DIR)/sbin/dhclient
> 
>  Then you should also update network-manager.mk:
> 
> NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/usr/sbin/dhclient

Evidently nobody used it because it never worked out of the box (because
of the lack of a proper dhclient-script) ;)
I'll adjust it.
Regards.
