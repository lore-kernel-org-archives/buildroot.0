From: Paul Cercueil <paul@crapouillou.net>
Date: Sat, 14 Dec 2019 19:12:41 +0100
Subject: [Buildroot] [PATCH] Revert "package/dialog: bump version to
 1.3-20190808"
In-Reply-To: <20191214151847.7af647a4@windsurf.home>
References: <20191206133802.127863-1-paul@crapouillou.net>
 <20191214151847.7af647a4@windsurf.home>
Message-ID: <1576347161.3.3@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


Le sam., d?c. 14, 2019 at 15:18, Thomas Petazzoni 
<thomas.petazzoni@bootlin.com> a ?crit :
> On Fri,  6 Dec 2019 14:38:02 +0100
> Paul Cercueil <paul@crapouillou.net> wrote:
> 
>>  The 1.3-20190808 version looks extremely buggy.
>>  For instance, if you try to open a dialog using this command:
>>  dialog --no-shadow --msgbox "test test test" 10 32
>> 
>>  - the --no-shadow attribute doesn't seem to work anymore, since the
>>    frame will sill have a shadow,
>>  - the text shown within the frame won't be "test test test" as 
>> expected,
>>    but "testtesttest".
>> 
>>  These bugs make the program completely unusable, so revert to the 
>> last
>>  known good version.
>> 
>>  This partly reverts commit 6a2ebcaf6a.
>> 
>>  The license hash and URL update from ftp to https were not modified
>>  back.
>> 
>>  Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   package/dialog/dialog.hash | 1 +
>>   package/dialog/dialog.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> Peter has submitted a version bump of the dialog package, which I have
> just applied. It is supposed to fix the issues you've seen I believe.
> Could you test it ?

Yes, we were debugging it through emails with the author. The new 
version does fix the issues listed above.

Cheers,
-Paul


> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
