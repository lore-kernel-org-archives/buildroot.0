From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Sep 2019 20:08:01 +0200
Subject: [Buildroot] [PATCH v2] package/python-bluezero: new package
In-Reply-To: <EEBC224B-B09E-423B-9200-13B7372BCF42@blach.pl>
References: <20190830154716.30591-1-grzegorz@blach.pl>
 <20190903212422.3416-1-grzegorz@blach.pl> <20190917232757.2634846e@windsurf>
 <EEBC224B-B09E-423B-9200-13B7372BCF42@blach.pl>
Message-ID: <e0dd3e01-9b03-a753-4c89-21d9926cef33@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/09/2019 11:49, Grzegorz Blach wrote:
> Hello Thomas,
> 
>> On 17 Sep 2019, at 23:27, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello Grzegorz,
>>
>> On Tue,  3 Sep 2019 21:24:22 +0000
>> Grzegorz Blach <grzegorz@blach.pl> wrote:
>>
>>> Python library for Bluetooth Low Energy (BLE) on Linux.
>>>
>>> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
>>> ---
>>> Changes v1 -> v2:
>>>  - Removed BR2_PACKAGE_PYTHON_AIOBLESCAN from runtime dependencies
>>>    since this is an optional dependency (used only by observer.py
>>>    module).
>>
>> My understanding is that this Python module talks over D-Bus to BlueZ,
>> and therefore it cannot work without BlueZ. Shouldn't this package then
>> have some dependency on BlueZ, such as a "depends on?
> 
> Python-bluezero has 4 main modules: central.py, peripheral.py, observer.py and broadcaster.py.
> central.py, peripheral.py and broadcaster.py use BlueZ through D-BUS,
> but observer.py uses python-aioblescan instead. And python-aioblescan uses AF_BLUETOOTH sockets.
> 
> So depending on what part of python-bluezero you use, it depends on D-Bus/BlueZ or python-aioblescan. 
> Personally I use python-bluezero in two projects. In the first project I use only peripheral.py (D-Bus/BlueZ).
> And in the second project I?m using observer.py (python-aioblescan), which means I don?t need D-Bus/BlueZ in my second project.
> 
> How to set dependencies in this situation?

 I think it's too complicated to handle with Kconfig, so I would just explain it
in the help text. E.g. "For central.py, peripheral.py and broadcaster.py you
need to enable the bluez5_utils package. For observer.py, you need to enable the
python-aioblescan package."

 Regards,
 Arnout
