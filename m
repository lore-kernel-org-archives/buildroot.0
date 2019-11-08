From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Fri, 8 Nov 2019 10:17:00 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/python-esptool: new package
In-Reply-To: <483e9989-ac40-cfdd-de79-78088c70ab89@grinn-global.com>
References: <20191107170504.1327891-1-b.bilas@grinn-global.com>
 <20191107170504.1327891-2-b.bilas@grinn-global.com>
 <20191107235045.667813a1@windsurf>
 <44e04441-7a39-7770-6ce7-6dcc5fee3870@grinn-global.com>
 <20191108094927.49828a98@windsurf>
 <483e9989-ac40-cfdd-de79-78088c70ab89@grinn-global.com>
Message-ID: <1b5aa6b2-be6c-7685-9fcb-ab3b01b1253b@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've forgotten about Yegor in Cc.

Best
Bartek
On 08.11.2019 10:06, Bartosz Bilas wrote:
> Hello guys,
>
> On 08.11.2019 09:49, Thomas Petazzoni wrote:
>> Hello,
>>
>> +Yegor in Cc.
>>
>> On Fri, 8 Nov 2019 09:45:50 +0100
>> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>>
>>>>> +PYTHON_ESPTOOL_LICENSE = GNU General Public License v2 or later 
>>>>> (GPLv2+)
>>>> The proper way to describe this is just:
>>>>
>>>> PYTHON_ESPTOOL_LICENSE = GPL-2.0+
>>> this was created using scanpypi script so do you think we should fix
>>> that script or adjust that manually as you did?
>> scanpipy already has a conversion table between Pipy-provided license
>> strings and Buildroot license tags:
>>
>> ???????????????? 'Apache Software License': 'Apache-2.0',
>> ???????????????? 'BSD License': 'FIXME: please specify the exact BSD 
>> version',
>> ???????????????? 'European Union Public Licence 1.0': 'EUPL-1.0',
>> ???????????????? 'European Union Public Licence 1.1': 'EUPL-1.1',
>> ???????????????? "GNU General Public License": "GPL",
>> ???????????????? "GNU General Public License v2": "GPL-2.0",
>> ???????????????? "GNU General Public License v2 or later": "GPL-2.0+",
>> ???????????????? "GNU General Public License v3": "GPL-3.0",
>> ???????????????? "GNU General Public License v3 or later": "GPL-3.0+",
>> ???????????????? "GNU Lesser General Public License v2": "LGPL-2.1",
>> ???????????????? "GNU Lesser General Public License v2 or later": 
>> "LGPL-2.1+",
>> ???????????????? "GNU Lesser General Public License v3": "LGPL-3.0",
>> ???????????????? "GNU Lesser General Public License v3 or later": 
>> "LGPL-3.0+",
>> ???????????????? "GNU Library or Lesser General Public License": 
>> "LGPL-2.0",
>> ???????????????? "ISC License": "ISC",
>> ???????????????? "MIT License": "MIT",
>> ???????????????? "Mozilla Public License 1.0": "MPL-1.0",
>> ???????????????? "Mozilla Public License 1.1": "MPL-1.1",
>> ???????????????? "Mozilla Public License 2.0": "MPL-2.0",
>> ???????????????? "Zope Public License": "ZPL"
>>
>> Obviously, the value "GNU General Public License v2 or later (GPLv2+)"
>> that was used by this package didn't match any entry in this table.
>> Since "GNU General Public License v2 or later (GPLv2+)" is apparently
>> rarely used, I don't think it's worth adding an entry to the table: for
>> such cases, we simply have to do a manual fixup. In any case,
>> ./utils/scanpipy does not guarantee that it provides a fully working
>> and correct Buildroot package: it extracts most information from Pipy,
>> but a careful review, and possibly some changes may be necessary.
>
> I assume that's the same for that comment bellow:
>
> > +config BR2_PACKAGE_PYTHON_ESPTOOL
> > +??? bool "python-esptool"
> > +??? select BR2_PACKAGE_PYTHON_SERIAL # runtime
> > +??? select BR2_PACKAGE_PYTHON_PYAES # runtime
> > +??? select BR2_PACKAGE_PYTHON_ECDSA # runtime
>
> Alphabetic ordering.
>
> but I think it wouldn't be difficult to handle it in the script.
>
> Best
> Bartek
>>
>> Best regards,
>>
>> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
