From: Dimitrios Siganos <dimitris@siganos.org>
Date: Mon, 08 Apr 2013 11:15:21 +0100
Subject: [Buildroot] [PATCH v4] wireless-regdb: new package
In-Reply-To: <516176AC.5040604@zacarias.com.ar>
References: <1364165118-6984-1-git-send-email-dimitris@siganos.org>
 <516176AC.5040604@zacarias.com.ar>
Message-ID: <516298B9.9040803@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/13 14:37, Gustavo Zacarias wrote:
> On 03/24/2013 07:45 PM, Dimitrios Siganos wrote:
> 
>> +define WIRELESS_REGDB_INSTALL_TARGET_CMDS
>> +    install -m 644 -D -T $(@D)/regulatory.bin $(TARGET_DIR)/usr/lib/crda/regulatory.bin
>> +    install -m 644 -D -T $(@D)/linville.key.pub.pem $(TARGET_DIR)/usr/lib/crda/pubkeys/linville.key.pub.pem
>> +endef
> 
> Hi.
> Doesn't crda expect the pubkeys in /etc/wireless-regdb/pubkeys path?
> At least that's the default and you didn't seem to change that in your
> crda v2 package.
> Regards.
> 
> 

Hi Gustavo,

You are absolutely right. We obviously use the non default location at
my company and I changed one package to use the default location but not
the other.

I will send a new patch.

Regards,
Dimitris
