From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Jul 2015 12:35:16 +0200
Subject: [Buildroot] [PATCHv3] busybox: improve support for telnetd
In-Reply-To: <20150712080330.GA4008@free.fr>
References: <1436660410-13431-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150712080330.GA4008@free.fr>
Message-ID: <55A242E4.1000903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/12/15 10:03, Yann E. MORIN wrote:
> Thomas, Alexey, All,
> 
> On 2015-07-12 02:20 +0200, Thomas Petazzoni spake thusly:
>> From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
>>
>> If target has connection to the network it might be pretty useful to
>> have telnet connection to it instead of serial console or even in
>> addition to serial console.
> [--SNIP--]
>> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
>> index 92874cd..35f1e96 100644
>> --- a/package/busybox/busybox.mk
>> +++ b/package/busybox/busybox.mk
> [--SNIP--]
>> +define BUSYBOX_ADJUST_TELNET_SECURETTY
>> +	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y $(@D)/.config; then \
>> +		for i in `seq 0 3` ; do \
>> +			grep -q "pts/$$i" $(TARGET_DIR)/etc/securetty || \
>> +				echo "pts/$$i" >> $(TARGET_DIR)/etc/securetty ; \
> 
> Why don't we simply add those four in our securetty, directly in our
> skeleton?

 That renders securetty even more useless than it already is.

 Why don't we just remove CONFIG_FEATURE_SECURETTY from our default busybox
config and get rid of all the securetty hacks?

 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
