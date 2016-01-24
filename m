From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 24 Jan 2016 17:33:24 +0200 (IST)
Subject: [Buildroot] [PATCH v4 1/4] Add yp-tools and ypbind-mt to
 packages menu
In-Reply-To: <20160124160920.0fb91f86@free-electrons.com>
References: <1453647303-3965-1-git-send-email-yba@tkos.co.il>
 <1453647303-3965-2-git-send-email-yba@tkos.co.il>
 <20160124160920.0fb91f86@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1601241724060.4122@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Jan 2016, Thomas Petazzoni wrote:

> Date: Sun, 24 Jan 2016 16:09:20 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH v4 1/4] Add yp-tools and ypbind-mt to packages
>      menu
> 
> Jonathan,
>
> On Sun, 24 Jan 2016 16:55:00 +0200, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>> ---
>>  package/Config.in |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 09c2b40..af9656b 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1482,6 +1482,8 @@ endif
>>  	source "package/xinetd/Config.in"
>>  	source "package/xl2tp/Config.in"
>>  	source "package/xtables-addons/Config.in"
>> +	source "package/yp-tools/Config.in"
>> +	source "package/ypbind-mt/Config.in"
>
> This should not be a separate patch. Instead, adding yp-tools to the
> menu should be part of the patch adding the yp-tools package, and
> adding ypbind-mt to the menu should be part of the patch adding the
> ypbind-mt package.

That is, one patch should look something like

 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
  +	source "package/yp-tools/Config.in"
 	source "package/znc/Config.in"


and the other should look like

 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
  +	source "package/ypbind-mt/Config.in"
 	source "package/znc/Config.in"

?

And then we rely on the order of the application of the patches to 
determine the order of the items in the final Config.in?

  - yba


> Thanks!
>
> Thomas
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
