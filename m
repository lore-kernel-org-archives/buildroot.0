From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 4 Aug 2015 19:37:14 +0300 (IDT)
Subject: [Buildroot] [PATCH 1/1] rapidxml: new package
In-Reply-To: <20150803195742.GJ3345@tarshish>
References: <1438625054-7118-1-git-send-email-yba@tkos.co.il>
 <20150803195742.GJ3345@tarshish>
Message-ID: <alpine.DEB.2.02.1508041932350.7707@orcam81.orcam.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Mon, 3 Aug 2015, Baruch Siach wrote:

> Date: Mon, 3 Aug 2015 22:57:42 +0300
> From: Baruch Siach <baruch@tkos.co.il>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1] rapidxml: new package
> 
> Hi Yonatan,
>
> On Mon, Aug 03, 2015 at 09:04:14PM +0300, Jonathan Ben-Avraham wrote:
>> +RAPIDXML_VERSION = 1.13
>> +RAPIDXML_SOURCE = rapidxml-$(RAPIDXML_VERSION).zip
>> +
>> +#RAPIDXML_SITE = http://sourceforge.net/projects/rapidxml/files/latest/download
>
> Please remove.
>
>> +RAPIDXML_SITE = http://garr.dl.sourceforge.net/project/rapidxml/rapidxml/rapidxml%201.13/
>
> Does
>
> RAPIDXML_SITE = http://sourceforge.net/project/rapidxml/rapidxml/rapidxml%20$(RAPIDXML_VERSION)/
>
> work?
>
>> +RAPIDXML_LICENSE = MIT
>> +RAPIDXML_LICENSE_FILES = license.txt
>> +RAPIDXML_INSTALL_TARGET = NO
>
> This needs an explanation comment. Is this a header only package?
>
>> +RAPIDXML_INSTALL_STAGING = YES
>> +
>> +define RAPIDXML_EXTRACT_CMDS
>> +	$(UNZIP) -d $(@D) $(DL_DIR)/$(RAPIDXML_SOURCE)
>> +endef
>> +
>> +define RAPIDXML_INSTALL_STAGING_CMDS
>> +	cp -dpfr $(@D)/rapidxml-$(RAPIDXML_VERSION)/*hpp $(STAGING_DIR)/usr/include
>> +endef
>> +
>> +$(eval $(generic-package))
>
> baruch

I removed the commented line and added the version variable to the 
RAPIDXML_SITE value as per your request in the v2 patch submitted just 
now.

Regarding "This needs an explanation comment. Is this a header only 
package?", you can see from RAPIDXML_INSTALL_TARGET = NO and 
RAPIDXML_INSTALL_STAGING = YES that the answer must be "yes". I did not 
see a need to add a comment since the precedent package "rapidjson", also 
has no comment.

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
