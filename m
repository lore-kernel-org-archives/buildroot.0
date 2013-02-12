From: Patrick <kpa_info@yahoo.fr>
Date: Tue, 12 Feb 2013 15:02:09 +0100
Subject: [Buildroot] [PATCH 1/5] In order to have a better support for
 python external package make the python menu clearer. Python2 and Python3
 are now mutually exclusive
In-Reply-To: <20130212134952.1b43d8b6@skate>
References: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
 <1360671849-7621-2-git-send-email-kpa_info@yahoo.fr>
 <20130212134952.1b43d8b6@skate>
Message-ID: <511A4B61.4070605@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/2013 01:49 PM, Thomas Petazzoni wrote:
> Dear Patrick Gerber,
>
> On Tue, 12 Feb 2013 13:24:05 +0100, Patrick Gerber wrote:
>>
>> Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
>> ---
>>   package/Config.in                |   19 +------------
>>   package/python-generic/Config.in |   56 ++++++++++++++++++++++++++++++++++++++
>>   package/python/Config.in         |   14 ----------
>>   package/python3/Config.in        |   14 ----------
>>   4 files changed, 57 insertions(+), 46 deletions(-)
>>   create mode 100644 package/python-generic/Config.in
>
> This seems really complicated. Can't we just have a depends
> on !BR2_PACKAGE_PYTHON in the python3 package, and a depends
> on !BR2_PACKAGE_PYTHON3 in the python package?
>
> Thomas
>

Hi Thomas,

This is not so complicated, I have only moved some lines from 
package/Config.in, package/python/Config.in and 
package/python3/Config.in to package/python-generic/Config.in and added 
few lines to handle the "choice" menu.

I have tried as you suggest but it have some strange behaviour...

If you care about the python-generic directory we need it also to add 
some "common" stuff to handle properly the support of both python's 
version by the external packages.

Patrick
