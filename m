From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Sep 2015 16:40:46 +0200
Subject: [Buildroot] [PATCHv2] package/kodi: needs .py modules
References: <1442178783-27567-1-git-send-email-yann.morin.1998@free.fr>
 <20150913232942.736dea75@free-electrons.com>
Message-ID: <ecnidcxjj2.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 13 Sep 2015 23:29:42 +0200 schrieb Thomas Petazzoni:

> Yann,
> 
> On Sun, 13 Sep 2015 23:13:03 +0200, Yann E. MORIN wrote:
>> Kodi segfaults as soon as it tries to load a python module:
>> 
>>     Could not find platform independent libraries <prefix> Consider
>>     setting $PYTHONHOME to <prefix>[:<exec_prefix>]
>>     ImportError: No module named site Segmentation fault
>> 
>> Turns out that keeping .py modules (with or without .pyc) fixes the
>> issue.
>> 
>> Currently, Kodi selects python, but since the format of modules is a
>> choice, we can not select it.
>> 
>> Fix that by inverting the dependency on python from Kodi:
>>   - turn it into a depends rather than a select,
>>   - add the dependency to ! pyc-only - update the comment accordingly.
>> 
>> Signed-off-by: "Yann E. MORIN"
>> <yann.morin.1998@free.fr>
> 
> Do we actually understand why it doesn't work? There is really no reason
> for .py files to be necessary.

Hi Thomas, hi Yann,

according to http://kodi.wiki/view/Add-on_rules Kodi apparently 
expects .py files in add-ons:

"All source files must be included. No pre-compiled files will be 
allowed."

Some more information about this can be found here:
http://forum.kodi.tv/showthread.php?tid=181065&pid=1580560#pid1580560
https://github.com/OpenELEC/OpenELEC.tv/issues/3335#issuecomment-51490468

I remember that several years ago I had problems after removing .py files 
from my xbmc/kodi box so I kept them ever since ;)

Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd
