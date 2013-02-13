From: Patrick <kpa_info@yahoo.fr>
Date: Wed, 13 Feb 2013 11:20:31 +0100
Subject: [Buildroot] [PATCH v3 0/5] Python 3, simple,
 external package support
In-Reply-To: <511B5FA7.9050501@free-electrons.com>
References: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
 <511B5FA7.9050501@free-electrons.com>
Message-ID: <511B68EF.2000409@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On 02/13/2013 10:40 AM, Maxime Ripard wrote:
> Hi Patrick,
>
> Le 13/02/2013 10:20, Patrick Gerber a ?crit :
>> This patch series refactor python support in buildroot to enable the
>> use of external package with both; python2 and python3. The packages
>> python-bottle and python-serial have been adapted as examples.
>>
>> To support others external package more work is needed as they are
>> based on python setuptools. It's no more supported by python3 and
>> should be replaced by "Distribute". This should be done in another
>> patch series.
>
> I don't get why this python-common directory is needed. If the two
> python are mutually exclusive, why can't we just declare the PYTHON
> variable in their respective package makefiles?

You are right it could be done as suggested.

The Config.in file is
> useless as well, just make a depends on !PYTHON3 in python, and !PYTHON
> in python3, like Thomas suggested.

As  I replied to Thomas this result in strange behaviour of the menu. 
When selecting/deselecting one of the python entry the menu do not 
handle properly the "circular reference" and it's almost unusable.

> Moreover, I'm pretty concerned about the breakage of many
> configurations. You seem to assume here that all external modules can
> build on both python and python3, and I'm really not sure about that.

No. All the package that don't support python3 have in their Config.in a 
line like this: depends on BR2_PACKAGE_PYTHON
The same way potential package that support only python3 could have: 
depends on BR2_PACKAGE_PYTHON3

> Maxime
>

Patrick
