From: Patrick <kpa_info@yahoo.fr>
Date: Wed, 13 Feb 2013 13:33:56 +0100
Subject: [Buildroot] [PATCH v3 0/5] Python 3, simple,
 external package support
In-Reply-To: <511B68EF.2000409@yahoo.fr>
References: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
 <511B5FA7.9050501@free-electrons.com> <511B68EF.2000409@yahoo.fr>
Message-ID: <511B8834.5050104@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/13/2013 11:20 AM, Patrick wrote:
> Hi Maxime,
>
> On 02/13/2013 10:40 AM, Maxime Ripard wrote:
>> Hi Patrick,
>>
>> I don't get why this python-common directory is needed. If the two
>> python are mutually exclusive, why can't we just declare the PYTHON
>> variable in their respective package makefiles?
>
> You are right it could be done as suggested.
>
> The Config.in file is
>> useless as well, just make a depends on !PYTHON3 in python, and !PYTHON
>> in python3, like Thomas suggested.
>
> As  I replied to Thomas this result in strange behaviour of the menu.
> When selecting/deselecting one of the python entry the menu do not
> handle properly the "circular reference" and it's almost unusable.
>

Maxim, Thomas,

Does it seems acceptable to you if I keep the menu like proposed in this 
patch series (including the file python-common/Config.in) but move the 
PYTHON variable definition in both python.mk and python3.mk and remove 
the python-common.mk file ?

Comments are welcomes

Patrick
