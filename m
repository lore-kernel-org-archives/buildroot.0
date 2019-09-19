From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 19 Sep 2019 12:47:21 +0200
Subject: [Buildroot] [PATCH v2] package/python-bluezero: new package
In-Reply-To: <20190918211522.28a411b7@windsurf>
References: <20190830154716.30591-1-grzegorz@blach.pl>
 <20190903212422.3416-1-grzegorz@blach.pl> <20190917232757.2634846e@windsurf>
 <EEBC224B-B09E-423B-9200-13B7372BCF42@blach.pl>
 <e0dd3e01-9b03-a753-4c89-21d9926cef33@mind.be>
 <20190918211522.28a411b7@windsurf>
Message-ID: <30AB8C77-C952-42B7-8F7D-12D605E5D965@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 18 Sep 2019, at 21:15, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> On Wed, 18 Sep 2019 20:08:01 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> Python-bluezero has 4 main modules: central.py, peripheral.py, observer.py and broadcaster.py.
>>> central.py, peripheral.py and broadcaster.py use BlueZ through D-BUS,
>>> but observer.py uses python-aioblescan instead. And python-aioblescan uses AF_BLUETOOTH sockets.
>>> 
>>> So depending on what part of python-bluezero you use, it depends on D-Bus/BlueZ or python-aioblescan. 
>>> Personally I use python-bluezero in two projects. In the first project I use only peripheral.py (D-Bus/BlueZ).
>>> And in the second project I?m using observer.py (python-aioblescan), which means I don?t need D-Bus/BlueZ in my second project.
>>> 
>>> How to set dependencies in this situation?  
>> 
>> I think it's too complicated to handle with Kconfig, so I would just explain it
>> in the help text. E.g. "For central.py, peripheral.py and broadcaster.py you
>> need to enable the bluez5_utils package. For observer.py, you need to enable the
>> python-aioblescan package."
> 
> I entirely agree with this, and I was going to suggest exactly the same.


I just submitted an updated patch.


> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
