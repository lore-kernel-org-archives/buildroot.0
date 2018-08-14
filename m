From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Aug 2018 01:20:29 +0200
Subject: [Buildroot] [PATCH 3/3] New <pkg>-update-last-config-fragment
 target in pkg-kconfig.mk
In-Reply-To: <20180814162705.505476fe@windsurf>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
 <20180730155153.24091-4-m.patzlaff@pilz.de>
 <20180730234643.34315d11@windsurf> <20180731154948.GB8537@scaer>
 <20180814162705.505476fe@windsurf>
Message-ID: <83afeab5-baf8-122e-15ab-17889c3a300d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-18 16:27, Thomas Petazzoni wrote:
> Hello,
> 
> Adding Arnout and Peter in Cc, in case they want to give their opinion
> on the patch series.
> 
> On Tue, 31 Jul 2018 17:49:48 +0200, Yann E. MORIN wrote:
> 
>> I would just suggest that we do not add any new rule, but trying to
>> update the defconfig when there are fragments would fail as it currently
>> does, but also would display the delta if there is one. I.e.:
>>
>>     $ make linux-menuconfig
>>     [change stuff]
>>     $ make linux-update-defconfig
>>     Unable to perform linux-update-defconfig when fragment files are set
>>     Configuration changes that you want to propagate to one of the fragments:
>>     -CONFIG_FOO=y
>>     +# CONFIG_BAR is unset
>>     linux/linux.mk:511: recipe for target 'linux-update-defconfig' failed
>>     make[1]: *** [linux-update-defconfig] Error 1
> 
> I think we could do that in *addition* to having a new rule. Indeed,
> when you know what you're doing, having to run something that doesn't
> make sense ("make linux-update-defconfig") and which causes a failure
> is a bit silly. I'd rather run "make linux-diff-config" (or whatever
> name we chose).
> 
> Marcel, do you think you could rework your patch series to go in the
> direction of showing a diff rather than arbitrarily adjusting the last
> fragment ?

 Note that the diff really applies to the last fragment only, in the sense that
if the last fragment is setting CONFIG_BAR, the "is unset" bit has to come after
it. I don't think there is a way to say anything sensible automatically except
for the last fragment.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
